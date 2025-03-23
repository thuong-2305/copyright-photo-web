package vn.edu.hcmuaf.fit.coriphoto.controller;


import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.datetime.LocalDateTimeTypeAdapter;
import vn.edu.hcmuaf.fit.coriphoto.datetime.LocalDateTypeAdapter;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.google.gson.Gson;

@WebServlet(name = "ProductControll", value = "/products")
public class ProductControll extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        ProductService productService = new ProductService();
        CategoryService categoryService = new CategoryService();

        //      get products
        List<Product> products = productService.getByCategoryId(cid);
        request.setAttribute("products", products);

        //      get path
        String duongdan = categoryService.getById(cid).getName();
        request.setAttribute("duongdan", duongdan);
        request.setAttribute("cid", cid);

        //      get products popular sorted
        List<Product> productPopular = productService.getProductPopular(cid);
        request.setAttribute("productPopular", productPopular);

        //      get products popular sorted
        List<Product> productLatest = productService.getProductLatest(cid);
        request.setAttribute("productLatest", productLatest);

        List<Product> productSorted = productService.getProductPopular(cid);
        try {
            //      get products type sorted
            String sortType = request.getParameter("sortType");
            if (sortType != null) {
                System.out.println(sortType);
                if ("popular".equals(sortType)) {
                    productSorted = productService.getProductPopular(cid);
                } else if ("latest".equals(sortType)) {
                    productSorted = productService.getProductLatest(cid);
                } }
        } catch (Exception _) { }
// Thêm logic phân trang
        int page = 1; // Trang mặc định
        int productsPerPage = 9; // Mỗi trang hiển thị 9 sản phẩm
        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
                if (page < 1) page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        // Tính toán phân trang
        int totalProducts = productSorted.size();
        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);


        // Lấy danh sách sản phẩm cho trang hiện tại
        int startIndex = (page - 1) * productsPerPage;
        int endIndex = Math.min(startIndex + productsPerPage, totalProducts);
        System.out.println(startIndex+" "+endIndex);
        productSorted = productSorted.subList(startIndex, endIndex);
        // Trả về danh sách sản phẩm đã sắp xếp dưới dạng JSON
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter())
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeTypeAdapter())
                .create();
        String json = gson.toJson(productSorted);
        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With"))) {
            // Trả về JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            return;
        }

        request.setAttribute("productSorted", productSorted);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số lọc
        int cid = Integer.parseInt(request.getParameter("cid"));
        String sizeFilter = request.getParameter("size");
        String dateFilter = request.getParameter("date");
        String[] formatFilters = request.getParameterValues("formats");

        // Lấy tham số trang
        int page = 1;
        try {
            String pageParam = request.getParameter("page");
            if (pageParam != null && !pageParam.isEmpty()) {
                page = Integer.parseInt(pageParam);
            }
        } catch (NumberFormatException e) {
            page = 1;
        }

        // Lấy danh sách sản phẩm gốc
        ProductService productService = new ProductService();
        List<Product> products = productService.getByCategoryId(cid);

        // Lọc sản phẩm theo các tiêu chí
        List<Product> filteredProducts = new ArrayList<>(products);

        // Lọc theo kích thước
        if (sizeFilter != null && !sizeFilter.equals("all")) {
            filteredProducts = filteredProducts.stream()
                    .filter(product -> {
                        String size = product.getSize();
                        if (size == null) return false;

                        switch (sizeFilter) {
                            case "small":
                                return isSmallSize(size); // ≤ 1MB
                            case "medium":
                                return isMediumSize(size); // 1-5MB
                            case "large":
                                return isLargeSize(size); // 5-10MB
                            case "very-large":
                                return isVeryLargeSize(size); // ≥ 10MB
                            default:
                                return true;
                        }
                    })
                    .collect(Collectors.toList());
        }

        // Lọc theo ngày
        if (dateFilter != null && !dateFilter.equals("any")) {
            LocalDateTime now = LocalDateTime.now();
            filteredProducts = filteredProducts.stream()
                    .filter(product -> {
                        LocalDateTime uploadDate = product.getDateUpload();
                        if (uploadDate == null) return false;

                        switch (dateFilter) {
                            case "last-24h":
                                return uploadDate.isAfter(now.minusDays(1));
                            case "last-week":
                                return uploadDate.isAfter(now.minusWeeks(1));
                            case "last-month":
                                return uploadDate.isAfter(now.minusMonths(1));
                            case "last-year":
                                return uploadDate.isAfter(now.minusYears(1));
                            default:
                                return true;
                        }
                    })
                    .collect(Collectors.toList());
        }

        // Lọc theo định dạng
        if (formatFilters != null && formatFilters.length > 0) {
            filteredProducts = filteredProducts.stream()
                    .filter(product -> {
                        String url = product.getUrl();
                        if (url == null) return false;

                        for (String format : formatFilters) {
                            if (url.toLowerCase().endsWith("." + format.toLowerCase())) {
                                return true;
                            }
                        }
                        return false;
                    })
                    .collect(Collectors.toList());
        }

        // Xử lý phân trang
        int productsPerPage = 9;
        int totalProducts = filteredProducts.size();
        int totalPages = (int) Math.ceil((double) totalProducts / productsPerPage);

        // Đảm bảo trang hiện tại nằm trong phạm vi hợp lệ
        if (page < 1) page = 1;
        if (page > totalPages && totalPages > 0) page = totalPages;

        // Lấy sản phẩm cho trang hiện tại
        int startIndex = (page - 1) * productsPerPage;
        int endIndex = Math.min(startIndex + productsPerPage, totalProducts);

        List<Product> pagedProducts;
        if (startIndex < totalProducts) {
            pagedProducts = filteredProducts.subList(startIndex, endIndex);
        } else {
            pagedProducts = new ArrayList<>();
        }

        // Tạo đối tượng JSON chứa sản phẩm và thông tin phân trang
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("products", pagedProducts);

        Map<String, Object> pagination = new HashMap<>();
        pagination.put("currentPage", page);
        pagination.put("totalPages", totalPages);
        pagination.put("totalProducts", totalProducts);

        responseData.put("pagination", pagination);

        // Chuyển đối tượng JSON thành chuỗi
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter())
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeTypeAdapter())
                .create();
        String jsonResponse = gson.toJson(responseData);

        // Trả về kết quả dưới dạng JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);
    }

    // Các phương thức hỗ trợ để kiểm tra kích thước
    private boolean isSmallSize(String size) {
        try {
            // Giả sử size được lưu dưới dạng "X MB" hoặc "X KB"
            String[] parts = size.split(" ");
            double value = Double.parseDouble(parts[0]);
            String unit = parts[1].toUpperCase();

            if (unit.equals("KB")) {
                return value <= 1024; // <= 1MB
            } else if (unit.equals("MB")) {
                return value <= 1; // <= 1MB
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu cần thiết
        }
        return false;
    }

    private boolean isMediumSize(String size) {
        try {
            String[] parts = size.split(" ");
            double value = Double.parseDouble(parts[0]);
            String unit = parts[1].toUpperCase();

            if (unit.equals("MB")) {
                return value > 1 && value <= 5; // 1-5MB
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu cần thiết
        }
        return false;
    }

    private boolean isLargeSize(String size) {
        try {
            String[] parts = size.split(" ");
            double value = Double.parseDouble(parts[0]);
            String unit = parts[1].toUpperCase();

            if (unit.equals("MB")) {
                return value > 5 && value <= 10; // 5-10MB
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu cần thiết
        }
        return false;
    }

    private boolean isVeryLargeSize(String size) {
        try {
            String[] parts = size.split(" ");
            double value = Double.parseDouble(parts[0]);
            String unit = parts[1].toUpperCase();

            if (unit.equals("MB")) {
                return value > 10; // > 10MB
            }
        } catch (Exception e) {
            // Xử lý ngoại lệ nếu cần thiết
        }
        return false;
    }
}
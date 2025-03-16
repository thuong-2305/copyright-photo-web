package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.*;
import com.google.gson.annotations.JsonAdapter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.ProductSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminProductsController", value = "/admin-products")
public class AdminProductsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            try {
                int productId = Integer.parseInt(id);
                ProductService productService = new ProductService();
                Product product = productService.getById(productId);
                if (product != null) {
                    response.setContentType("application/json");
                    Gson gson = new GsonBuilder()
                        .registerTypeAdapter(LocalDate.class, new JsonSerializer<LocalDate>() {
                            @Override
                            public JsonElement serialize(LocalDate src, Type typeOfSrc, JsonSerializationContext context) {
                                return new JsonPrimitive(src.toString());
                            }
                        })
                        .registerTypeAdapter(LocalDateTime.class, new JsonSerializer<LocalDateTime>() {
                            @Override
                            public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
                                return new JsonPrimitive(src.toString());
                            }
                        })
                        .registerTypeAdapter(Product.class, new ProductSerializer())
                        .create();
                    String jsonResponse = gson.toJson(product);
                    response.getWriter().write(jsonResponse);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sản phẩm không tồn tại");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ");
            }
        } else {
            ProductService service = new ProductService();
            // Lấy danh sách sp từ service
            List<Product> products = service.getAll();
            // Gửi danh sách sp tới JSP
            request.setAttribute("products", products);
            request.getRequestDispatcher("admin-products.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedBy = request.getHeader("X-Requested-By");
        ProductService service = new ProductService();

        // Xóa sản phẩm dựa vào id
        if ("AJAX".equals(requestedBy)) {
            int productId =Integer.parseInt(request.getParameter("product_id"));
            String action = request.getParameter("action");

            if ("delete".equals(action)) {
                boolean success = service.deleteProductById(productId);
                if (success) {
                    // Trả về dữ liệu JSON cho AJAX
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    // Tạo đối tượng Gson
                    Gson gson = new Gson();

                    Map<String, Object> responseData = new HashMap<>();
                    responseData.put("success", true);
                    // Chuyển đối tượng Map thành JSON
                    String jsonResponse = gson.toJson(responseData);
                    // Gửi dữ liệu JSON về client
                    response.getWriter().write(jsonResponse);
                }
            }
        }
        else {
            String form = request.getParameter("defineForm");
            // Nhận dữ liệu từ form
            String name = request.getParameter("nameProduct");
            String description = request.getParameter("description");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            String contributor = request.getParameter("contributor");
            String status = request.getParameter("status");

            // Tạo đối tượng Product
            Product product = new Product();
            product.setName(name);
            product.setDescription(description);
            product.setCid(Integer.parseInt(category));
            product.setPrice(price);
            product.setUid(Integer.parseInt(contributor));
            product.setStatus(status);

            if ("formEdit".equals(form)) {
                product.setId(Integer.parseInt(request.getParameter("idProduct")));
                service.updateProduct(product);
            }else {
                service.addProduct(product);
            }

            response.sendRedirect("admin-products");
        }
    }
}
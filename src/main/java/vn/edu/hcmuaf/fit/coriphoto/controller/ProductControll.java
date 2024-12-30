package vn.edu.hcmuaf.fit.coriphoto.controller;


import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.datetime.LocalDateTypeAdapter;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
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

        // Trả về danh sách sản phẩm đã sắp xếp dưới dạng JSON hoặc HTML.
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new LocalDateTypeAdapter())
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

        request.getRequestDispatcher("products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
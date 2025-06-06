package vn.edu.hcmuaf.fit.coriphoto.controller;


import ch.qos.logback.core.net.SyslogOutputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        ProductService productService = new ProductService();
        UserService userService = new UserService();
        Product product = productService.getById(pid);
        String fullName = userService.getFullName(product.getUid());
        List<Product> products = productService.getProductsRelated(product.getCid(), pid);
        request.setAttribute("product", product);
        request.setAttribute("products", products);
        request.setAttribute("fullName", fullName);
        request.getRequestDispatcher("product_details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    }
}
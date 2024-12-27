package vn.edu.hcmuaf.fit.coriphoto.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductControll", value = "/products")
public class ProductControll extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        ProductService productService = new ProductService();
        CategoryService categoryService = new CategoryService();
        List<Product> products = productService.getByCategoryId(cid);
        request.setAttribute("products", products);
        String duongdan = categoryService.getById(cid).getName();
        request.setAttribute("duongdan", duongdan);
        request.setAttribute("cid", cid);

        List<Category> categories = categoryService.getAll();
        request.setAttribute("categories", categories);

        String latest = request.getParameter("latest");
        System.out.println(latest);
        request.getRequestDispatcher("products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    }
}
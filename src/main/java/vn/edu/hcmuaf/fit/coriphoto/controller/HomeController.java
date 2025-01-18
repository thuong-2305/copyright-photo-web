package vn.edu.hcmuaf.fit.coriphoto.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.model.CategoryParent;
import vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/")
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        List<TrendProducts> trendProducts = productService.getTopTrend();
        request.setAttribute("trendsProducts", trendProducts);

        CategoryService categoryService = new CategoryService();
        List<Category> trendCategories = categoryService.getTrendCategory();
        request.setAttribute("trendsCategories", trendCategories);

        List<CategoryParent> categoriesParent = categoryService.getTypeImages();
        request.setAttribute("categoriesParent", categoriesParent);

        String notification = (String) request.getSession().getAttribute("notification");
        if (notification != null) {
            request.setAttribute("notification", notification);
            request.getSession().removeAttribute("notification");
        }
        request.getRequestDispatcher("homepage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
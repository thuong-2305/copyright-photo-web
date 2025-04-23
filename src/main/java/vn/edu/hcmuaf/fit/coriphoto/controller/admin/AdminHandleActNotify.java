package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminHandleActNotify", value = "/AdminHandleActNotify")
public class AdminHandleActNotify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String act = (String) request.getParameter("act");
        int id = Integer.parseInt(request.getParameter("id"));

        ProductService productService = new ProductService();
        productService.updateStatus(act, id);
        List<Product> products = productService.getAllProductsWaiting();
        request.setAttribute("products", products);

        request.getRequestDispatcher("admin-notification.jsp").forward(request,response);
    }
}
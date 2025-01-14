package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductsController", value = "/admin-products")
public class AdminProductsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService service = new ProductService();
        // Lấy danh sách sp từ service
        List<Product> products = service.getAll();
//        for (Product p : products) {
//            System.out.println(p.getName());
//        }
        // Gửi danh sách sp tới JSP
        request.setAttribute("products", products);

        request.getRequestDispatcher("admin-products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
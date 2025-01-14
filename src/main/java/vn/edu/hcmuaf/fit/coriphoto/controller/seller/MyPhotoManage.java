package vn.edu.hcmuaf.fit.coriphoto.controller.seller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.SellerService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MyPhotoManage", value = "/MyPhotoManage")
public class MyPhotoManage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        request.setAttribute("auth", user);

        SellerService sellerService = new SellerService();
        List<Product> dsAccept = sellerService.getAllProducts(user.getUid(), "accepted");
        request.setAttribute("accepts", dsAccept);

        request.getRequestDispatcher("myphoto-seller.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
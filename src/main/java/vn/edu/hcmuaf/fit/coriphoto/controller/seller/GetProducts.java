package vn.edu.hcmuaf.fit.coriphoto.controller.seller;


import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.SellerService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "GetProducts", value = "/getProducts")
public class GetProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        User user = (User) request.getSession().getAttribute("auth");

        System.out.println(type);

        // Kiểm tra user hợp lệ
        if (user == null) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"error\":\"User not authenticated\"}");
            return;
        }

        SellerService sellerService = new SellerService();
        List<Product> products = new ArrayList<>();

        if ("accepts".equals(type)) {
            products = sellerService.getAllProducts(user.getUid(), "accepted");
        } else if ("waits".equals(type)) {
            products = sellerService.getAllProducts(user.getUid(), "waiting");
        } else if ("rejects".equals(type)) {
            products = sellerService.getAllProducts(user.getUid(), "rejected");
        } else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"error\":\"Invalid type\"}");
            return;
        }

        System.out.println(products.size());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("products", products);
        out.print(jsonResponse.toString());
        out.flush();
        out.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
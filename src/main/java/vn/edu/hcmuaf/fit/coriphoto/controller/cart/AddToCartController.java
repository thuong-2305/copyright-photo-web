package vn.edu.hcmuaf.fit.coriphoto.controller.cart;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.datetime.LocalDateTypeAdapter;
import vn.edu.hcmuaf.fit.coriphoto.model.Cart;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddToCartController", value = "/addToCart")
public class AddToCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        Map<String, Object> data;

// Đọc dữ liệu từ request và xử lý JSON
        try (BufferedReader reader = request.getReader()) {
            data = gson.fromJson(reader, Map.class);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            response.getWriter().write("{\"error\": \"Invalid JSON format\"}");
            return;
        }

// Kiểm tra dữ liệu "pid"
        int pid;
        try {
            if (data == null || !data.containsKey("pid")) {
                throw new IllegalArgumentException("Missing 'pid' in request");
            }
            pid = Integer.parseInt(data.get("pid").toString());
            System.out.println("Received Product ID: " + pid);
        } catch (NullPointerException | IllegalArgumentException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            response.getWriter().write("{\"error\": \"Invalid or missing product ID\"}");
            return;
        }

// Kiểm tra người dùng (session)
        User user = (User) request.getSession().getAttribute("auth");
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401 Unauthorized
            response.getWriter().write("{\"error\": \"User not authenticated\"}");
            return;
        }

        int uid = user.getUid();
        System.out.println("User ID: " + uid);

// Thêm sản phẩm vào giỏ hàng
        CartService cartService = new CartService();
        boolean success;
        Cart cart;
        int cartLen;

        try {
            success = cartService.addToCart(pid, uid);
            cart = cartService.getCart(uid);
            cartLen = cart != null ? cart.getNumItems() : 0;
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500 Internal Server Error
            response.getWriter().write("{\"error\": \"Failed to process cart operation\"}");
            return;
        }

// Chuẩn bị dữ liệu trả về
        Map<String, Object> responseMap = new HashMap<>();
        responseMap.put("success", success);
        responseMap.put("cartLen", cartLen);

        String jsonResponse = gson.toJson(responseMap);

// Gửi phản hồi
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse);

    }
}
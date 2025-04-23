package vn.edu.hcmuaf.fit.coriphoto.controller.favourite;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.dao.FavouriteDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AddFavourite", value = "/AddFavourite")
public class AddFavourite extends HttpServlet {
    private final FavouriteDAO favoriteDAO = new FavouriteDAO();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        try {
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("auth");

            if (currentUser == null) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Vui lòng đăng nhập để sử dụng tính năng này.");
                out.print(jsonResponse.toString());
                return;
            }

            String productIdParam = request.getParameter("productId");

            if (productIdParam == null || productIdParam.isEmpty()) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "ID sản phẩm không hợp lệ.");
                out.print(jsonResponse.toString());
                return;
            }

            int productId = Integer.parseInt(productIdParam);
            int userId = currentUser.getUid();
            String action = request.getParameter("action");

            if ("add".equals(action)) {
                boolean isFavorite = favoriteDAO.checkFavouriteExists(userId, productId);

                if (isFavorite) {
                    jsonResponse.put("success", false);
                    jsonResponse.put("message", "Sản phẩm đã có trong danh sách yêu thích.");
                } else {
                    favoriteDAO.addFavourite(userId, productId);
                    jsonResponse.put("success", true);
                    jsonResponse.put("message", "Đã thêm sản phẩm vào danh sách yêu thích.");
                }
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Hành động không hợp lệ.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Đã xảy ra lỗi: " + e.getMessage());
        }

        out.print(jsonResponse.toString());
    }

}

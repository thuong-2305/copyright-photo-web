package vn.edu.hcmuaf.fit.coriphoto.controller.favourite;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.dao.FavouriteDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RemoveFavourite", value = "/RemoveFavourite")
public class RemoveFavourite extends HttpServlet {
    private final FavouriteDAO favouriteDAO = new FavouriteDAO();

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

            String action = request.getParameter("action");
            int userId = currentUser.getUid();

            if ("remove".equals(action)) {
                // Xử lý xóa 1 sản phẩm (code cũ)
            }
            else if ("bulkRemove".equals(action)) {
                // Xử lý xóa nhiều sản phẩm
                String productIdsParam = request.getParameter("productIds"); // JSON Array String
                if (productIdsParam == null || productIdsParam.isEmpty()) {
                    jsonResponse.put("success", false);
                    jsonResponse.put("message", "Danh sách ID sản phẩm trống.");
                    out.print(jsonResponse.toString());
                    return;
                }
                // Chuyển chuỗi JSON -> mảng ID
                org.json.JSONArray idsArray = new org.json.JSONArray(productIdsParam);

                int countRemoved = 0;
                for (int i = 0; i < idsArray.length(); i++) {
                    int productId = idsArray.getInt(i);
                    boolean removed = favouriteDAO.removeFavourite(userId, productId);
                    if (removed) countRemoved++;
                }

                if (countRemoved > 0) {
                    jsonResponse.put("success", true);
                    jsonResponse.put("message", "Đã xóa " + countRemoved + " sản phẩm khỏi danh sách yêu thích.");
                } else {
                    jsonResponse.put("success", false);
                    jsonResponse.put("message", "Không có sản phẩm nào được xóa.");
                }
            }
            else {
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
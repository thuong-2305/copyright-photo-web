package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;
import java.io.IOException;

@WebServlet(name = "ResetPassword", value = "/ResetPassword")
public class ResetPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonRequest = new JSONObject(request.getReader().lines().reduce("", String::concat));
        String newPassword = jsonRequest.getString("newPassword");
        String confirmPassword = jsonRequest.getString("confirmPassword");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email"); // Lấy email từ session
        UserService userService = new UserService();
        int uid = userService.getUidByEmail(email);
        JSONObject jsonResponse = new JSONObject();

        if (newPassword.equals(confirmPassword)) {
            // Thực hiện cập nhật mật khẩu trong database
            boolean success = userService.changePassword(uid, newPassword);

            if (success) {
                jsonResponse.put("status", "success");
                jsonResponse.put("message", "Mật khẩu đã được đặt lại thành công.");

                // Xóa toàn bộ session sau khi hoàn tất
                session.invalidate();
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Có lỗi xảy ra. Vui lòng thử lại.");
            }
        } else {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Mật khẩu xác nhận không khớp.");
        }

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }
}

package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ForgotPassword", value = "/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonRequest = new JSONObject(request.getReader().lines().reduce("", String::concat));
        String email = jsonRequest.getString("email");

        UserService userService = new UserService();
        boolean exists = userService.isExistEmail(email);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        if (exists) {
            int otp = EmailUtils.generateOTP();
            HttpSession session = request.getSession();
            session.setAttribute("email", email);
            session.setAttribute("otp_" + email, otp);
            session.setAttribute("otp_expiry_" + email, System.currentTimeMillis() + 5 * 60 * 1000); // 5 phút

            boolean emailSent = EmailUtils.sendEmail(email, "Mã OTP của bạn", "Mã OTP để đặt lại mật khẩu của bạn là: " + otp);

            if (emailSent) {
                jsonResponse.put("exists", true);
                jsonResponse.put("message", "OTP đã được gửi đến email.");
            } else {
                jsonResponse.put("exists", false);
                jsonResponse.put("message", "Không thể gửi email, vui lòng thử lại.");
            }
        } else {
            jsonResponse.put("exists", false);
            jsonResponse.put("message", "Email không tồn tại trong hệ thống.");
        }

        out.print(jsonResponse);
        out.flush();
    }
}

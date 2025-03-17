package vn.edu.hcmuaf.fit.coriphoto.controller.login;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterVerifyEmail", value = "/RegisterVerifyEmail")
public class RegisterVerifyEmail extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        AuthService authService = new AuthService();

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        // Kiểm tra email có hợp lệ không
        if (authService.isEmailExist(email) || !EmailUtils.isValidEmail(email)) {
            jsonResponse.put("valid", false);
        } else {
            jsonResponse.put("valid", true);
            out.print(jsonResponse.toString());
            out.flush(); // Trả phản hồi ngay lập tức để hiển thị modal nhanh hơn

            // Gửi OTP trong background thread
            new Thread(() -> {
                int otp = EmailUtils.generateOTP();
                HttpSession session = request.getSession();
                session.setAttribute("otp_" + email, otp);
                session.setAttribute("otp_expiry_" + email, System.currentTimeMillis() + 2 * 60 * 1000);
                EmailUtils.sendEmail(email, "Mã OTP", "Mã OTP của bạn là: " + otp);
            }).start();

            return; // Dừng luồng chính để không delay phản hồi
        }

        out.print(jsonResponse.toString());
        out.flush();
    }
}

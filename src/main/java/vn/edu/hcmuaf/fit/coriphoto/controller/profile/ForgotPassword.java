package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@WebServlet(name = "ForgotPassword", value = "/ForgotPassword")
public class ForgotPassword extends HttpServlet {
    private static final ExecutorService executorService = Executors.newFixedThreadPool(10);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonRequest = new JSONObject(request.getReader().lines().reduce("", String::concat));
        String email = jsonRequest.getString("email");

        UserService userService = new UserService();
        boolean exists = userService.isExistEmail(email);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        HttpSession session = request.getSession();
        Long lockedUntil = (Long) session.getAttribute("otp_locked_until_" + email);
        long currentTime = System.currentTimeMillis();

        if (exists) {
            // Kiểm tra trạng thái khóa
            if (lockedUntil != null && currentTime < lockedUntil) {
                long remainingTime = (lockedUntil - currentTime) / 1000 / 60; // Tính phút còn lại
                jsonResponse.put("exists", false);
                jsonResponse.put("message", "Bạn không thể nhận OTP mới trong " + remainingTime + " phút do nhập sai quá nhiều lần!");
            } else {
                int otp = EmailUtils.generateOTP();
                session.setAttribute("email", email);
                session.setAttribute("otp_" + email, otp);
                session.setAttribute("otp_expiry_" + email, System.currentTimeMillis() + 5 * 60 * 1000); // 5 phút

                executorService.submit(() -> {
                    try {
                        boolean emailSent = EmailUtils.sendEmail(email, "Mã OTP của bạn",
                                "Mã OTP để đặt lại mật khẩu của bạn là: " + otp);
                        if (!emailSent) {
                            System.err.println("Failed to send OTP email to: " + email);
                        }
                    } catch (Exception e) {
                        System.err.println("Error sending email: " + e.getMessage());
                    }
                });

                jsonResponse.put("exists", true);
                jsonResponse.put("message", "OTP đã được gửi đến email.");
            }
        } else {
            jsonResponse.put("exists", false);
            jsonResponse.put("message", "Email không tồn tại trong hệ thống.");
        }

        out.print(jsonResponse);
        out.flush();
    }

    @Override
    public void destroy() {
        executorService.shutdown();
        super.destroy();
    }
}
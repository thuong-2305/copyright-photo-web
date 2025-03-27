package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import java.io.IOException;

@WebServlet("/VerifyForgotPassword")
public class VerifyForgotPassword extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONObject jsonRequest = new JSONObject(request.getReader().lines().reduce("", String::concat));
        int userOtp = jsonRequest.getInt("otp");

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        JSONObject jsonResponse = new JSONObject();

        if (email == null) {
            jsonResponse.put("status", "error");
            jsonResponse.put("message", "Không tìm thấy email trong phiên làm việc. Vui lòng thử lại.");
            jsonResponse.put("attempts", 0);
        } else {
            Integer attempts = (Integer) session.getAttribute("otp_attempts_" + email);
            if (attempts == null) {
                attempts = 0;
            }

            Long lockedUntil = (Long) session.getAttribute("otp_locked_until_" + email);
            long currentTime = System.currentTimeMillis();

            if (lockedUntil != null && currentTime < lockedUntil) {
                long remainingTime = (lockedUntil - currentTime) / 1000 / 60; // Tính phút còn lại
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Bạn không thể xác minh OTP trong " + remainingTime + " phút do nhập sai quá nhiều lần!");
                jsonResponse.put("attempts", attempts);
            } else {
                Integer storedOtp = (Integer) session.getAttribute("otp_" + email);
                Long otpExpiry = (Long) session.getAttribute("otp_expiry_" + email);

                if (storedOtp == null || otpExpiry == null) {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Không tìm thấy OTP. Vui lòng yêu cầu lại.");
                    jsonResponse.put("attempts", attempts);
                } else if (currentTime > otpExpiry) {
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Mã OTP đã hết hạn. Vui lòng yêu cầu mã mới.");
                    jsonResponse.put("attempts", attempts);
                    session.removeAttribute("otp_" + email);
                    session.removeAttribute("otp_expiry_" + email);
                } else if (storedOtp == userOtp) {
                    jsonResponse.put("status", "success");
                    session.setAttribute("otpVerified", true);
                    session.removeAttribute("otp_" + email);
                    session.removeAttribute("otp_expiry_" + email);
                    session.setAttribute("otp_attempts_" + email, 0); // Reset attempts
                } else {
                    attempts++;
                    session.setAttribute("otp_attempts_" + email, attempts);
                    jsonResponse.put("status", "error");
                    jsonResponse.put("message", "Mã OTP không chính xác.");
                    jsonResponse.put("attempts", attempts);

                    if (attempts >= 5) {
                        session.setAttribute("otp_locked_until_" + email, currentTime + (10 * 60 * 1000)); // Khóa 10 phút
                    }
                }
            }
        }

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }
}
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
        } else {
            Integer storedOtp = (Integer) session.getAttribute("otp_" + email);
            Long otpExpiry = (Long) session.getAttribute("otp_expiry_" + email);
            long currentTime = System.currentTimeMillis();

            if (storedOtp == null || otpExpiry == null) {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Không tìm thấy OTP. Vui lòng yêu cầu lại.");
            } else if (currentTime > otpExpiry) {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Mã OTP đã hết hạn. Vui lòng yêu cầu mã mới.");
                session.removeAttribute("otp_" + email);
                session.removeAttribute("otp_expiry_" + email);
            } else if (storedOtp == userOtp) {
                jsonResponse.put("status", "success");
                session.setAttribute("otpVerified", true);
                session.removeAttribute("otp_" + email);
                session.removeAttribute("otp_expiry_" + email); // Xóa OTP sau khi xác minh thành công
            } else {
                jsonResponse.put("status", "error");
                jsonResponse.put("message", "Mã OTP không chính xác.");
            }
        }

        response.setContentType("application/json");
        response.getWriter().write(jsonResponse.toString());
    }
}

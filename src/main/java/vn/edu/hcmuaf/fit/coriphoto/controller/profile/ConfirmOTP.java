package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;

import java.io.IOException;

@WebServlet(name = "ConfirmOTP", value = "/ConfirmOTP")
public class ConfirmOTP extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer storedOtp = (Integer) session.getAttribute("otp"); // OTP đã lưu trong session
        String otpInput = request.getParameter("otp");

        if (storedOtp != null && otpInput != null) {
            try {
                int userOtp = Integer.parseInt(otpInput);
                if (userOtp == storedOtp) {
                    response.getWriter().write("success");
                } else {
                    response.getWriter().write("fail");
                }
            } catch (NumberFormatException e) {
                response.getWriter().write("fail");
            }
        } else {
            response.getWriter().write("fail");
        }
    }

}

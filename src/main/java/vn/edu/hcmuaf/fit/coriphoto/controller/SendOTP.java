package vn.edu.hcmuaf.fit.coriphoto.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.services.EmailUtils;

import java.io.IOException;

import javax.mail.*;
import javax.mail.internet.*;
import java.security.SecureRandom;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

@WebServlet(name = "SendOTP", value = "/SendOTP")
public class SendOTP extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");

        // Check if the user is logged in
        if (currentUser != null) {
            String email = currentUser.getEmail();
            int otp = EmailUtils.generateOTP();

            try {
                String subject = "Mã OTP xác thực thay đổi email";
                String message = "Mã OTP của bạn là: " + otp + ". Vui lòng không chia sẻ mã này với bất kỳ ai.";
                EmailUtils.sendEmail(email, subject, message);

                // Store OTP in session and return success
                session.setAttribute("otp", otp);
                response.getWriter().write("success");  // Send "success" back to the client
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("error");  // Send "error" back to the client if there is an issue
            }
        } else {
            // If user is not logged in, redirect to profile edit page
            response.sendRedirect("editprofile.jsp");
        }
    }

}

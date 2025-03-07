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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        AuthService authService = new AuthService();

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        if (authService.isEmailExist(email) || !EmailUtils.isValidEmail(email)) {
            jsonResponse.put("valid", false);
        } else {
            int otp = EmailUtils.generateOTP();
            HttpSession session = request.getSession();
            session.setAttribute("otp_" + email, otp);
            session.setAttribute("otp_expiry_" + email, System.currentTimeMillis() + 5 * 60 * 1000);
            EmailUtils.sendEmail(email, "Mã OTP", "Mã OTP của bạn là: " + otp);
            jsonResponse.put("valid", true);
        }

        out.print(jsonResponse.toString());
        out.flush();
    }

}
package vn.edu.hcmuaf.fit.coriphoto.controller.login;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "RegisterVerifyOTP", value = "/RegisterVerifyOTP")
public class RegisterVerifyOTP extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String otpInput = request.getParameter("otp");

        HttpSession session = request.getSession();
        int storedOtp = (int) session.getAttribute("otp_" + email);
        long expiryTime = (long) session.getAttribute("otp_expiry_" + email);

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        if (System.currentTimeMillis() > expiryTime) {
            jsonResponse.put("valid", false);
            jsonResponse.put("message", "OTP đã hết hạn!");
        } else if (Integer.parseInt(otpInput) == storedOtp) {
            jsonResponse.put("valid", true);
        } else {
            jsonResponse.put("valid", false);
            jsonResponse.put("message", "OTP không chính xác!");
        }

        out.print(jsonResponse.toString());
        out.flush();
    }
}
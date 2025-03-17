package vn.edu.hcmuaf.fit.coriphoto.controller.login;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;

import java.io.IOException;

@WebServlet(name = "SignupController", value = "/signup")
public class SignupController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển đến trang đăng ký (signup.jsp)
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String name = request.getParameter("name");

        /* không cần kiểm tra vì đã kiểm tra trước khi hiện otp modal đăng kí (register-verify-email.js)
        String confirmPassword = request.getParameter("confirmPassword");
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu không khớp!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
         */

        AuthService authService = new AuthService();
        boolean isCreated = authService.registerUser(email, password, username, name);

        if (isCreated) {
            request.getSession().setAttribute("signupMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Đăng ký thất bại!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}

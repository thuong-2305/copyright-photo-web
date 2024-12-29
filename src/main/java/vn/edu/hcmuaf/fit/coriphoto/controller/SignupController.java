package vn.edu.hcmuaf.fit.coriphoto.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;

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
        // Lấy thông tin từ form đăng ký
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("username");

        AuthService authService = new AuthService();

        // Kiểm tra xem email đã tồn tại chưa
        if (authService.isEmailExist(email)) {
            // Nếu email đã tồn tại, gửi lại thông báo lỗi
            request.setAttribute("error", "Email đã được sử dụng!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        } else {
            // Nếu email chưa tồn tại, tạo tài khoản mới
            boolean isCreated = authService.registerUser(email, password, username);
            if (isCreated) {
                // Chuyển hướng đến trang đăng nhập sau khi đăng ký thành công
                response.sendRedirect("login.jsp");
            } else {
                // Thông báo lỗi nếu không thể tạo tài khoản
                request.setAttribute("error", "Đăng ký không thành công, vui lòng thử lại!");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }
        }
    }
}

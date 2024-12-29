package vn.edu.hcmuaf.fit.coriphoto.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.services.AuthService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsps/login-signup/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AuthService service = new AuthService();
        if(service.checkLogin(email,password)) {
            // Tạo session cho người dùng
            HttpSession session = request.getSession();

            // Lấy thông tin người dùng
            User user = service.getUserByEmail(email);

            // Lưu thông tin vào session
            session.setAttribute("currentUser", user);
            session.setMaxInactiveInterval(30 * 60); // 30 phút timeout
            response.sendRedirect("index.jsp");
        }else{
            request.setAttribute("error","Dang Nhap Khong Thanh Cong");
            request.getRequestDispatcher("/jsps/login-signup/login.jsp").forward(request,response);
        }
    }
}
package vn.edu.hcmuaf.fit.coriphoto.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AuthService service = new AuthService();
        User user = service.checkLogin(email, password);

        if(user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            session.setAttribute("loggedInUser", user);
            response.sendRedirect("/");
        }else{
            request.setAttribute("email", email);
            request.setAttribute("error","Email hoặc mật khẩu không đúng.");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }
}
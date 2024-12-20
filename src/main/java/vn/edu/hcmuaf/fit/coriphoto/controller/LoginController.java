package vn.edu.hcmuaf.fit.coriphoto.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.services.AuthService;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AuthService service = new AuthService();
        System.out.println(email);
        if(service.checkLogin(email,password)) {
            System.out.println(password);
            response.sendRedirect("/CoRiPhoTo/jsps/login-signup/login.jsp");
        }else{
            request.setAttribute("error","Dang Nhap Khong Thanh Cong");
            request.getRequestDispatcher("/CoRiPhoTo/jsps/login-signup/signup.jsp").forward(request,response);
        }
    }
}
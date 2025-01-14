package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCustomerController", value = "/admin-customer")
public class AdminCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        List<User> users = userService.getAllCustomers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin-customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String modal = request.getParameter("defineForm");

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AuthService authService = new AuthService();
        authService.registerUser(email,password,username);

        response.sendRedirect("admin-customer");
    }
}
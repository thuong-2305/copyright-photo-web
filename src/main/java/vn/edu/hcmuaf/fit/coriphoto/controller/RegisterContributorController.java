package vn.edu.hcmuaf.fit.coriphoto.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.Seller;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;

import javax.swing.text.DateFormatter;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "RegisterContributorController", value = "/register-contributor")
public class RegisterContributorController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        request.setAttribute("email", user.getEmail());
        request.setAttribute("uname", user.getUsername());

        request.getRequestDispatcher("register-contributor.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String username = request.getParameter("username");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        AuthService service = new AuthService();

        //Ktra tt user nếu có thay đổi email/username để cập nhật lại
        user.setEmail(email);
        user.setUsername(username);
        user.setRole(1);//role người bán
        boolean successRegisSeller = service.registerSeller(user);

        request.setAttribute("successRegisSeller", successRegisSeller);
        request.getRequestDispatcher("register-contributor.jsp").forward(request, response);
    }
}
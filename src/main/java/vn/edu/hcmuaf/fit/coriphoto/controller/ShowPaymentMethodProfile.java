package vn.edu.hcmuaf.fit.coriphoto.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.PaymentMethod;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.services.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShowPaymentMethodProfile", value = "/ShowPaymentMethodProfile")
public class ShowPaymentMethodProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        UserService userService = new UserService();
        List<PaymentMethod> paymentMethods = userService.getAllPaymentMethods(currentUser.getUid());

        boolean hasCard = paymentMethods.stream().anyMatch(payment -> payment.getPmTypeId() == 1);
        boolean hasBankAccount = paymentMethods.stream().anyMatch(payment -> payment.getPmTypeId() == 2);

        request.setAttribute("hasCard", hasCard);
        request.setAttribute("hasBankAccount", hasBankAccount);
        request.setAttribute("paymentMethods", paymentMethods);
        request.getRequestDispatcher("payment-method.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

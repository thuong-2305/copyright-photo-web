package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.services.UserService;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "AddCreditCard", value = "/AddCreditCard")
public class AddCreditCard extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser != null) {
            int uid = currentUser.getUid();
            String cardNumber = request.getParameter("cardNumber");
            String cardExpiryDateStr = request.getParameter("cardExpiryDate");
            LocalDate cardExpiryDate = LocalDate.parse(cardExpiryDateStr);
            String cvcStr = request.getParameter("cvc");
            int cvc = Integer.parseInt(cvcStr);
            int pmTypeId = 1;

            String provider = request.getParameter("provider");
            String cardName = request.getParameter("cardName");


            UserService userService = new UserService();
            boolean success = userService.addPaymentMethodCard(uid, cardName, cardNumber, pmTypeId, provider, cardExpiryDate, cvc);
            if (success) {
                session.setAttribute("addCardSuccess", "Bạn đã thêm thẻ tín dụng/ghi nợ thành công!");
                response.sendRedirect("ShowPaymentMethodProfile");

            }
            else {
                session.setAttribute("addCardError", "Thêm thẻ thất bại");
                response.sendRedirect("ShowPaymentMethodProfile");
            }
        }
        else {
            response.sendRedirect("login.jsp");
        }






    }
}

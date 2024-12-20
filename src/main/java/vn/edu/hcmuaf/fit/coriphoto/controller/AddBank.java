package vn.edu.hcmuaf.fit.coriphoto.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.services.UserService;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet(name = "AddBank", value = "/AddBank")
public class AddBank extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser != null) {
            int uid = currentUser.getUid();
            String bankName = request.getParameter("bankName");
            String accountNumber = request.getParameter("accountNumber");
            String accountHolder = request.getParameter("accountHolder");
            String accountExpiryDateStr = request.getParameter("accountExpiryDate");
            LocalDate accountExpiryDate = LocalDate.parse(accountExpiryDateStr);
            int pmTypeId = 2;

            UserService userService = new UserService();
            boolean sucess = userService.addPaymentMethodBank(uid, accountHolder,accountNumber,pmTypeId, bankName, accountExpiryDate);
            if (sucess) {
                session.setAttribute("addBankSuccess", "Bạn đã thêm tài khoản ngân hàng thành công!");
                response.sendRedirect("ShowPaymentMethodProfile");

            }
            else {
                session.setAttribute("addBankError", "Thêm tài khoản ngân hàng thất bại");
                response.sendRedirect("ShowPaymentMethodProfile");
            }
        }
        else {
            response.sendRedirect("login.jsp");
        }



    }
}

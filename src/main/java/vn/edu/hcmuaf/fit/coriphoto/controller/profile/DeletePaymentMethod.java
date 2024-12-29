package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.services.UserService;

import java.io.IOException;

@WebServlet(name = "DeletePaymentMethod", value = "/DeletePaymentMethod")
public class DeletePaymentMethod extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser != null) {
            String pmid = request.getParameter("pmid");
            UserService userService = new UserService();
            boolean isDeleted = userService.deletePaymentMethodById(Integer.parseInt(pmid));
            if (isDeleted) {
                session.setAttribute("deleteSuccess", "Xóa thành công");
                response.sendRedirect("ShowPaymentMethodProfile");
            } else {
                session.setAttribute("deleteError", "Xóa thất bại!");
                response.sendRedirect("ShowPaymentMethodProfile");
            }
        }
        else {
            response.sendRedirect("login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

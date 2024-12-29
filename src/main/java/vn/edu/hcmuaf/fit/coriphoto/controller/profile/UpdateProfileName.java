package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;

@WebServlet(name = "UpdateProfileName", value = "/UpdateProfileName")
public class UpdateProfileName extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        String newFullName = request.getParameter("fullname");
        if (newFullName != null && !newFullName.trim().isEmpty()) {
            UserService userService = new UserService();
            boolean success = userService.updateProfileName(currentUser.getUid(), newFullName);

            if (success) {
                currentUser.setFullName(newFullName);
                session.setAttribute("loggedInUser", currentUser);
                session.setAttribute("success", "Cập nhật tên thành công!");
            } else {
                session.setAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại.");
            }
        } else {
            session.setAttribute("error", "Tên không được để trống.");
        }
        response.sendRedirect("ShowProfileInformation");
    }

}

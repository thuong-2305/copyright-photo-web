package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.services.UserService;

import java.io.IOException;

@WebServlet(name = "ChangePassword", value = "/ChangePassword")
public class ChangePassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng đến trang thay đổi mật khẩu
        request.getRequestDispatcher("change-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số từ form
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int userId = currentUser.getUid();
        UserService userService = new UserService();
        if (userService.isOldPasswordCorrect(userId, oldPassword)) {
            if (newPassword.equals(confirmPassword)) {
                boolean isChanged = userService.changePassword(userId, newPassword);
                if (isChanged) {
                    currentUser.setPassword(newPassword);
                    session.setAttribute("loggedInUser", currentUser);
                    request.setAttribute("successMessage", "Mật khẩu đã được thay đổi thành công!");
                    request.getRequestDispatcher("change-password.jsp").forward(request, response);
                } else {
                    request.setAttribute("errorMessage", "Không thể thay đổi mật khẩu. Vui lòng thử lại.");
                    request.getRequestDispatcher("change-password.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("errorMessage", "Mật khẩu mới và xác nhận mật khẩu không khớp.");
                request.getRequestDispatcher("change-password.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Mật khẩu cũ không chính xác.");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
        }
    }
}


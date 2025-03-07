package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;

@WebServlet(name = "ChangeEmail", value = "/ChangeEmail")
public class ChangeEmail extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userOtp = request.getParameter("otp");
        String newEmail = request.getParameter("newEmail");

        HttpSession session = request.getSession();
        int otp = (int) session.getAttribute("otp");

        if (String.valueOf(otp).equals(userOtp)) {
            try {
                AuthService authService = new AuthService();
                // Kiểm tra email đã tồn tại chưa
                if (authService.isEmailExist(newEmail)) {
                    response.getWriter().write("emailExists");
                    return;
                }

                if (!EmailUtils.isValidEmail(newEmail)) {
                    response.getWriter().write("invalidEmail");
                    return;
                }

                UserService userService = new UserService();
                User currentUser = (User) session.getAttribute("loggedInUser");
                userService.updateProfileEmail(currentUser.getUid(), newEmail);

                currentUser.setEmail(newEmail);
                session.setAttribute("loggedInUser", currentUser);
                session.removeAttribute("otp");
                response.getWriter().write("success");

            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("error");
            }
        } else {
            response.getWriter().write("invalidOtp");
        }
    }
}

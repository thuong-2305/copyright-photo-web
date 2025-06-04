package vn.edu.hcmuaf.fit.coriphoto.controller.login;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.*;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "SignupController", value = "/signup")
public class SignupController extends HttpServlet {
    public static final List<Integer> DEFAULT_PERMISSION_IDS = new ArrayList<>(Arrays.asList(1));


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển đến trang đăng ký (signup.jsp)
        request.getRequestDispatcher("signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String username = request.getParameter("username");
        String name = request.getParameter("name");

        /* không cần kiểm tra vì đã kiểm tra trước khi hiện otp modal đăng kí (register-verify-email.js)
        String confirmPassword = request.getParameter("confirmPassword");
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu không khớp!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
         */



        AuthService authService = new AuthService();
        UserService userService = new UserService();
        boolean isCreated = authService.registerUser(email, password, username, name);

        if (isCreated) {
            int uid = userService.getUidByEmail(email);
            for (Integer permissionId : DEFAULT_PERMISSION_IDS) {
                int idPR = new PermissionRoleService().getIdPRByIdPermission(permissionId);
                new PermissionUserService().insertPermissionUser(idPR, uid);
            }
            request.getSession().setAttribute("signupMessage", "Đăng ký thành công! Vui lòng đăng nhập.");
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("error", "Đăng ký thất bại!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}

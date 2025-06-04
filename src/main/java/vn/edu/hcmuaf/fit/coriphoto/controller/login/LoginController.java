package vn.edu.hcmuaf.fit.coriphoto.controller.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.controller.login.constant.GoogleAccount;
import vn.edu.hcmuaf.fit.coriphoto.controller.login.constant.LoginGoogle;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;
import vn.edu.hcmuaf.fit.coriphoto.service.PermissionRoleService;
import vn.edu.hcmuaf.fit.coriphoto.service.PermissionUserService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    private final AuthService authService = new AuthService();
    private final UserService userService = new UserService();
    private final LogService logService = new LogService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isLoginGoogle = false;
        String code = request.getParameter("code");

        if (code != null) {
            LoginGoogle google = new LoginGoogle();
            String accessToken = google.getToken(code);
            GoogleAccount account = google.getUserInfo(accessToken);

            if (account != null) {
                User user = authService.getUserByEmail(account.getEmail());
                if (user == null) {
                    authService.registerUser(account.getEmail(), "", "", account.getName());
                    user = authService.getUserByEmail(account.getEmail());
                }

                LocalDateTime lockUntil = authService.getLockUntil(user.getUid());
                if (lockUntil != null && lockUntil.isAfter(LocalDateTime.now())) {
                    request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa đến " + lockUntil);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }

                HttpSession session = request.getSession(true);
                session.setAttribute("auth", user);
                session.setAttribute("loggedInUser", user);
                isLoginGoogle = true;

                // Ghi log đăng nhập
                ActivityLog loginLog = new ActivityLog("INFO", user.getUid(),
                        user.getUsername(), LocalDateTime.now(),
                        user.getUsername() + " đã đăng nhập bằng Google");
                logService.insertLog(loginLog);
            }
        }

        if (isLoginGoogle) {
            response.sendRedirect("homepage");
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = authService.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("errorEmail", "Email không tồn tại.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        int uid = user.getUid();
        LocalDateTime lockUntil = authService.getLockUntil(uid);
        if (lockUntil != null && lockUntil.isAfter(LocalDateTime.now())) {
            request.setAttribute("email", email);
            request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa đến " + lockUntil);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        int failedAttempts = authService.countFailedLoginAttempts(uid);
        int failedAttemptsInHour = authService.countFailedLoginAttemptsInHour(uid);

        if (failedAttempts >= 5) {
            authService.updateLockUntil(uid);
            request.setAttribute("email", email);
            request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa tạm thời trong 10 phút do nhập sai quá 5 lần.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (failedAttemptsInHour >= 200) {
            authService.lockAccount(uid);
            request.setAttribute("email", email);
            request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa 24 giờ do nhập sai quá 200 lần trong 1 giờ.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        user = authService.checkLogin(email, password);
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            session.setAttribute("loggedInUser", user);

            // Lưu quyền hạn user đăng nhập
            List<Integer> permissionRoles = new PermissionUserService().getPermissionRolesByUserId(user.getUid());
            List<Integer> permissions = new ArrayList<>();
            PermissionRoleService permissionRoleService = new PermissionRoleService();
            for (int roleId : permissionRoles) {
                permissions.add(permissionRoleService.getIdPermissionByIdPR(roleId));
            }
            session.setAttribute("permissions", permissions);


            // Ghi log đăng nhập
            ActivityLog loginLog = new ActivityLog("INFO", user.getUid(),
                    user.getUsername(), LocalDateTime.now(),
                    user.getUsername() + " đã đăng nhập");
            logService.insertLog(loginLog);

            response.sendRedirect("homepage");
        } else {
            authService.insertFailedLoginAttempt(uid);
            request.setAttribute("email", email);
            request.setAttribute("errorPassword", "Mật khẩu không đúng.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
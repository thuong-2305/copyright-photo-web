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
import java.util.Date;
import java.util.List;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isLoginGoogle = false;
        String code = request.getParameter("code");
        if (code != null) {
            LoginGoogle google = new LoginGoogle();
            String accessToken = google.getToken(code);
            GoogleAccount account = google.getUserInfo(accessToken);

            if (account != null) {
                AuthService service = new AuthService();
                User user = service.getUserByEmail(account.getEmail());
                if (user == null) {
                    service.registerUser(account.getEmail(), "", "", account.getName());
                    user = service.getUserByEmail(account.getEmail());
                }

                LocalDateTime lockUntil = service.getLockUntil(user.getUid());
                if (lockUntil != null) {
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
                new LogService().insertLog(loginLog);
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
        AuthService service = new AuthService();
        UserService userService = new UserService();
        User user = service.getUserByEmail(email);

        // không truy vấn được user bằng email
        if (user == null) {
            request.setAttribute("errorEmail", "Email không tồn tại.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // nếu truy vấn đc xem có đang bị khóa tài khoản hay không
        LocalDateTime lockUntil = service.getLockUntil(user.getUid());
        if (lockUntil != null) {
            request.setAttribute("email", email);
            request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa đến " + lockUntil);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // kiểm tra email và mật khẩu đăng nhập đúng hay không
        user = service.checkLogin(email, password);
        if (user != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            session.setAttribute("loggedInUser", user);

            // Lưu quyền hạn user đăng nhập
            List<Integer> permisionRoles = new PermissionUserService().getPermissionRolesByUserId(user.getUid());
            List<Integer> permissions = new ArrayList<>();
            PermissionRoleService permisionRoleService = new PermissionRoleService();
            for(int i : permisionRoles) {
                permissions.add(permisionRoleService.getIdPermissionByIdPR(i));
            }
            session.setAttribute("permissions", permissions);
            // End

            // Ghi log đăng nhập
            ActivityLog loginLog = new ActivityLog("INFO", user.getUid(),
                    user.getUsername(), LocalDateTime.now(),
                    user.getUsername() + " đã đăng nhập");
            new LogService().insertLog(loginLog);

            response.sendRedirect("homepage");
        } else {
            // nếu không lấy số lần đăng nhập sai
            int uid = userService.getUidByEmail(email);
            service.insertFailedLoginAttempt(uid);

            int failedAttempts = service.countFailedLoginAttempts(uid);
            // đăng nhập sai từ 5 lần sẽ bị khóa đăng nhập
            if (failedAttempts >= 5) {
                service.updateLockUntil(uid);
                request.setAttribute("email", email);
                request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa tạm thời trong 10 phút do nhập sai quá 5 lần.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // số lần đăng nhập sai trong 1 tiếng
            int failedAttemptsInHour = service.countFailedLoginAttemptsInHour(uid);
            if (failedAttemptsInHour >= 200) {
                service.lockAccount(uid);
                request.setAttribute("email", email);
                request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa 24 giờ do nhập sai quá 200 lần trong 1 giờ.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            request.setAttribute("email", email);
            request.setAttribute("errorPassword", "Mật khẩu không đúng.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
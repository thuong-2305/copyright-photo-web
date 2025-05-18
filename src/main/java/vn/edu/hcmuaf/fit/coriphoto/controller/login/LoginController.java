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
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isLoginGoogle = false;
        //Ktra người dùng có login bằng gg hay không
        String code = request.getParameter("code");
        if (code != null) {
            LoginGoogle google = new LoginGoogle();
            String accessToken = google.getToken(code);
            GoogleAccount account = google.getUserInfo(accessToken);
            System.out.println(account);

            //Xác thực tài khoản
            if (account != null) {
                AuthService service = new AuthService();

                User user = service.getUserByEmail(account.getEmail());
                if (user == null) {
                    service.registerUser(account.getEmail(), "",account.getName(), account.getName());
                    user = service.getUserByEmail(account.getEmail());
                }

                AuthService authService = new AuthService();
                LocalDateTime lockUntil = authService.getLockUntil(user.getUid());
                if (lockUntil != null) {
                    request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa đến " + lockUntil);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return;
                }

                HttpSession session = request.getSession(true);
                session.setAttribute("auth", user);
                session.setAttribute("loggedInUser", user);
                isLoginGoogle = true;
            }
        }
        if (!isLoginGoogle) {
            request.getRequestDispatcher("login.jsp").forward(request, response);//chuyển đến trang login vẫn giữ đg dẫn gốc
        }else {
            request.getRequestDispatcher("homepage").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        AuthService service = new AuthService();
        UserService userService = new UserService();
        User user = service.getUserByEmail(email);

        // Kiểm tra email có tồn tại không
        if (user == null) {
            request.setAttribute("errorEmail", "Email không tồn tại.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        // Kiểm tra tài khoản có bị khóa không
        LocalDateTime lockUntil = service.getLockUntil(user.getUid());
        if (lockUntil != null) {
            request.setAttribute("email", email);
            request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa đến " + lockUntil);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu
        user = service.checkLogin(email, password);
        if (user != null) {
            // Đăng nhập thành công
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);
            session.setAttribute("loggedInUser", user);
            // Ghi log đăng nhập
            ActivityLog loginLog = new ActivityLog("INFO", user.getUid(),
                    user.getUsername(), LocalDateTime.now(),
                    user.getUsername() + " đã đăng nhập");
            new LogService().insertLog(loginLog);

            response.sendRedirect("homepage");
        } else {
            int uid = userService.getUidByEmail(email);
            // Đăng nhập thất bại: Ghi lại lần đăng nhập sai
            service.insertFailedLoginAttempt(uid);
            // Kiểm tra số lần đăng nhập sai trong 10 phút
            int failedAttempts = service.countFailedLoginAttempts(uid);
            if (failedAttempts >= 5) {
                service.updateLockUntil(uid);
                request.setAttribute("email", email);
                request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa tạm thời trong 10 phút do nhập sai quá 5 lần.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Kiểm tra số lần đăng nhập sai trong 1 giờ
            int failedAttemptsInHour = service.countFailedLoginAttemptsInHour(uid);
            System.out.println("Số lần đăng nhập sai trong 1h vừa rồi: " + failedAttemptsInHour);
            if (failedAttemptsInHour >= 200) {
                service.lockAccount(uid);
                request.setAttribute("email", email);
                request.setAttribute("errorLock", "Tài khoản của bạn đã bị khóa 24 giờ do nhập sai quá 200 lần trong 1 giờ.");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Nếu chưa bị khóa, thông báo lỗi mật khẩu
            request.setAttribute("email", email);
            request.setAttribute("errorPassword", "Mật khẩu không đúng.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
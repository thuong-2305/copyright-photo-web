package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Base64;
import java.util.UUID;

@WebServlet(name = "SendUnlockToken", value = "/resend-unlock-token")
public class SendUnlockToken extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthService authService = new AuthService();
        // Xử lý gửi lại token qua email
        String encodedEmail = request.getParameter("email");
        String encodedTimestamp = request.getParameter("ts");

        if (encodedEmail == null || encodedTimestamp == null) {
            request.setAttribute("errorLock", "Yêu cầu không hợp lệ.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        String email = new String(Base64.getUrlDecoder().decode(encodedEmail));
        User user = authService.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("errorLock", "Email không tồn tại.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        int failedAttempts = authService.countFailedLoginAttempts(user.getUid());
        if (failedAttempts >= 5) {
            String token = UUID.randomUUID().toString();
            LocalDateTime expireTime = LocalDateTime.now().plusMinutes(10); // Token hết hạn sau 10 phút
            authService.insertUnlockToken(user.getUid(), token, expireTime);
            String unlockLink = "http://localhost:8080/unlock-login?token=" + token;
            System.out.println("Gửi email với link: " + unlockLink);
            new Thread(() -> {
                try {
                    EmailUtils.sendEmail(user.getEmail(), "Mở khóa đăng nhập", "Nhấn vào link để mở khoá: " + unlockLink);
                } catch (Exception e) {
                    e.printStackTrace(); // Ghi log lỗi nếu gửi email thất bại
                }
            }).start();
            request.setAttribute("email", email);
            request.setAttribute("message", "Link mở khóa đã được gửi qua email của bạn.");
        } else {
            request.setAttribute("email", email);
            request.setAttribute("errorLock", "Tài khoản chưa bị khóa tạm thời.");
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }


}

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

@WebServlet(name = "UnlockLogin", value = "/unlock-login")
public class UnlockLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthService authService = new AuthService();
        String token = request.getParameter("token");
        Integer uid = authService.getUidFromToken(token);
        if (uid != null) {
            authService.deleteFailedAttempts(uid);
            authService.deleteUnlockToken(token);
            request.setAttribute("message", "Tài khoản của bạn đã được mở khóa. Vui lòng đăng nhập lại.");
        }
        else {
            request.setAttribute("errorLock", "Link mở khóa không hợp lệ hoặc đã hết hạn.");
        }
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

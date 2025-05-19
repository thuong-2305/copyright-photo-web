package vn.edu.hcmuaf.fit.coriphoto.controller.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@WebServlet(name = "RegisterVerifyEmail", value = "/RegisterVerifyEmail")
public class RegisterVerifyEmail extends HttpServlet {
    // Tạo một thread pool với tối đa 10 thread
    private static final ExecutorService executorService = Executors.newFixedThreadPool(10);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        AuthService authService = new AuthService();

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        // Kiểm tra email có hợp lệ không
        if (authService.isEmailExist(email) || !EmailUtils.isValidEmail(email)) {
            jsonResponse.put("valid", false);
        } else {
            // Lấy session và thiết lập các thuộc tính trước khi trả response
            int otp = EmailUtils.generateOTP();
            HttpSession session = request.getSession();
            session.setAttribute("otp_" + email, otp);
            session.setAttribute("otp_expiry_" + email, System.currentTimeMillis() + 2 * 60 * 1000);

            User user = (User) session.getAttribute("auth");
            ActivityLog log;
            if (user != null) {
                log = new ActivityLog("INFO", user.getUid(),
                        user.getUsername(), LocalDateTime.now(),
                        user.getUsername() + " đã đăng nhập");
            } else {
                log = new ActivityLog("INFO", -1, // UID mặc định cho người dùng chưa đăng nhập
                        email, // email người dùng dùng để đăng ký
                        LocalDateTime.now(),
                        "Yêu cầu xác minh email cho " + email);
            }
            new LogService().insertLog(log);

            // Trả phản hồi ngay lập tức
            jsonResponse.put("valid", true);
            out.print(jsonResponse.toString());
            out.flush();

            // Gửi email trong background sử dụng ExecutorService
            executorService.submit(() -> {
                try {
                    EmailUtils.sendEmail(email, "Mã OTP", "Mã OTP của bạn là: " + otp);
                } catch (Exception e) {
                    System.err.println("Failed to send OTP to " + email + ": " + e.getMessage());
                }
            });

            return;
        }

        out.print(jsonResponse.toString());
        out.flush();
    }

    // Đóng ExecutorService khi servlet bị hủy
    @Override
    public void destroy() {
        executorService.shutdown();
        super.destroy();
    }
}
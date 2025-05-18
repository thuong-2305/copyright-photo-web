package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;

import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@WebServlet(name = "SendOTP", value = "/SendOTP")
public class SendOTP extends HttpServlet {
    private static final ExecutorService executor = Executors.newCachedThreadPool(); // Tạo thread pool

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");

        if (currentUser != null) {
            String email = currentUser.getEmail();
            int otp = EmailUtils.generateOTP();
            session.setAttribute("otp", otp); // Lưu OTP trước khi gửi

            // Gửi email bất đồng bộ bằng ExecutorService
            executor.execute(() -> {
                try {
                    String subject = "Mã OTP xác thực thay đổi email";
                    String message = "Mã OTP của bạn là: " + otp + ". Vui lòng không chia sẻ mã này với bất kỳ ai.";
                    EmailUtils.sendEmail(email, subject, message);
                } catch (Exception e) {
                    e.printStackTrace(); // Log lỗi nếu cần
                }
            });

            // Trả về phản hồi ngay lập tức
            response.getWriter().write("success");
        } else {
            response.sendRedirect("editprofile.jsp");
        }
    }

    @Override
    public void destroy() {
        executor.shutdown(); // Đóng ExecutorService khi Servlet bị hủy
    }
}
package vn.edu.hcmuaf.fit.coriphoto.controller.login;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;

import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "LogoutController", value = "/logout")
public class LogoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");

        // Ghi log đăng nhập
        ActivityLog loginLog = new ActivityLog("INFO", user.getUid(),
                user.getUsername(), LocalDateTime.now(),
                user.getUsername() + " đã đăng xuất");
        new LogService().insertLog(loginLog);
        request.getSession().invalidate();
        response.sendRedirect("/");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
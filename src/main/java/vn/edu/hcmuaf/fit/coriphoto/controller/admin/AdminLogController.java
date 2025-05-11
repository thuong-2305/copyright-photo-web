package vn.edu.hcmuaf.fit.coriphoto.controller.admin;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminLogController", value = "/admin-log")
public class AdminLogController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LogService logService = new LogService();
        List<ActivityLog> logs = logService.getLogs();
        request.setAttribute("logs", logs);
        request.getRequestDispatcher("admin-log.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 
    }
}
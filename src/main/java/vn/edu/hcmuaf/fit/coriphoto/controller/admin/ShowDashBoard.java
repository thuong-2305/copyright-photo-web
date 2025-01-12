package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AdminService;

import java.io.IOException;

@WebServlet(name = "ShowDashBoard", value = "/ShowDashBoard")
public class ShowDashBoard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser != null) {
            request.setAttribute("user", currentUser);
        } else {
            response.sendRedirect("login.jsp");
            return;
        }

        int monthIncome = 1;  // Mặc định là tháng 1
        int yearIncome = 2025; // Mặc định là năm 2025
        try {
            monthIncome = Integer.parseInt(request.getParameter("monthIncome"));
            yearIncome = Integer.parseInt(request.getParameter("yearIncome"));
        } catch (NumberFormatException e) {
            // Xử lý khi không có tham số hoặc tham số không hợp lệ
        }

        AdminService adminService = new AdminService();

        // Lấy các thông tin thống kê
        int totalUsers = adminService.getTotalUsers();
        double totalIncome = adminService.getTotalIncome();
        int totalOrder = adminService.getTotalOrders();
        double totalIncomeByMonthYear = adminService.getTotalIncomeByMonthYear(monthIncome, yearIncome);

        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("totalIncome", totalIncome);
        request.setAttribute("totalOrder", totalOrder);
        request.setAttribute("totalIncomeByMonthYear", totalIncomeByMonthYear);

        request.getRequestDispatcher("admin-homepage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

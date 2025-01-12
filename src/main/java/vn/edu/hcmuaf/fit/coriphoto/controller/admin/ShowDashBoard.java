package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AdminService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ShowDashBoard", value = "/ShowDashBoard")
public class ShowDashBoard extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin người dùng từ session
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");

        // Kiểm tra nếu người dùng không đăng nhập
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Xử lý các tham số tháng và năm
        int monthIncome = 1;
        int yearIncome = 2025;
        try {
            monthIncome = Integer.parseInt(request.getParameter("monthIncome"));
            yearIncome = Integer.parseInt(request.getParameter("yearIncome"));
        } catch (NumberFormatException e) {
        }


        AdminService adminService = new AdminService();
        int totalUsers = adminService.getTotalUsers();
        double totalIncome = adminService.getTotalIncome();
        int totalOrder = adminService.getTotalOrders();
        double totalIncomeByMonthYear = adminService.getTotalIncomeByMonthYear(monthIncome, yearIncome);

        // lấy chart fix cứng năm 2024
        int[] customersData = adminService.getCustomersDataByMonthYear(2024);
        int[] sellersData = adminService.getSellersDataByMonthYear(2024);


        // Kiểm tra xem yêu cầu là AJAX (JSON) hay không
        String isAjaxRequest = request.getHeader("X-Requested-With");

        if ("XMLHttpRequest".equals(isAjaxRequest)) {
            // Trả về dữ liệu JSON cho AJAX
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Tạo đối tượng Gson
            Gson gson = new Gson();

            // Tạo một đối tượng Map chứa dữ liệu cần trả về
            Map<String, Object> dataResponse = new HashMap<>();
            dataResponse.put("totalIncomeByMonthYear", totalIncomeByMonthYear);
            dataResponse.put("sellersData", sellersData); // Dữ liệu người bán theo tháng
            dataResponse.put("customersData", customersData); // Dữ liệu khách hàng theo tháng

            // Chuyển đối tượng Map thành JSON
            String jsonResponse = gson.toJson(dataResponse);
            System.out.println("jsonResponse " + jsonResponse);
            // Gửi dữ liệu JSON về client
            response.getWriter().write(jsonResponse);
        } else {
            // Trả về dữ liệu thông qua request cho JSP
            request.setAttribute("totalUsers", totalUsers);
            request.setAttribute("totalIncome", totalIncome);
            request.setAttribute("totalOrder", totalOrder);

            // Forward đến JSP để hiển thị
            request.getRequestDispatcher("/admin-homepage.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý POST (nếu cần)
    }
}

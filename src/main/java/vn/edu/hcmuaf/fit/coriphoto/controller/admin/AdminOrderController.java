package vn.edu.hcmuaf.fit.coriphoto.controller.admin;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.OrderDTO;
import vn.edu.hcmuaf.fit.coriphoto.service.AdminService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminOrderController", value = "/admin-order")
    public class AdminOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AdminService adminService = new AdminService();
        List<OrderDTO> orders =  adminService.getOrders();
        request.setAttribute("orders", orders);
        System.out.println("OK");
        request.getRequestDispatcher("admin-order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
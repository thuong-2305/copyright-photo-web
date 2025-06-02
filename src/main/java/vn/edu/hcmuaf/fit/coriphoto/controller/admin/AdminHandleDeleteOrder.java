package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AdminHandleDeleteOrder", value = "/AdminHandleDeleteOrder")
public class AdminHandleDeleteOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedBy = request.getHeader("X-Requested-By");
        User user = (User) request.getSession().getAttribute("auth");
        int orderId = Integer.parseInt(request.getParameter("order_id"));
        OrderService orderService = new OrderService();

        if ("AJAX".equals(requestedBy)) {
            String action = request.getParameter("action");

            if ("delete".equals(action)) {
                boolean success = orderService.deleteOrderById(orderId);

                if (success) {
                    Gson gson = new Gson();

                    Map<String, Object> responseData = new HashMap<>();
                    responseData.put("success", true);
                    String jsonResponse = gson.toJson(responseData);
                    response.getWriter().write(jsonResponse);

                    ActivityLog loginLog = new ActivityLog("DANGER", user.getUid(),
                            user.getUsername(), LocalDateTime.now(),
                            user.getUsername() + " đã xóa đơn hàng có id:" + orderId);
                    new LogService().insertLog(loginLog);
                }
            }
        }
    }
}
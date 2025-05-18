package vn.edu.hcmuaf.fit.coriphoto.controller.admin;


import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.OrderDetailSerializer;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.OrderSerializer;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.ProductSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.*;
import vn.edu.hcmuaf.fit.coriphoto.service.AdminService;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "AdminOrderController", value = "/admin-order")
    public class AdminOrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderService orderService = new OrderService();
        List<Order> orders =  orderService.getAllOrders();
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("admin-order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderService orderService = new OrderService();
        int orderId = Integer.parseInt(request.getParameter("order_id"));
        Order order = orderService.getOrder(orderId);
        List<OrderDetail> orderDetails = orderService.getOrderDetailsHistory(orderId);
        OrderDetailListDTO orderdetailList = new OrderDetailListDTO(order, orderDetails);
        response.setContentType("application/json");
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDate.class, new JsonSerializer<LocalDate>() {
                    @Override
                    public JsonElement serialize(LocalDate src, Type typeOfSrc, JsonSerializationContext context) {
                        return new JsonPrimitive(src.toString());
                    }
                })
                .registerTypeAdapter(LocalDateTime.class, new JsonSerializer<LocalDateTime>() {
                    @Override
                    public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
                        return new JsonPrimitive(src.toString());
                    }
                })
                .registerTypeAdapter(Order.class, new OrderSerializer())
                .registerTypeAdapter(OrderDetail.class, new OrderDetailSerializer())
                .registerTypeAdapter(Product.class, new ProductSerializer())
                .create();
        String jsonResponse = gson.toJson(orderdetailList);
        response.getWriter().write(jsonResponse);
    }
}
package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.Order;
import vn.edu.hcmuaf.fit.coriphoto.model.OrderDetail;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.PromotionService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "OrderHistory", value = "/OrderHistory")
public class OrderHistory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int uid = currentUser.getUid();
        request.setAttribute("user", currentUser);


        OrderService orderService = new OrderService();
        List<Order> orders = orderService.getOrdersHistory(uid);
        if (orders.isEmpty()) {
            request.setAttribute("no", "Không có đơn hàng nào");
        } else {
            UserService userService = new UserService();
            ProductService productService = new ProductService();
            PromotionService promotionService = new PromotionService();
            // orderId - orderDetail
            Map<Integer, List<OrderDetail>> orderDetailsMap = orderService.getOrdersWithDetails(uid);
            // pmid - pmTypeName
            Map<Integer, String> paymentTypes = new HashMap<>();
            // orderId - userEmail
            Map<Integer, String> userEmails = new HashMap<>();
            // productId - product
            Map<Integer, Product> productMap = new HashMap<>();
            // orderId - số tiền đã giảm:
            Map<Integer, Double> priceMap = new HashMap<>();

            List<Integer> productIds = new ArrayList<>();

            for (Order order : orders) {
                // Lấy email của user
                userEmails.put(order.getUid(), userService.getEmail(order.getUid()));

                // Lấy tên phương thức thanh toán
                int pmid = orderService.getPmIdByOrderId(order.getOrderId());
                order.setPmid(pmid);
                paymentTypes.put(pmid, userService.getPaymentTypeNameByPmid(pmid));


                // Lấy danh sách OrderDetail
                List<OrderDetail> orderDetails = orderService.getOrderDetailsHistory(order.getOrderId());
                orderDetailsMap.put(order.getOrderId(), orderDetails);

                for (OrderDetail detail : orderDetails) {
                    productIds.add(detail.getProductId());
                }

                double percentage = promotionService.getDiscountByOrderId(order.getOrderId());
                double total = order.getTotalPrice();
                double totalAfterDiscount = total * (1-percentage);
                priceMap.put(order.getOrderId(), totalAfterDiscount);
            }

            // Lấy danh sách sản phẩm dựa vào productIds
            List<Product> products = new ArrayList<>();
            for (Integer id: productIds) {
                Product p = productService.getById(id);
                products.add(p);
            }

            for (Product product : products) {
                productMap.put(product.getId(), product);
            }

            System.out.println(orders);
            System.out.println(orderDetailsMap);
            System.out.println(productMap);
            System.out.println(paymentTypes);
            System.out.println(userEmails);
            System.out.println(priceMap);



            request.setAttribute("orders", orders);
            request.setAttribute("orderDetailsMap", orderDetailsMap);
            request.setAttribute("productMap", productMap);
            request.setAttribute("paymentTypes", paymentTypes);
            request.setAttribute("userEmails", userEmails);
            request.setAttribute("priceMap", priceMap);
        }

        request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}

package vn.edu.hcmuaf.fit.coriphoto.model;

import java.util.List;

public class OrderDetailListDTO {
    private Order order;
    private List<OrderDetail> orderDetails;

    public OrderDetailListDTO(Order order, List<OrderDetail> orderDetails) {
        this.order = order;
        this.orderDetails = orderDetails;
    }

    public Order getOrder() { return order; }
    public List<OrderDetail> getOrderDetails() { return orderDetails; }
}

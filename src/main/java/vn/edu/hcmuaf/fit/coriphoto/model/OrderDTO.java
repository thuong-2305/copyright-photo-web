package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDate;

public class OrderDTO {
    private int orderId;
    private String customerName;
    private String status;
    private String productUrls;
    private double totalPrice;
    private LocalDate orderDate;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getProductUrls() {
        return productUrls;
    }

    public void setProductUrls(String productUrls) {
        this.productUrls = productUrls;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    @Override
    public String toString() {
        return "OrderDTO{" +
                "orderId=" + orderId +
                ", customerName='" + customerName + '\'' +
                ", status='" + status + '\'' +
                ", productUrls='" + productUrls + '\'' +
                ", totalPrice=" + totalPrice +
                ", orderDate=" + orderDate +
                '}';
    }
}
package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDate;

public class Order {
    private int orderId;
    private int uid;
    private int paymentMethodId;
    private int promotionId;
    private LocalDate orderDate;
    private double totalPrice;
    private String status;

    public Order(int orderId, String status, double totalPrice, LocalDate orderDate, int promotionId, int paymentMethodId, int uid) {
        this.orderId = orderId;
        this.status = status;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.promotionId = promotionId;
        this.paymentMethodId = paymentMethodId;
        this.uid = uid;
    }

    public Order() {}

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public LocalDate getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDate orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return orderId + "\t" + uid + "\t" + paymentMethodId + "\t" + promotionId + "\t" + orderDate + "\t" + totalPrice + "\t" + status;
    }
}

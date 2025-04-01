package vn.edu.hcmuaf.fit.coriphoto.model;

import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;
import vn.edu.hcmuaf.fit.coriphoto.service.PromotionService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Order {
    private int orderId;
    private int uid;
    private int pmid;
    private int promotionId;
    private LocalDateTime orderDate;
    private double totalPrice;
    private String status;
    private LocalDateTime orderPaymentDate;

    public Order(int orderId, String status, double totalPrice, LocalDateTime orderDate, int promotionId, int pmid, int uid) {
        this.orderId = orderId;
        this.status = status;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.promotionId = promotionId;
        this.pmid = pmid;
        this.uid = uid;
    }

    public Order() {}

    public void setOrderPaymentDate(LocalDateTime orderPaymentDate) {
        this.orderPaymentDate = orderPaymentDate;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUid() {
        return uid;
    }

    public String getFulleName() {
        return new UserService().getFullName(this.uid);
    }

    public String getEmail() {
        return new UserService().getEmail(this.uid);
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPmid() {
        return pmid;
    }

    public void setPmid(int pmid) {
        this.pmid = pmid;
    }

    public double getPromotionPercent() {
        return new PromotionService().getDiscountByPromotionID(this.promotionId);
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }
    
    public String getFormatOrderDateTime() {
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss, dd/MM/yyyy");
        return dateTimeFormatter.format(this.orderDate);
    }

    public String getFormatOrderPaymentDateTime() {
        if (this.orderPaymentDate == null) {
            return "Chưa thanh toán";
        }
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss, dd/MM/yyyy");
        return dateTimeFormatter.format(this.orderPaymentDate);
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

    public String getCustomerName() {
        return new UserService().getFullName(this.uid);
    }

    public String getPaymentTypeName() {
        return new OrderService().getNamePaymentMethod(this.pmid);
    }

    @Override
    public String toString() {
        return orderId + ", " + uid + ", " + pmid + ", " + promotionId + ", " + getFormatOrderDateTime() + ", "
                + totalPrice + ", " + status + ", " + this.getPaymentTypeName()
                + ", " + this.getCustomerName() + ", " + this.getFormatOrderPaymentDateTime() + "\n";
    }


}

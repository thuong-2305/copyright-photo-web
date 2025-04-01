package vn.edu.hcmuaf.fit.coriphoto.model;

import vn.edu.hcmuaf.fit.coriphoto.service.LicenseService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

public class OrderDetail {
    private int orderId;
    private int productId;
    private int licenseId;
    private int price;


    public OrderDetail(int price, int licenseId, int productId, int orderId) {
        this.price = price;
        this.licenseId = licenseId;
        this.productId = productId;
        this.orderId = orderId;
    }

    public OrderDetail(){}

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getLicenseId() {
        return licenseId;
    }

    public void setLicenseId(int licenseId) {
        this.licenseId = licenseId;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getNameLicense() {
        return new LicenseService().getLicenseName(this.licenseId);
    }

    public Product getProduct() {
        return new ProductService().getById(this.productId);
    }

    @Override
    public String toString() {
        return orderId + "\t" + productId + "\t" + licenseId + "\t" + price;
    }
}

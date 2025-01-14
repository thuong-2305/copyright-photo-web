package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Product {
    private int id;
    private int uid;
    private int cid;
    private String name;
    private String description;
    private String size;
    private String dimension;
    private LocalDateTime dateUpload;
    private String url;
    private double price;
    private String status;

    public Product() { }

    public Product(int id, int uid, int cid, String name, String description, String size, String dimension, LocalDateTime dateUpload, String url, double price, String status) {
        this.id = id;
        this.uid = uid;
        this.cid = cid;
        this.name = name;
        this.description = description;
        this.size = size;
        this.dimension = dimension;
        this.dateUpload = dateUpload;
        this.url = url;
        this.price = price;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getDimension() {
        return dimension;
    }

    public void setDimension(String dimension) {
        this.dimension = dimension;
    }

    public LocalDateTime getDateUpload() {
        return dateUpload;
    }

    public void setDateUpload(LocalDateTime dateUpload) {
        this.dateUpload = dateUpload;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                id +
                ", " + uid +
                ", " + cid +
                ", '" + name +
                ", " + description +
                ", " + size +
                ", " + dimension +
                ", " + dateUpload +
                ", " + url +
                ", " + price +
                ", " + status +
                '}';
    }


}

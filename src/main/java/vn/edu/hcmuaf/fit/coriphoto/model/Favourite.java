package vn.edu.hcmuaf.fit.coriphoto.model;

import java.sql.Timestamp;

public class Favourite {
    private int userId;
    private int productId;
    private Timestamp dateAdded;
    private String notes;
    private Integer collectionId;  // Nullable

    // Constructors, Getters, Setters

    // Default constructor
    public Favourite() {
    }

    // Constructor with essential fields
    public Favourite(int userId, int productId) {
        this.userId = userId;
        this.productId = productId;
        this.dateAdded = new Timestamp(System.currentTimeMillis());
    }

    // Constructor with all fields
    public Favourite(int userId, int productId, Timestamp dateAdded, String notes, Integer collectionId) {
        this.userId = userId;
        this.productId = productId;
        this.dateAdded = dateAdded;
        this.notes = notes;
        this.collectionId = collectionId;
    }

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public Timestamp getDateAdded() {
        return dateAdded;
    }

    public void setDateAdded(Timestamp dateAdded) {
        this.dateAdded = dateAdded;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Integer getCollectionId() {
        return collectionId;
    }

    public void setCollectionId(Integer collectionId) {
        this.collectionId = collectionId;
    }
}

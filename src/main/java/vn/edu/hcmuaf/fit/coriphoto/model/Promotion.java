package vn.edu.hcmuaf.fit.coriphoto.model;

public class Promotion {
    private int promotionId;
    private String promotionName;
    private String description;
    private double percentage;

    public Promotion(int promotionId, double percentage, String description, String promotionName) {
        this.promotionId = promotionId;
        this.percentage = percentage;
        this.description = description;
        this.promotionName = promotionName;
    }

    public Promotion() {}

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPromotionName() {
        return promotionName;
    }

    public void setPromotionName(String promotionName) {
        this.promotionName = promotionName;
    }

    @Override
    public String toString() {
        return promotionId + "\t" + promotionName + "\t" + description + "\t" + percentage;
    }
}

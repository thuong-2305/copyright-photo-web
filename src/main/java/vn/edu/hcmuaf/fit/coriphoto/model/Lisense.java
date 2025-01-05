package vn.edu.hcmuaf.fit.coriphoto.model;

public class Lisense {
    private int lisenseId;
    private String lisenseName;
    private String description;

    public Lisense(int lisenseId, String lisenseName, String description) {
        this.lisenseId = lisenseId;
        this.lisenseName = lisenseName;
        this.description = description;
    }

    public int getLisenseId() {
        return lisenseId;
    }

    public void setLisenseId(int lisenseId) {
        this.lisenseId = lisenseId;
    }

    public String getLisenseName() {
        return lisenseName;
    }

    public void setLisenseName(String lisenseName) {
        this.lisenseName = lisenseName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

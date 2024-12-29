package vn.edu.hcmuaf.fit.coriphoto.model;

public class PaymentType {
    private int pmTypeId;
    private String pmTypeName;

    public PaymentType(int pmTypeId, String pmTypeName) {
        this.pmTypeId = pmTypeId;
        this.pmTypeName = pmTypeName;
    }

    public PaymentType(){};

    public int getPmTypeId() {
        return pmTypeId;
    }

    public void setPmTypeId(int pmTypeId) {
        this.pmTypeId = pmTypeId;
    }

    public String getPmTypeName() {
        return pmTypeName;
    }

    public void setPmTypeName(String pmTypeName) {
        this.pmTypeName = pmTypeName;
    }
}

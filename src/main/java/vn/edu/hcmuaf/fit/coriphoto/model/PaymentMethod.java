package vn.edu.hcmuaf.fit.coriphoto.model;

import java.time.LocalDate;

public class PaymentMethod {
    private int pmid;
    private int uid;
    private String accountName;
    private String accountNumber;
    private int pmTypeId;
    private String provider;
    private LocalDate expiryDate;
    private int cvc;

    public PaymentMethod(int pmid, int uid, String accountName, String accountNumber, int pmTypeId, String provider,
    LocalDate expiryDate, int cvc) {
        this.pmid = pmid;
        this.uid = uid;
        this.accountName = accountName;
        this.accountNumber = accountNumber;
        this.pmTypeId = pmTypeId;
        this.provider = provider;
        this.expiryDate = expiryDate;
        this.cvc = cvc;
    }

    public PaymentMethod() {}

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider;
    }

    public int getCvc() {
        return cvc;
    }

    public void setCvc(int cvc) {
        this.cvc = cvc;
    }

    public LocalDate getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(LocalDate expiryDate) {
        this.expiryDate = expiryDate;
    }

    public int getPmTypeId() {
        return pmTypeId;
    }

    public void setPmTypeId(int pmTypeId) {
        this.pmTypeId = pmTypeId;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
    }

    public int getUid() {
        return uid;
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
}

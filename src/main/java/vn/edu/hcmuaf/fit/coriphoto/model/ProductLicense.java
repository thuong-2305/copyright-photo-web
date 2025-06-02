package vn.edu.hcmuaf.fit.coriphoto.model;

public class ProductLicense {
    private int id;
    private int pid;
    private int licenseId;

    public ProductLicense() { };

    public ProductLicense(int pid, int licenseId) {
        this.pid = pid;
        this.licenseId = licenseId;
    }

    public ProductLicense(int id, int pid, int licenseId) {
        this.id = id;
        this.pid = pid;
        this.licenseId = licenseId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getLicenseId() {
        return licenseId;
    }

    public void setLicenseId(int licenseId) {
        this.licenseId = licenseId;
    }
}

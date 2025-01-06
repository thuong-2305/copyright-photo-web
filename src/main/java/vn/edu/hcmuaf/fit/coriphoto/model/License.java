package vn.edu.hcmuaf.fit.coriphoto.model;

public class License {
    private int licenseId;
    private String licenseName;
    private String description;

    public License(int licenseId, String licenseName, String description) {
        this.licenseId = licenseId;
        this.licenseName = licenseName;
        this.description = description;
    }

    public License() {}

    public int getLicenseId() {
        return licenseId;
    }

    public void setLicenseId(int licenseId) {
        this.licenseId = licenseId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLicenseName() {
        return licenseName;
    }

    public void setLicenseName(String licenseName) {
        this.licenseName = licenseName;
    }

    @Override
    public String toString() {
        return licenseId + "\t" + licenseName + "\t" + description;
    }
}

package vn.edu.hcmuaf.fit.coriphoto.model;

public class Permission {
    private int idPermission;
    private String description;

    public Permission() { }

    public Permission(int idPermission, String description) {
        this.idPermission = idPermission;
        this.description = description;
    }

    public int getIdPermission() {
        return idPermission;
    }

    public void setIdPermission(int idPermission) {
        this.idPermission = idPermission;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

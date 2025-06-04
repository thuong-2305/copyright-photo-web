package vn.edu.hcmuaf.fit.coriphoto.model;

public class PermissionRole {
    private int idPR;
    private int idRole;
    private int idPermission;

    public PermissionRole() { }

    public PermissionRole(int idPR, int idRole, int idPermission) {
        this.idPR = idPR;
        this.idRole = idRole;
        this.idPermission = idPermission;
    }

    public int getIdPR() {
        return idPR;
    }

    public void setIdPR(int idPR) {
        this.idPR = idPR;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public int getIdPermission() {
        return idPermission;
    }

    public void setIdPermission(int idPermission) {
        this.idPermission = idPermission;
    }
}

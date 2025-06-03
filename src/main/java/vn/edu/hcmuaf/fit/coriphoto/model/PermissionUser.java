package vn.edu.hcmuaf.fit.coriphoto.model;

public class PermissionUser {
    private int idPU;
    private int idPR;
    private int uid;

    public PermissionUser() { }

    public PermissionUser(int idPU, int idPR, int uid) {
        this.idPU = idPU;
        this.idPR = idPR;
        this.uid = uid;
    }

    public int getIdPU() {
        return idPU;
    }

    public void setIdPU(int idPU) {
        this.idPU = idPU;
    }

    public int getIdPR() {
        return idPR;
    }

    public void setIdPR(int idPR) {
        this.idPR = idPR;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}

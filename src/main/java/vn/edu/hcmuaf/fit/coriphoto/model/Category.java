package vn.edu.hcmuaf.fit.coriphoto.model;

public class Category {
    private int cid;
    private int cpid;
    private String name;

    public Category() { }

    public Category(int cid, int cpid, String name) {
        this.cid = cid;
        this.cpid = cpid;
        this.name = name;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public int getCpid() {
        return cpid;
    }

    public void setCpid(int cpid) {
        this.cpid = cpid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}

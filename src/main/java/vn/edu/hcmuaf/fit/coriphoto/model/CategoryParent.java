package vn.edu.hcmuaf.fit.coriphoto.model;

public class CategoryParent {
    private int cpid;
    private String name;

    public CategoryParent() { }

    public CategoryParent(int cpid, String name) {
        this.cpid = cpid;
        this.name = name;
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

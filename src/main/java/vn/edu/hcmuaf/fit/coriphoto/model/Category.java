package vn.edu.hcmuaf.fit.coriphoto.model;

import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;

public class Category {
    private int cid;
    private int cpid;
    private String name;
    private String url;

    public Category() { }

    public Category(int cid, int cpid, String name, String url) {
        this.cid = cid;
        this.cpid = cpid;
        this.name = name;
        this.url = url;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getNumberOfType() {
        return new CategoryService().getNumberOfType(this.cid);
    }

    @Override
    public String toString() {
        return cid + ", " + cpid + ", " + name + ", " + url;
    }
}

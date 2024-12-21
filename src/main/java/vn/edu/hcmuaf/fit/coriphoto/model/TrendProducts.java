package vn.edu.hcmuaf.fit.coriphoto.model;

public class TrendProducts {
    private int id;
    private String name;
    private String url;
    private int view;

    public TrendProducts() { }

    public TrendProducts(int id, String name, String url, int view) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.view = view;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    @Override
    public String toString() {
        return "TrendProducts{" +
                "," + id +
                ", " + name +
                ", " + url +
                ", " + view;
    }
}

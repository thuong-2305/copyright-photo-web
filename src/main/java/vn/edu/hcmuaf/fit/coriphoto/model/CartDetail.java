package vn.edu.hcmuaf.fit.coriphoto.model;

public class CartDetail {
    private int cartId;
    private int pid;
    private int licenseId;
    private int checked;
    private double price;

    public CartDetail() { }

    public CartDetail(int cartId, int pid, int licenseId, int checked, double price) {
        this.cartId = cartId;
        this.pid = pid;
        this.licenseId = licenseId;
        this.checked = checked;
        this.price = price;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
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

    public int getChecked() {
        return checked;
    }

    public void setChecked(int checked) {
        this.checked = checked;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "CartDetail{" +
                "cartId=" + cartId +
                ", pid=" + pid +
                ", licenseId =" + licenseId +
                '}';
    }
}

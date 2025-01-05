package vn.edu.hcmuaf.fit.coriphoto.model;

public class CartDetail {
    private int cartId;
    private int pid;
    private int lisenseId;

    public CartDetail() { }

    public CartDetail(int cartId, int pid, int lisenseId) {
        this.cartId = cartId;
        this.pid = pid;
        this.lisenseId = lisenseId;
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

    public int getLisenseId() {
        return lisenseId;
    }

    public void setLisenseId(int lisenseId) {
        this.lisenseId = lisenseId;
    }

    @Override
    public String toString() {
        return "CartDetail{" +
                "cartId=" + cartId +
                ", pid=" + pid +
                ", lisenseId=" + lisenseId +
                '}';
    }
}

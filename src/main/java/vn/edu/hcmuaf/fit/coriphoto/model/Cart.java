package vn.edu.hcmuaf.fit.coriphoto.model;

import java.util.List;

public class Cart {
    private int cartId;
    private int uid;
    private int promotionId;
    List<CartDetail> cartItems;

    public Cart() { }

    public Cart(int cartId, int uid, int promotionId, List<CartDetail> cartItems) {
        this.cartId = cartId;
        this.uid = uid;
        this.promotionId = promotionId;
        this.cartItems = cartItems;
    }

    public int getNumItems() {
        return cartItems.size();
    }

    public List<CartDetail> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartDetail> cartItems) {
        this.cartItems = cartItems;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "cartId=" + cartId +
                ", uid=" + uid +
                ", promotionId=" + promotionId +
                ", cartItems=" + cartItems +
                '}';
    }
}

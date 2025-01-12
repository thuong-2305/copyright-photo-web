package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.CartDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Cart;

public class CartService {
    private final CartDAO cart = new CartDAO();

    public int getNumCar() {
        return cart.getNumCart();
    }

    public boolean addToCart(int pid, int uid) {
        return cart.addCart(pid, uid);
    }

    public Cart getCart(int uid) {
        return cart.getCarts(uid);
    }

    public void deleteItem(int uid, int pid) {
        cart.deleteItem(uid, pid);
    }

    public void updateChecked(int cartId, int value, int pid) {
        cart.updateChecked(cartId, value, pid);
    }

    public int getNumChecked(int cartId) {
        return cart.getNumChecked(cartId);
    }

    public void updatePriceOfCartDetail(int cartId, int pid, int licenseId) {
        cart.updatePriceOfCartDetail(cartId, pid, licenseId);
    }

    public double getCartTotal(int uid) {
        return cart.getCartTotal(uid);
    }

    public double getCartTotalWithCartId(int cartId) {
        return cart.getCartTotalWithCartId(cartId);
    }
}

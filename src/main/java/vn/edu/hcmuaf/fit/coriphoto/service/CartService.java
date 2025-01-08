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

}

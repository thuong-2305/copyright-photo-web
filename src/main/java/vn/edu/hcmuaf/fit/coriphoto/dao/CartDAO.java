package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Cart;
import vn.edu.hcmuaf.fit.coriphoto.model.CartDetail;

import java.util.List;

public class CartDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public int getNumCart() {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT count(*) FROM cart")
                .mapTo(Integer.class).one());
    }

    public int getCartId(int uid) {
        String querySql = "SELECT cartId FROM cart WHERE uid = ? LIMIT 1";
        return jdbi.withHandle(handle ->
            handle.createQuery(querySql)
                .bind(0, uid)
                .mapTo(Integer.class)
                .findFirst()
                .orElse(-1));
    }

    public boolean addCart(int pid, int uid) {
        String querySql = "INSERT IGNORE INTO cart(uid) VALUES(?)";
        int cartId = jdbi.withHandle(handle -> {
            handle.createUpdate(querySql).bind(0, uid).execute();
            return getCartId(uid);
        });

        String checkProductQuery = "SELECT COUNT(*) FROM cart_detail WHERE cartId = ? AND pid = ?";
        boolean productExists = jdbi.withHandle(handle ->
                handle.createQuery(checkProductQuery)
                        .bind(0, cartId)
                        .bind(1, pid)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0) > 0
        );

        if (productExists) { return false; }

        String addProductQuery = "INSERT INTO cart_detail(cartId, pid) VALUES(?, ?)";
        jdbi.useHandle(handle -> handle.createUpdate(addProductQuery)
                .bind(0, cartId)
                .bind(1, pid)
                .execute());
        return true;
    }

    public Cart getCarts(int uid) {
        int cartId = getCartId(uid);
        String querySql = "SELECT * FROM cart_detail WHERE cartId = ?";
        List<CartDetail> items = jdbi.withHandle(handle -> handle.createQuery(querySql)
                .bind(0, cartId)
                .mapToBean(CartDetail.class)
                .list());
        String querySql2 = "SELECT * FROM cart WHERE uid = ?";
        Cart res = jdbi.withHandle(handle -> handle.createQuery(querySql2)
                .bind(0, uid).mapToBean(Cart.class).findFirst().orElse(null));
        res.setCartItems(items);
        return res;
    }

    public void deleteItem(int uid, int pid) {
        int cartId = getCartId(uid);
        String querySql = "DELETE FROM cart_detail WHERE cartId = ? AND pid = ?";
        jdbi.useHandle(handle -> handle.createUpdate(querySql)
                .bind(0, cartId).bind(1, pid).execute());
    }

    public double getCartTotal(int uid) {
        String querySql = "SELECT SUM(p.price) AS total_price " +
                        "FROM cart c " +
                        "JOIN cart_detail cd ON c.cartId = cd.cartId " +
                        "JOIN products p ON cd.pid = p.id " +
                        "WHERE c.uid = ?";
        return jdbi.withHandle(handle -> handle.createQuery(querySql)
                .bind(0, uid).mapTo(Double.class).one());
    }

}

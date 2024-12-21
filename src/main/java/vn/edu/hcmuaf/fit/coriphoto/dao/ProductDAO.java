package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts;

import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public List<Product> getALl() {
        return jdbi.withHandle(handle -> handle.createQuery("select * from products")
                .mapToBean(Product.class).list());
    }

    public Product getById(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("select * from products where id = ?")
                .bind(0, id).mapToBean(Product.class).findFirst().orElse(null));
    }

    public List<TrendProducts> getTrendProducts() {
        String sqlQuery = "SELECT p.id, p.name, p.url, COUNT(v.pid) AS view " +
                "FROM Views v " +
                "JOIN Products p ON p.id = v.pid " +
                "WHERE p.status = 'accepted' " +
                "GROUP BY p.id, p.name, p.url " +
                "ORDER BY view DESC " +
                "LIMIT 15;";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .mapToBean(TrendProducts.class).list());
    }

    public static void main(String[] args) {
        System.out.println(new ProductDAO().getTrendProducts());
//        new ProductDAO().getTrendProducts();
    }
}

package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

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

    public List<Product> getByCategoryId(int cid) {
        String sqlQuery = "SELECT * FROM products WHERE cid = ?";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .bind(0, cid).mapToBean(Product.class).list());
    }

    public List<Product> sortProductsLatest(int cid) {
        return this.getByCategoryId(cid).stream()
                .sorted(Comparator.comparing(Product::getDateUpload).reversed())
                .toList();
    }

    public static void main(String[] args) {
        System.out.println(new ProductDAO().getByCategoryId(1));
//        new ProductDAO().getTrendProducts();
    }
}

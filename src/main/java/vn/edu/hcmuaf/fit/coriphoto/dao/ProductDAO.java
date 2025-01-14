package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts;

import java.time.LocalDate;
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

    public List<Product> getProductPopular(int cid) {
        String sqlQuery = "SELECT p.id ,p.name, p.url, COUNT(v.id) AS view_count " +
                "FROM products p " +
                "LEFT JOIN views v ON p.id = v.pid " +
                "WHERE p.cid = ? and p.status = 'accepted' " +
                "GROUP BY p.id, p.name, p.url " +
                "ORDER BY view_count DESC;";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .bind(0, cid).mapToBean(Product.class).list());
    }

    public List<Product> getProductLatest(int cid) {
        String sqlQuery = "SELECT * FROM products " +
                "WHERE cid = ? and status = 'accepted' " +
                "ORDER BY dateUpload DESC;";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .bind(0, cid).mapToBean(Product.class).list());
    }

    public List<Product> sortProductsLatest(int cid) {
        return this.getByCategoryId(cid).stream()
                .sorted(Comparator.comparing(Product::getDateUpload).reversed())
                .toList();
    }

    public List<Product> getProductsRelated(int cid, int id) {
        String sqlQuery = "SELECT * FROM products " +
                "WHERE cid = ? and status = 'accepted' and id != ?";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .bind(0, cid).bind(1, id)
                .mapToBean(Product.class).list());
    }



    public static void main(String[] args) {
        System.out.println(new ProductDAO().getProductLatest(5));
//        new ProductDAO().getTrendProducts();
    }

    public boolean addProduct(Product p) {
        jdbi.useHandle(handle -> handle.execute(
                "INSERT INTO products (cid, uid, name, description, url, price, status) VALUES (?, ?, ?, ?, ?, ?, ?)",
                p.getCid(), p.getUid(), p.getName(), p.getDescription(), p.getUrl(), p.getPrice(), p.getStatus()
        ));
        return true;
    }

    public boolean deleteProductById(int id) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE id = :id")
                        .bind("id", id)
                        .execute() > 0
        );
    }

    public boolean updateProduct(Product product) {
        String sql = """
            UPDATE products
            SET name = :name,
                description = :description,
                cid = :cid,
                price = :price,
                uid = :uid,
                status = :status
            WHERE id = :id
        """;

        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", product.getId())
                        .bind("name", product.getName())
                        .bind("description", product.getDescription())
                        .bind("cid", product.getCid())
                        .bind("price", product.getPrice())
                        .bind("uid", product.getUid())
                        .bind("status", product.getStatus())
                        .execute() > 0
        );
    }
}

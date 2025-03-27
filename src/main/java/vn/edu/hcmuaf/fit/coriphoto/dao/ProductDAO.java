package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.time.LocalDateTime;
import java.util.Comparator;
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
                "LIMIT 25;";
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

    public void addProduct(int uid, int cid, String name, String description, String size,
                           String dimension, LocalDateTime dateUpload, String url, double price) {
        String sqlQuery = "INSERT INTO products (uid, cid, name, description, size, dimension, dateUpload, url, price) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        jdbi.useHandle(handle -> handle.createUpdate(sqlQuery)
                .bind(0, uid)
                .bind(1, cid)
                .bind(2, name)
                .bind(3, description)
                .bind(4, size)
                .bind(5, dimension)
                .bind(6,dateUpload)
                .bind(7, url)
                .bind(8, price)
                .execute());
    }

    public List<Product> searchGetProducts(String content) {
        String sqlQuery = "SELECT * FROM products WHERE name LIKE ? AND description LIKE ?";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .bind(0, "%" + content+  "%").bind(1, "%" + content+  "%").mapToBean(Product.class).list());
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

    public void updateProduct(Product product) {
        String sql = """
            UPDATE products
            SET name = :name,
                description = :description,
                cid = :cid,
                url = :url,
                price = :price,
                uid = :uid,
                status = :status
            WHERE id = :id
        """;

        jdbi.useHandle(handle -> {handle.createUpdate(sql)
                    .bind("name", product.getName())
                    .bind("description", product.getDescription())
                    .bind("cid", product.getCid())
                    .bind("url", product.getUrl())
                    .bind("price", product.getPrice())
                    .bind("uid", product.getUid())
                    .bind("status", product.getStatus())
                    .bind("id", product.getId()).execute();
        });
    }

    public boolean updateStatus(String action, int id) {
        String querySql = """
            UPDATE products
            SET status = :status
            WHERE id = :id
        """;
        return jdbi.withHandle(handle ->
                handle.createUpdate(querySql)
                        .bind("status", action)
                        .bind("id", id)
                        .execute() > 0);
    }

    public int getInNextProduct() {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'products' LIMIT 1")
                        .mapTo(Integer.class)
                        .findOne()
                        .orElseThrow(() -> new RuntimeException("Không thể lấy ID tiếp theo"))
        );
    }

    public List<Product> getAllProductsWaiting() {
        return jdbi.withHandle(handle -> handle.createQuery("select * from products where status = ? order by dateUpload desc")
                .bind(0, "waiting").mapToBean(Product.class).list());
    }

    public static void main(String[] args) {
        Product product = new ProductService().getById(996);
        System.out.println(product);
        product.setName("Muôn thú rừng núi");
        new ProductService().updateProduct(product);
        System.out.println(product);
    }
}


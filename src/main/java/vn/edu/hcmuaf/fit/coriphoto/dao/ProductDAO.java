package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.statement.Query;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts;

import java.time.LocalDate;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

public class ProductDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public List<Product> getALl() {
        return jdbi.withHandle(handle -> handle.createQuery("select * from products")
                .mapToBean(Product.class).list());
    }

    public List<Product> getProductsByCategory(int cid, int numbers) {
        return null;
    }

    public List<Product> getProductsByCategoryNotIn(int cid, Set<Integer> excludedProductIds, int limit) {
        StringBuilder query = new StringBuilder("SELECT * FROM products WHERE cid = ?");
        if (!excludedProductIds.isEmpty()) {
            query.append(" AND id NOT IN (");
            query.append(String.join(",", Collections.nCopies(excludedProductIds.size(), "?")));
            query.append(")");
        }
        query.append(" ORDER BY RAND() LIMIT ?");

        return jdbi.withHandle(handle -> {
            Query queryObj = handle.createQuery(query.toString());
            queryObj.bind(0, cid);
            int index = 1;
            for (Integer execludeId : excludedProductIds) {
                queryObj.bind(index++, execludeId);
            }
            queryObj.bind(index, limit);
            return queryObj.mapToBean(Product.class).list();
        });
    }

    public List<Product> getProductsFromRandomCategoryNotIn(List<Integer> excludeCategoryIds, Set<Integer> excludeProductIds, int limit) {
        // Truy vấn để lấy danh mục ngẫu nhiên, loại trừ các danh mục trong excludeCategoryIds
        StringBuilder categoryQuery = new StringBuilder("SELECT cid FROM categories");
        if (!excludeCategoryIds.isEmpty()) {
            categoryQuery.append(" WHERE cid NOT IN (");
            categoryQuery.append(String.join(",", Collections.nCopies(excludeCategoryIds.size(), "?")));
            categoryQuery.append(")");
        }
        categoryQuery.append(" ORDER BY RAND() LIMIT 1");

        return jdbi.withHandle(handle -> {
            // Lấy ID danh mục ngẫu nhiên
            Query categoryQueryObj = handle.createQuery(categoryQuery.toString());
            int index = 0;
            for (Integer excludeCid : excludeCategoryIds) {
                categoryQueryObj.bind(index++, excludeCid);
            }
            Integer randomCategoryId = categoryQueryObj.mapTo(Integer.class).findFirst().orElse(null);

            // Nếu không tìm thấy danh mục nào, trả về danh sách rỗng
            if (randomCategoryId == null) {
                return new ArrayList<>();
            }

            // Truy vấn để lấy sản phẩm từ danh mục ngẫu nhiên
            StringBuilder productQuery = new StringBuilder("SELECT * FROM products WHERE cid = ?");
            if (!excludeProductIds.isEmpty()) {
                productQuery.append(" AND id NOT IN (");
                productQuery.append(String.join(",", Collections.nCopies(excludeProductIds.size(), "?")));
                productQuery.append(")");
            }
            productQuery.append(" ORDER BY RAND() LIMIT ?");

            // Thực hiện truy vấn sản phẩm
            Query productQueryObj = handle.createQuery(productQuery.toString());
            productQueryObj.bind(0, randomCategoryId);
            index = 1;
            for (Integer excludeId : excludeProductIds) {
                productQueryObj.bind(index++, excludeId);
            }
            productQueryObj.bind(index, limit);

            return productQueryObj.mapToBean(Product.class).list();
        });
    }


    public List<Product> getByCategoryId(int cid) {
        String sqlQuery = "SELECT * FROM products WHERE cid = ?";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery)
                .bind(0, cid).mapToBean(Product.class).list());
    }

        public Product getById(int id) {
        return jdbi.withHandle(handle -> handle.createQuery("select * from products where id = ?")
                .bind(0, id).mapToBean(Product.class).findFirst().orElse(null));
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

    public List<TrendProducts> getTrendProducts() {
        String sqlQuery = "SELECT p.id, p.name, p.url, COALESCE(SUM(v.view_count), 0) AS view "
                + "FROM views v " + "JOIN products p ON p.id = v.pid " + "WHERE p.status = 'accepted' "
                + "GROUP BY p.id, p.name, p.url " + "ORDER BY view DESC " + "LIMIT 25;";
        return jdbi.withHandle(handle -> handle.createQuery(sqlQuery).mapToBean(TrendProducts.class).list() );
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

    public List<Product> getAllProductsWaiting() {
        return jdbi.withHandle(handle -> handle.createQuery("select * from products where status = ? order by dateUpload desc")
                .bind(0, "waiting").mapToBean(Product.class).list());
    }

    public int getInNextProduct() {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT AUTO_INCREMENT FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'products' LIMIT 1")
                .mapTo(Integer.class).findOne().orElseThrow(() -> new RuntimeException("Khong thể lấy ID tiếp theo"))
        );
    }

    public List<Product> searchGetProducts(String content) {
        // Nếu content rỗng, trả về list rỗng
        if (content == null || content.trim().isEmpty()) {
            return new ArrayList<>();
        }

        // Sử dụng OR thay vì AND, và chỉ tìm trong products có status = 'accepted'
        String sqlQuery = "SELECT * FROM products WHERE (name LIKE ? OR description LIKE ?) AND status = 'accepted'";

        return jdbi.withHandle(handle -> {
            List<Product> results = handle.createQuery(sqlQuery)
                    .bind(0, "%" + content + "%")
                    .bind(1, "%" + content + "%")
                    .mapToBean(Product.class)
                    .list();

            // Đảm bảo không bao giờ trả về null
            return results != null ? results : new ArrayList<>();
        });
    }


    public List<Product> searchProductsWithFilters(String content, String category,
                                                   String minPrice, String maxPrice, String[] sizes, String[] qualities) {

        StringBuilder query = new StringBuilder("SELECT * FROM products WHERE status = 'accepted'");
        List<Object> params = new ArrayList<>();

        // Search by keyword
        if (content != null && !content.trim().isEmpty()) {
            query.append(" AND (name LIKE ? OR description LIKE ?)");
            params.add("%" + content + "%");
            params.add("%" + content + "%");
        }

        // Filter by category
        if (category != null && !category.equals("all") && !category.isEmpty()) {
            query.append(" AND cid = (SELECT cid FROM categories WHERE LOWER(name) = LOWER(?))");
            params.add(category);
        }

        // Filter by price range
        if (minPrice != null && !minPrice.isEmpty()) {
            query.append(" AND price >= ?");
            params.add(Double.parseDouble(minPrice));
        }

        if (maxPrice != null && !maxPrice.isEmpty()) {
            query.append(" AND price <= ?");
            params.add(Double.parseDouble(maxPrice));
        }

        // Filter by size/dimension
        if (sizes != null && sizes.length > 0) {
            query.append(" AND (");
            for (int i = 0; i < sizes.length; i++) {
                if (i > 0) query.append(" OR ");
                switch (sizes[i]) {
                    case "small":
                        query.append("(CAST(SUBSTRING_INDEX(dimension, 'x', 1) AS UNSIGNED) * " +
                                "CAST(SUBSTRING_INDEX(dimension, 'x', -1) AS UNSIGNED) < 1000000)");
                        break;
                    case "medium":
                        query.append("(CAST(SUBSTRING_INDEX(dimension, 'x', 1) AS UNSIGNED) * " +
                                "CAST(SUBSTRING_INDEX(dimension, 'x', -1) AS UNSIGNED) BETWEEN 1000000 AND 5000000)");
                        break;
                    case "large":
                        query.append("(CAST(SUBSTRING_INDEX(dimension, 'x', 1) AS UNSIGNED) * " +
                                "CAST(SUBSTRING_INDEX(dimension, 'x', -1) AS UNSIGNED) > 5000000)");
                        break;
                }
            }
            query.append(")");
        }

        // Filter by quality (based on dimension)
        if (qualities != null && qualities.length > 0) {
            query.append(" AND (");
            for (int i = 0; i < qualities.length; i++) {
                if (i > 0) query.append(" OR ");
                switch (qualities[i]) {
                    case "standard":
                        query.append("(CAST(SUBSTRING_INDEX(dimension, 'x', 1) AS UNSIGNED) <= 1920)");
                        break;
                    case "hd":
                        query.append("(CAST(SUBSTRING_INDEX(dimension, 'x', 1) AS UNSIGNED) > 1920 AND " +
                                "CAST(SUBSTRING_INDEX(dimension, 'x', 1) AS UNSIGNED) <= 2560)");
                        break;
                    case "4k":
                        query.append("(CAST(SUBSTRING_INDEX(dimension, 'x', 1) AS UNSIGNED) > 2560)");
                        break;
                }
            }
            query.append(")");
        }

        return jdbi.withHandle(handle -> {
            Query queryObj = handle.createQuery(query.toString());
            for (int i = 0; i < params.size(); i++) {
                queryObj.bind(i, params.get(i));
            }
            return queryObj.mapToBean(Product.class).list();
        });
    }
    // Method lọc theo giá
    public List<Product> filterByPrice(List<Product> products, double minPrice, double maxPrice) {
        if (products == null || products.isEmpty()) {
            return new ArrayList<>();
        }

        return products.stream()
                .filter(p -> p.getPrice() >= minPrice && p.getPrice() <= maxPrice)
                .collect(Collectors.toList());
    }

    // Method lọc theo kích thước (dựa vào dimension)
    public List<Product> filterBySize(List<Product> products, String sizeType) {
        if (products == null || products.isEmpty()) {
            return new ArrayList<>();
        }

        return products.stream()
                .filter(p -> {
                    String dimension = p.getDimension();
                    if (dimension == null || !dimension.contains("x")) {
                        return false;
                    }

                    try {
                        String[] parts = dimension.split("x");
                        int width = Integer.parseInt(parts[0].trim());
                        int height = Integer.parseInt(parts[1].trim());
                        int pixels = width * height;

                        switch (sizeType) {
                            case "small":
                                return pixels < 1000000; // < 1MP
                            case "medium":
                                return pixels >= 1000000 && pixels <= 5000000; // 1-5MP
                            case "large":
                                return pixels > 5000000; // > 5MP
                            default:
                                return true;
                        }
                    } catch (Exception e) {
                        return false;
                    }
                })
                .collect(Collectors.toList());
    }

    // Method lọc theo chất lượng
    public List<Product> filterByQuality(List<Product> products, String quality) {
        if (products == null || products.isEmpty()) {
            return new ArrayList<>();
        }

        return products.stream()
                .filter(p -> {
                    String dimension = p.getDimension();
                    if (dimension == null || !dimension.contains("x")) {
                        return false;
                    }

                    try {
                        String[] parts = dimension.split("x");
                        int width = Integer.parseInt(parts[0].trim());

                        switch (quality) {
                            case "standard":
                                return width <= 1920; // HD or less
                            case "hd":
                                return width > 1920 && width <= 2560; // Full HD to 2K
                            case "4k":
                                return width > 2560; // 4K and above
                            default:
                                return true;
                        }
                    } catch (Exception e) {
                        return false;
                    }
                })
                .collect(Collectors.toList());
    }

}

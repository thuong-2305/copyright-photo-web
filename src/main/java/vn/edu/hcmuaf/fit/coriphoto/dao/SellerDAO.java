package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Order;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

import java.util.*;

public class SellerDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    PromotionDAO promotionDAO = new PromotionDAO();
    OrderDAO orderDAO = new OrderDAO();

    // lấy ra những đơn hàng đã thanh toán thành công có sản phẩm của seller này
    public List<Integer> getOrdersIdCompletedById(int uid) {
        String query = """
        SELECT o.orderId
        FROM orders o
        JOIN order_details od ON o.orderId = od.orderId
        JOIN products p ON p.id = od.productId
        JOIN sellers s ON s.uid = p.uid
        WHERE s.uid = :uid AND o.status = 'Completed'
    """;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .mapTo(Integer.class)
                        .list()
        );
    }

    public boolean checkExistSeller(int uid) {
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM sellers WHERE uid = :uid")
                    .bind("uid", uid)
                    .mapTo(Integer.class)
                    .findOne()
                    .orElse(0) > 0
        );
    }


    // lấy số ảnh mà đã bán được (không phải số lượng ảnh)
    public int getTotalImgSelled(int uid) {
        List<Integer> ordersCompleted = getOrdersIdCompletedById(uid);
        Set<Integer> productsSold = new HashSet<>();  // Set để tránh tính trùng sản phẩm đã bán
        int result = 0;
        for (Integer orderId : ordersCompleted) {
            List<Integer> productIds = orderDAO.getImgSelledByOrder(orderId, uid);
            productsSold.addAll(productIds);
        }
        result = productsSold.size();
        return result;
    }

    // Tổng số lượt mua ảnh
    public int getBuyTotalsById(int uid) {
        String query = """
                    SELECT COUNT(od.orderId)
                    FROM orders o 
                    JOIN order_details od ON o.orderId = od.orderId
                    JOIN products p ON od.productId = p.id
                    JOIN sellers s ON p.uid = s.uid
                    WHERE s.uid = :uid AND o.status = 'Completed'
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public double getTotalIncome(int uid) {
        List<Integer> ordersCompleted = getOrdersIdCompletedById(uid);
        double result = 0;
        for (Integer i : ordersCompleted) {
            result += getIncomeByOrderId(i);
        }
        return result;
    }

    // doanh thu 1 đơn hàng = giá gốc/2 + giá giảm giá (lợi nhuận của seller)
    public double getIncomeByOrderId(int oid) {
        double percentage = promotionDAO.getDiscountByOrderId(oid);
        double price = orderDAO.getTotalPriceById(oid);
        return (price + (price * percentage))/2;
    }


    public double getBalance(int uid) {
        String query = """
            SELECT balance
            FROM sellers
            WHERE uid = :uid
        """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .mapTo(Double.class)
                        .one() // Nếu luôn đảm bảo có kết quả
        );
    }

    public List<Map<String, Object>> getProductStatsBySellerId(int uid) {
        String query = """
        SELECT  
            p.url,
            p.id,
            p.name,
            COUNT(od.productId) AS buyCount, 
            AVG(od.price) * 0.5 AS averagePrice,
            SUM(od.price) * 0.5 AS totalPrice
        FROM orders o
        JOIN order_details od ON o.orderId = od.orderId
        JOIN products p ON od.productId = p.id
        WHERE p.uid = :uid AND o.status = 'Completed'
        GROUP BY p.id, p.name, p.url
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .mapToMap()
                        .list()
        );
    }

    public List<Map<String, Object>> getProductStatsBySellerIdWithPagination(int uid, int start, int length) {
        String query = """
        SELECT  
            p.url,
            p.id,
            p.name,
            COUNT(od.productId) AS buyCount,
            AVG(od.price) * 0.5 AS averagePrice,
            SUM(od.price) * 0.5 AS totalPrice
        FROM orders o
        JOIN order_details od ON o.orderId = od.orderId
        JOIN products p ON od.productId = p.id
        WHERE p.uid = :uid AND o.status = 'Completed'
        GROUP BY p.id, p.name, p.url
        LIMIT :start, :length
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .bind("start", start)
                        .bind("length", length)
                        .mapToMap()
                        .list()
        );
    }

    public int getTotalRecords(int uid) {
        String query = """
        SELECT COUNT(DISTINCT p.id) 
        FROM orders o
        JOIN order_details od ON o.orderId = od.orderId
        JOIN products p ON od.productId = p.id
        WHERE p.uid = :uid AND o.status = 'Completed'
    """;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .mapTo(Integer.class)
                        .one()
        );
    }


    public List<Map<String, Object>> getProductStatsByCategory(int uid, String categoryParentName) {
        String query = """
        SELECT  
            p.url,
            p.id, 
            p.name,
            COUNT(od.productId) AS buyCount,
            AVG(od.price) * 0.5 AS averagePrice,
            SUM(od.price) * 0.5 AS totalPrice
        FROM orders o
        JOIN order_details od ON o.orderId = od.orderId
        JOIN products p ON od.productId = p.id
        JOIN categories c ON c.cid = p.cid
        JOIN categories_parent cp ON cp.cpid = c.cpid
        WHERE p.uid = :uid AND o.status = 'Completed' AND cp.name = :categoryParentName
        GROUP BY p.id, p.name, p.url
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .bind("categoryParentName", categoryParentName)
                        .mapToMap()
                        .list()
        );
    }

    public List<Map<String, Object>> getProductStatsByCategoryWithPagination(int uid, String categoryParentName, int start, int length) {
        String query = """
        SELECT  
            p.url,
            p.id, 
            p.name,
            COUNT(od.productId) AS buyCount,
            AVG(od.price) * 0.5 AS averagePrice,
            SUM(od.price) * 0.5 AS totalPrice
        FROM orders o
        JOIN order_details od ON o.orderId = od.orderId
        JOIN products p ON od.productId = p.id
        JOIN categories c ON c.cid = p.cid
        JOIN categories_parent cp ON cp.cpid = c.cpid
        WHERE p.uid = :uid AND o.status = 'Completed' AND cp.name = :categoryParentName
        GROUP BY p.id, p.name, p.url
        LIMIT :start, :length
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .bind("categoryParentName", categoryParentName)
                        .bind("start", start)
                        .bind("length", length)
                        .mapToMap()
                        .list()
        );
    }

    public int getTotalRecordsByCategory(int uid, String categoryParentName) {
        String query = """
        SELECT COUNT(DISTINCT p.id) 
        FROM orders o
        JOIN order_details od ON o.orderId = od.orderId
        JOIN products p ON od.productId = p.id
        JOIN categories c ON c.cid = p.cid
        JOIN categories_parent cp ON cp.cpid = c.cpid
        WHERE p.uid = :uid AND o.status = 'Completed' AND cp.name = :categoryParentName
    """;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("uid", uid)
                        .bind("categoryParentName", categoryParentName)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public boolean isSignupSell(int uid) {
        return jdbi.withHandle(handle -> handle.createQuery("SELECT count(*) FROM sellers WHERE uid = ?")
                .bind(0, uid).mapTo(Integer.class).one()) > 0;
    }

    public List<Product> getAllProducts(int uid, String status) {
        String querySql = "SELECT * FROM products WHERE uid = ? and status = ?";
        return jdbi.withHandle(handle -> handle.createQuery(querySql)
                .bind(0, uid).bind(1, status).mapToBean(Product.class).list());
    }

    public void uploadProduct(Product product, String status) {
        String query = """
                    INSERT INTO products (uid, cid, name, description, size, dimension, dateUpload, url, price, status)
                    VALUES (:uid, :cid, :name, :description, :size, :dimension, :dateUpload, :url, :price, :status)
                """;

        jdbi.useHandle(handle ->
                handle.createUpdate(query)
                        .bind("uid", product.getUid())
                        .bind("cid", product.getCid())
                        .bind("name", product.getName())
                        .bind("description", product.getDescription())
                        .bind("size", product.getSize())
                        .bind("dimension", product.getDimension())
                        .bind("dateUpload", product.getDateUpload())
                        .bind("url", product.getUrl())
                        .bind("price", product.getPrice())
                        .bind("status", status)
                        .execute()
        );
    }

    public int uploadProductAndReturnId(Product product, String status) {
        String query = """
                INSERT INTO products (uid, cid, name, description, size, dimension, dateUpload, url, price, status)
                VALUES (:uid, :cid, :name, :description, :size, :dimension, :dateUpload, :url, :price, :status)
            """;

        return jdbi.withHandle(handle ->
                handle.createUpdate(query)
                        .bind("uid", product.getUid())
                        .bind("cid", product.getCid())
                        .bind("name", product.getName())
                        .bind("description", product.getDescription())
                        .bind("size", product.getSize())
                        .bind("dimension", product.getDimension())
                        .bind("dateUpload", product.getDateUpload())
                        .bind("url", product.getUrl())
                        .bind("price", product.getPrice())
                        .bind("status", status)
                        .executeAndReturnGeneratedKeys("id")  // giả sử tên cột khóa chính là "id"
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public static void main(String[] args) {
        System.out.println(new SellerDAO().getAllProducts(37, "accepted"));
    }

}

package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Order;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

import java.util.List;

public class OrderDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    // Hàm thêm đơn hàng và trả về orderId
    public int addOrderAndGetId(int uid, int pmid, int promotionId, double totalPrice) {
        // Truy vấn để thêm đơn hàng vào bảng orders
        String sql = "INSERT INTO orders (uid, pmid, promotionId, orderDate, totalPrice, status) " +
                "VALUES (:uid, :pmid, :promotionId, CURDATE(), :totalPrice, 'Completed')";

        // Dùng getGeneratedKeys để lấy orderId của đơn hàng mới
        return jdbi.withHandle(handle -> {
            // Insert và lấy generated key
            return handle.createUpdate(sql)
                    .bind("uid", uid)
                    .bind("pmid", pmid)
                    .bind("promotionId", promotionId)
                    .bind("totalPrice", totalPrice)
                    .executeAndReturnGeneratedKeys("orderId") // Lấy generated key (orderId)
                    .mapTo(int.class)
                    .one();
        });
    }

    // Hàm thêm chi tiết đơn hàng
    public boolean addOrderDetails(int orderId, int productId, int licenseId, double price) {
        // Truy vấn để thêm chi tiết đơn hàng vào bảng order_details
        String sql = "INSERT INTO order_details (orderId, productId, licenseId, price) " +
                "VALUES (:orderId, :productId, :licenseId, :price)";

        try {
            // Thực thi câu lệnh insert cho mỗi sản phẩm
            jdbi.useHandle(handle -> {
                handle.createUpdate(sql)
                        .bind("orderId", orderId)
                        .bind("productId", productId)
                        .bind("licenseId", licenseId)
                        .bind("price", price)
                        .execute();
            });
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    public double getTotalPriceById(int oid) {
        String query = """
        SELECT o.totalPrice
        FROM orders o
        WHERE o.orderId = :oid
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("oid", oid)
                        .mapTo(Double.class)
                        .findOne()
                        .orElse(0.0) // Trả về 0.0 nếu không tìm thấy chiết khấu
        );
    }


    public List<Integer> getImgSelledByOrder(int orderId, int sellerId) {
        String query = """
        SELECT od.productId
        FROM order_details od
        JOIN orders o ON o.orderId = od.orderId
        JOIN products p ON p.id = od.productId
        WHERE o.orderId = :orderId AND p.uid = :sellerId
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("orderId", orderId)
                        .bind("sellerId", sellerId)
                        .mapTo(Integer.class)  // Map result to Integer (productId)
                        .list()  // Return the result as a List<Integer>
        );
    }



    // Hàm tạo đơn hàng và thêm chi tiết đơn hàng
    public boolean createOrder(int uid, int pmid, int promotionId, int licenseId, double totalPrice, List<Product> products) {
        // Bước 1: Tạo đơn hàng và lấy orderId
        int orderId = addOrderAndGetId(uid, pmid, promotionId, totalPrice);
        System.out.println("Đơn vừa thêm: " + orderId);

        // Nếu không thể lấy được orderId, trả về false
        if (orderId <= 0) {
            return false;
        }

        // Bước 2: Thêm chi tiết đơn hàng vào bảng order_details
        for (Product product : products) {
            // Thêm chi tiết cho mỗi sản phẩm
            double price = licenseId == 2 ? product.getPrice() * 2 : product.getPrice();
            boolean orderDetailsCreated = addOrderDetails(orderId, product.getId(), licenseId, price);

            if (!orderDetailsCreated) {
                System.out.println("Order detail false");
                return false; // Nếu không thể thêm chi tiết đơn hàng, trả về false
            }
        }

        // Nếu tất cả các bước đều thành công, trả về true
        return true;
    }

    public static void main(String[] args) {
        OrderDAO orderDAO = new OrderDAO();
        System.out.println(orderDAO.getTotalPriceById(17));
    }

}

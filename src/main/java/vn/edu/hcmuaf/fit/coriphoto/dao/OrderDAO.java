package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Order;
import vn.edu.hcmuaf.fit.coriphoto.model.OrderDetail;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OrderDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    // Hàm thêm đơn hàng và trả về orderId
    public int addOrderAndGetId(int uid, int pmid, int promotionId, double totalPrice) {
        // Truy vấn để thêm đơn hàng vào bảng orders
        String sql = "INSERT INTO orders (uid, pmid, promotionId, orderDate, totalPrice, status) " +
                "VALUES (:uid, :pmid, :promotionId, NOW(), :totalPrice, 'Waiting payment')";

        // Dùng getGeneratedKeys để lấy orderId của đơn hàng mới
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", uid)
                        .bind("pmid", pmid == -1 ? null : pmid)
                        .bind("promotionId", promotionId)
                        .bind("totalPrice", totalPrice)
                        .executeAndReturnGeneratedKeys("orderId") // Lấy generated key (orderId)
                        .mapTo(int.class)
                        .one()
        );
    }

    public int addOrderAndGetIdCompleted(int uid, int pmid, int promotionId, double totalPrice) {
        // Truy vấn để thêm đơn hàng vào bảng orders
        String sql = "INSERT INTO orders (uid, pmid, promotionId, orderDate, totalPrice, status) " +
                "VALUES (:uid, :pmid, :promotionId, NOW(), :totalPrice, 'Completed')";

        // Dùng getGeneratedKeys để lấy orderId của đơn hàng mới
        return jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("uid", uid)
                        .bind("pmid", pmid == -1 ? null : pmid)
                        .bind("promotionId", promotionId)
                        .bind("totalPrice", totalPrice)
                        .executeAndReturnGeneratedKeys("orderId") // Lấy generated key (orderId)
                        .mapTo(int.class)
                        .one()
        );
    }

    public void updateStatusOrder(int orderId, String status) {
        String sql = "UPDATE orders SET status = :status, orderPaymentDate = NOW() WHERE orderId = :orderId";
        jdbi.withHandle(handle ->
                handle.createUpdate(sql)
                        .bind("orderId", orderId)
                        .bind("status", status)
                        .execute());
    }

    public List<Integer> getAllOrdersId() {
        String sql = "SELECT orderId FROM orders";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .list()
        );
    }

    public List<Integer> getAllOrdersIdMonthYear(int month, int year) {
        String sql = """
                SELECT orderId
                FROM orders
                WHERE MONTH(orderDate) = :month AND YEAR(orderDate) = :year
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("month", month)
                        .bind("year", year)
                        .mapTo(Integer.class)
                        .list()
        );
    }

    public int totalOrders() {
        String sql = "SELECT COUNT(*) FROM orders";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .one()
        );
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

    public int getPmIdByOrderId(int oid) {
        String sql = "SELECT pmid FROM orders WHERE orderId = :oid";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("oid", oid)
                        .mapTo(Integer.class)
                        .findOne() // Trả về Optional<Integer>
                        .orElse(-1) // Nếu không tìm thấy, trả về -1
        );
    }


    // Hàm tạo đơn hàng và thêm chi tiết đơn hàng
    public boolean createOrder(int uid, int pmid, int promotionId, int[] licenseIds, double totalPrice, List<Product> products) {
        // Bước 1: Tạo đơn hàng và lấy orderId
        int orderId = addOrderAndGetId(uid, pmid, promotionId, totalPrice);
        System.out.println("Đơn vừa thêm: " + orderId);

        // Nếu không thể lấy được orderId, trả về false
        if (orderId <= 0) {
            return false;
        }

        // Bước 2: Thêm chi tiết đơn hàng vào bảng order_details
        for (int i = 0; i < products.size(); i++) {
            Product product = products.get(i);
            int licenseId = licenseIds[i]; // Lấy licenseId tương ứng với từng sản phẩm

            double price = (licenseId == 2) ? product.getPrice() * 2 : product.getPrice();
            boolean orderDetailsCreated = addOrderDetails(orderId, product.getId(), licenseId, price);

            if (!orderDetailsCreated) {
                return false;
            }
        }

        return true;
    }

    public boolean createOrderCompleted(int uid, int pmid, int promotionId, int[] licenseIds, double totalPrice, List<Product> products) {
        // Bước 1: Tạo đơn hàng và lấy orderId
        int orderId = addOrderAndGetIdCompleted(uid, pmid, promotionId, totalPrice);

        // Nếu không thể lấy được orderId, trả về false
        if (orderId <= 0) {
            return false;
        }

        // Bước 2: Thêm chi tiết đơn hàng vào bảng order_details
        for (int i = 0; i < products.size(); i++) {
            Product product = products.get(i);
            int licenseId = licenseIds[i]; // Lấy licenseId tương ứng với từng sản phẩm

            double price = (licenseId == 2) ? product.getPrice() * 2 : product.getPrice();
            boolean orderDetailsCreated = addOrderDetails(orderId, product.getId(), licenseId, price);

            if (!orderDetailsCreated) {
                return false;
            }
        }

        return true;
    }

    public int createOrderCompletedInt(int uid, int pmid, int promotionId, int[] licenseIds, double totalPrice, List<Product> products) {
        // Bước 1: Tạo đơn hàng và lấy orderId
        int orderId = addOrderAndGetIdCompleted(uid, pmid, promotionId, totalPrice);

        // Nếu không thể lấy được orderId, trả về -1
        if (orderId <= 0) {
            return -1;
        }

        // Bước 2: Thêm chi tiết đơn hàng vào bảng order_details
        for (int i = 0; i < products.size(); i++) {
            Product product = products.get(i);
            int licenseId = licenseIds[i];
            double price = (licenseId == 2) ? product.getPrice() * 2 : product.getPrice();
            boolean orderDetailsCreated = addOrderDetails(orderId, product.getId(), licenseId, price);

            if (!orderDetailsCreated) {
                return -1; // Thất bại, trả về -1
            }
        }

        return orderId; // Thành công, trả về orderId
    }


    public int getLastOrderId() {
        String sql = "SELECT orderId FROM orders ORDER BY orderId DESC LIMIT 1";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0) // Nếu không có đơn hàng nào, trả về 0
        );
    }

    public List<Order> getOrdersHistory(int uid) {
        String sql = """
                SELECT * 
                FROM orders 
                WHERE uid = :uid
                ORDER BY orderDate DESC, orderId DESC
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("uid", uid)
                        .mapToBean(Order.class)
                        .list()
        );
    }

    public List<OrderDetail> getOrderDetailsHistory(int oid) {
        String sql = """
                SELECT *
                FROM order_details
                WHERE orderId = :oid
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("oid", oid)
                        .mapToBean(OrderDetail.class)
                        .list()
        );
    }

    public Order getOrder(int oid) {
        String sql = """
                SELECT *
                FROM orders
                WHERE orderId = :oid
                """;

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("oid", oid)
                        .mapToBean(Order.class)
                        .first()
        );
    }

    public Map<Integer, List<OrderDetail>> getOrdersWithDetails(int userId) {
        // Lấy danh sách đơn hàng
        List<Order> orders = getOrdersHistory(userId);

        // Tạo map để lưu danh sách OrderDetail theo orderId
        Map<Integer, List<OrderDetail>> orderDetailsMap = new HashMap<>();

        for (Order order : orders) {
            List<OrderDetail> details = getOrderDetailsHistory(order.getOrderId());
            orderDetailsMap.put(order.getOrderId(), details);
        }
        return orderDetailsMap;
    }

    public String getNamePaymentMethod(int pmid) {
        String sql = """
                SELECT pt.pmTypeName
                FROM orders o
                JOIN payment_method pm ON o.pmid = pm.pmid
                JOIN payment_type pt ON pm.pmTypeId = pt.pmTypeId
                WHERE o.pmid = :pmid;
                """;

        return jdbi.withHandle(handle -> handle.createQuery(sql)
                .bind("pmid", pmid)
                .mapTo(String.class)
                .findFirst()
                .orElse("Unknown")
        );
    }

    public List<Order> getAllOrders() {
        String sql = """
                SELECT *
                FROM orders
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Order.class)
                        .list()
        );
    }
}

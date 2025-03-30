package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.OrderDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Order;
import vn.edu.hcmuaf.fit.coriphoto.model.OrderDetail;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

import java.util.List;
import java.util.Map;

public class OrderService {
    private final OrderDAO orderDAO = new OrderDAO();

    public int addOrderAndGetId(int uid, int pmid, int promotionId, double totalPrice) {
        return orderDAO.addOrderAndGetId(uid, pmid, promotionId, totalPrice);
    }

    public boolean addOrderDetails(int orderId, int productId, int licenseId, double price) {
        return orderDAO.addOrderDetails(orderId, productId, licenseId, price);
    }

    public boolean createOrder(int uid, int pmid, int promotionId, int licenseId, double totalPrice, List<Product> products) {
        return orderDAO.createOrder(uid, pmid, promotionId, licenseId, totalPrice, products);
    }

    public int getLastOrderId() {
        return orderDAO.getLastOrderId();
    }

    public boolean createOrder(int uid, int pmid, int promotionId, int[] licenseIds, double totalPrice, List<Product> products) {
        // Tạo đơn hàng và lấy orderId
        int orderId = addOrderAndGetId(uid, pmid, promotionId, totalPrice);

        // Nếu không thể lấy được orderId, trả về false
        if (orderId <= 0) {
            return false;
        }

        // Thêm chi tiết đơn hàng vào bảng order_details
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

    public List<Integer> getAllOrdersId() {
        return orderDAO.getAllOrdersId();
    }

    public double getTotalPriceById(int oid) {
        return orderDAO.getTotalPriceById(oid);
    }

    public int totalOrders() {
        return orderDAO.totalOrders();
    }

    public List<Integer> getAllOrdersIdMonthYear(int month, int year) {
        return orderDAO.getAllOrdersIdMonthYear(month,year);
    }

    public List<Order> getOrdersHistory(int uid) {
        return orderDAO.getOrdersHistory(uid);
    }

    public List<OrderDetail> getOrderDetailsHistory(int oid) {
        return orderDAO.getOrderDetailsHistory(oid);
    }

    public Map<Integer, List<OrderDetail>> getOrdersWithDetails(int uid) {
        return orderDAO.getOrdersWithDetails(uid);
    }

    public List<Order> getAllOrders() { return orderDAO.getAllOrders(); }

    public int getPmIdByOrderId(int oid) {
        return orderDAO.getPmIdByOrderId(oid);
    }

    public String getNamePaymentMethod(int pmid) { return orderDAO.getNamePaymentMethod(pmid); }

    public Order getOrder(int oid) { return orderDAO.getOrder(oid); }

    // Hàm chuyển đổi chuỗi có dấu ngoặc vuông và số phân tách dấu phẩy thành mảng int
    public static int[] convertStringToIntArray(String str) {
        // Loại bỏ dấu ngoặc vuông và khoảng trắng, sau đó tách các số theo dấu phẩy
        str = str.replaceAll("[\\[\\]\\s]", "");
        String[] stringNumbers = str.split(",");
        // Chuyển đổi mảng chuỗi thành mảng int
        int[] intArray = new int[stringNumbers.length];
        for (int i = 0; i < stringNumbers.length; i++) {
            intArray[i] = Integer.parseInt(stringNumbers[i]);
        }
        return intArray;
    }
}

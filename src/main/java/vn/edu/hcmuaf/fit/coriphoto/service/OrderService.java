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

    public int addOrderAndGetIdCompleted(int uid, int pmid, int promotionId, double totalPrice) {
        return orderDAO.addOrderAndGetIdCompleted(uid, pmid, promotionId, totalPrice);
    }

    public boolean createOrder(int uid, int pmid, int promotionId, int[] licenseIds, double totalPrice, List<Product> products) {
        return orderDAO.createOrder(uid, pmid, promotionId, licenseIds, totalPrice, products);
    }

    public boolean createOrderCompleted(int uid, int pmid, int promotionId, int[] licenseIds, double totalPrice, List<Product> products) {
        return orderDAO.createOrderCompleted(uid, pmid, promotionId, licenseIds, totalPrice, products);
    }

        public void updateOrderStatus(int orderId, String newStatus) {
        orderDAO.updateStatusOrder(orderId, newStatus);
    }

    public boolean addOrderDetails(int orderId, int productId, int licenseId, double price) {
        return orderDAO.addOrderDetails(orderId, productId, licenseId, price);
    }


        public int getLastOrderId() {
        return orderDAO.getLastOrderId();
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

    public static void main(String[] args) {
        OrderService orderService = new OrderService();
        orderService.updateOrderStatus(17, "Completed");
        System.out.println(orderService.getOrder(17));
    }
}

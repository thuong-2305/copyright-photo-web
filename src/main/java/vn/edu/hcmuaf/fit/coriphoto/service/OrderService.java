package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.OrderDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

import java.util.List;

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


    }

package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.SellerDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

import java.util.List;
import java.util.Map;

public class SellerService {
    private final SellerDAO sellerDAO = new SellerDAO();

    public List<Integer> getOrdersIdCompletedById(int uid) {
        return sellerDAO.getOrdersIdCompletedById(uid);
    }

    public int getBuyTotalsById(int uid) {
        return sellerDAO.getBuyTotalsById(uid);
    }

    public double getTotalIncome(int uid) {
        return sellerDAO.getTotalIncome(uid);
    }

    public int getTotalImgSelled(int uid) {
        return sellerDAO.getTotalImgSelled(uid);
    }

    public double getIncomeByOrderId(int oid) {
        return sellerDAO.getIncomeByOrderId(oid);
    }

    public double getBalance(int uid) {
        return sellerDAO.getBalance(uid);
    }

    public List<Map<String, Object>> getProductStatsBySellerId(int uid) {
        return sellerDAO.getProductStatsBySellerId(uid);
    }

    public List<Map<String, Object>> getProductStatsByCategory(int uid, String categoryParentName) {
        return sellerDAO.getProductStatsByCategory(uid, categoryParentName);
    }

    public boolean isSignupSell(int uid) {
        return sellerDAO.isSignupSell(uid);
    }

    public List<Product> getAllProducts(int uid, String status) {
        return sellerDAO.getAllProducts(uid, status);
    }

}

package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.SellerDAO;

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

    public List<Map<String, Object>> getProductStatsBySellerIdWithPagination(int uid, int start, int length) {
        return sellerDAO.getProductStatsBySellerIdWithPagination(uid, start, length);
    }

    public int getTotalRecords(int uid) {
        return sellerDAO.getTotalRecords(uid);
    }


    public List<Map<String, Object>> getProductStatsByCategory(int uid, String categoryParentName) {
        return sellerDAO.getProductStatsByCategory(uid, categoryParentName);
    }

    public List<Map<String, Object>> getProductStatsByCategoryWithPagination(int uid, String categoryParentName, int start, int length) {
        return sellerDAO.getProductStatsByCategoryWithPagination(uid, categoryParentName, start, length);
    }

    public int getTotalRecordsByCategory(int uid, String categoryParentName) {
        return sellerDAO.getTotalRecordsByCategory(uid, categoryParentName);
    }


}

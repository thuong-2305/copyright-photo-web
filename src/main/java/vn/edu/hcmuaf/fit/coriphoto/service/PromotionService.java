package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.PromotionDAO;

public class PromotionService {
    private final PromotionDAO promotionDao = new PromotionDAO();

    public double getDiscountByPromotionID(int id) {
        return promotionDao.getDiscountByPromotionID(id);
    }

    public double getDiscountByOrderId(int oid) {
        return promotionDao.getDiscountByOrderId(oid);
    }
}

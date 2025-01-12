package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

public class PromotionDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public double getDiscountByPromotionID(int promotionId) {
        String query = "SELECT percentage FROM promotions WHERE promotionId = :promotionId";

        // Execute query using JDBI
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("promotionId", promotionId)
                        .mapTo(Double.class)
                        .findOne()
                        .orElse(0.0) // Return 0.0 if no promotion found
        );
    }

    public double getDiscountByOrderId(int oid) {
        String query = """
        SELECT p.percentage 
        FROM orders o
        JOIN promotions p ON o.promotionId = p.promotionId
        WHERE o.orderId = :oid
    """;

        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("oid", oid)
                        .mapTo(Double.class)
                        .findOne()
                        .orElse(0.0)
        );
    }

    public static void main(String[] args) {
        PromotionDAO promotionDAO = new PromotionDAO();



    }

}

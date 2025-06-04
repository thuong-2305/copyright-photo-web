package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.PaymentMethod;

import java.time.LocalDate;

public class PaymentMethodDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public int getPmidByUidAccountNumber(int uid, String accountNumber) {
        try {
            // Thực hiện truy vấn để lấy `pmid`
            return jdbi.withHandle(handle ->
                    handle.createQuery("SELECT pmid FROM payment_method WHERE uid = :uid AND accountNumber = :accountNumber")
                            .bind("uid", uid) // Gắn giá trị uid
                            .bind("accountNumber", accountNumber) // Gắn giá trị accountNumber
                            .mapTo(Integer.class) // Map kết quả về kiểu Integer
                            .one() // Lấy một kết quả duy nhất
            );
        } catch (Exception e) {
            e.printStackTrace();
            // Nếu không tìm thấy, trả về giá trị mặc định (ví dụ: -1)
            return -1;
        }
    }

    public int insertPaymentMethod(PaymentMethod paymentMethod) {
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO payment_method (uid, accountName, accountNumber, pmTypeId, provider, expiryDate, cvc) " +
                                "VALUES (:uid, :accountName, :accountNumber, :pmTypeId, :provider, :expiryDate, :cvc)")
                        .bind("uid", paymentMethod.getUid())
                        .bind("accountName", paymentMethod.getAccountName())
                        .bind("accountNumber", paymentMethod.getAccountNumber())
                        .bind("pmTypeId", paymentMethod.getPmTypeId())
                        .bind("provider", paymentMethod.getProvider())
                        .bind("expiryDate", paymentMethod.getExpiryDate())
                        .bind("cvc", paymentMethod.getCvc())
                        .executeAndReturnGeneratedKeys("pmid")
                        .mapTo(Integer.class)
                        .one()
        );
    }
}

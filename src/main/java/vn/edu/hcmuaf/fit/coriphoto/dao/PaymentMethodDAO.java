package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;

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

    public static void main(String[] args) {

    }
}

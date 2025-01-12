package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.License;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;

public class LicenseDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public int getIdLicenseByName(String licenseName) {
        String sql = "SELECT licenseId FROM licenses WHERE licenseName = :licenseName";

        return jdbi.withHandle(handle -> handle.createQuery(sql)
                .bind("licenseName", licenseName)
                .mapTo(int.class)  // Ánh xạ kết quả thành kiểu int
                .findOne()  // Lấy kết quả đầu tiên (nếu có)
                .orElse(null));
    }

    public String getName(int licenseId) {
        String query = "SELECT licenseName FROM licenses WHERE licenseId = ?";
        return jdbi.withHandle(handle -> handle.createQuery(query)
                .bind(0, licenseId).mapTo(String.class).one());
    }

}

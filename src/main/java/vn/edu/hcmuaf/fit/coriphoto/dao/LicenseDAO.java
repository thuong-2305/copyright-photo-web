package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;

public class LicenseDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public String getName(int licenseId) {
        String query = "SELECT licenseName FROM licenses WHERE licenseId = ?";
        return jdbi.withHandle(handle -> handle.createQuery(query)
                .bind(0, licenseId).mapTo(String.class).one());
    }

    public static void main(String[] args) {
        System.out.println(new LicenseDAO().getName(1));
    }
}

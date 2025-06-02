package vn.edu.hcmuaf.fit.coriphoto.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.coriphoto.dbconnect.DBConnect;
import vn.edu.hcmuaf.fit.coriphoto.model.ProductLicense;

import java.util.List;

public class ProductLicenseDAO {
    private static final Jdbi jdbi = new DBConnect().get();

    public void insertProductLicense(ProductLicense pl) {
        String sql = "INSERT INTO product_license (pid, licenseId) VALUES (:pid, :licenseId)";
        jdbi.withHandle(handle -> handle.createUpdate(sql)
                .bind("pid", pl.getPid())
                .bind("licenseId", pl.getLicenseId())
                .execute());
    }

    public void deleteByPid(int pid) {
        String sql = "DELETE FROM product_license WHERE pid = :pid";
        jdbi.withHandle(handle -> handle.createUpdate(sql)
                .bind("pid", pid)
                .execute());
    }

    public List<ProductLicense> getByPid(int pid) {
        String sql = "SELECT * FROM product_license WHERE pid = :pid";
        return jdbi.withHandle(handle -> handle.createQuery(sql)
                .bind("pid", pid)
                .mapToBean(ProductLicense.class)
                .list());
    }

    public void updateLicenseByPid(int pid, int newLicenseId) {
        String sql = "UPDATE product_license SET licenseId = :licenseId WHERE pid = :pid";
        jdbi.withHandle(handle -> handle.createUpdate(sql)
                .bind("licenseId", newLicenseId)
                .bind("pid", pid)
                .execute());
    }
}

package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.LicenseDAO;

public class LicenseService {
    private final LicenseDAO licenses = new LicenseDAO();

    public int getIdLicenseByName(String licenseName) {
        return licenses.getIdLicenseByName(licenseName);
    }

    public String getLicenseName(int licenseId) {
        return licenses.getName(licenseId);
    }

}
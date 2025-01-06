package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.LicenseDAO;

public class LicenseService {
    private final LicenseDAO licenseDAO = new LicenseDAO();

    public int getIdLicenseByName(String licenseName) {
        return licenseDAO.getIdLicenseByName(licenseName);
    }
}
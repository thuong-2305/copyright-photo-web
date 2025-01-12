package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.LicenseDAO;

public class LicenseService {
    private final LicenseDAO licenses = new LicenseDAO();

    public String getLicenseName(int licenseId) {
        return licenses.getName(licenseId);
    }

    public static void main(String[] args) {
        System.out.println(new LicenseService().getLicenseName(1));
    }
}
package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.ProductLicenseDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.ProductLicense;

import java.util.List;

public class ProductLicenseService {

    private final ProductLicenseDAO productLicenseDAO = new ProductLicenseDAO();

    public void insertProductLicense(ProductLicense pl) { productLicenseDAO.insertProductLicense(pl); }

    public void deleteByPid(int pid) { productLicenseDAO.deleteByPid(pid); }

    public List<ProductLicense> getByPid(int pid) { return productLicenseDAO.getByPid(pid); }

    public void updateLicenseByPid(int pid, int newLicenseId) { productLicenseDAO.updateLicenseByPid(pid, newLicenseId); }

}

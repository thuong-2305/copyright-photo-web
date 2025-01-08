package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.coriphoto.dao.LisenseDAO;

public class LisenseService {
    private final LisenseDAO lisenses = new LisenseDAO();

    public String getLisenseName(int lisenseId) {
        return lisenses.getName(lisenseId);
    }
}
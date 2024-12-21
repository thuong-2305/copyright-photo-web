package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;

import java.util.List;

public class CategoryService {
    private final CategoryDAO categories = new CategoryDAO();

    public List<Category> getAll() {
        return categories.getAll();
    }

    public List<Category> getTrendCategory() {
        return categories.getTrendCategory();
    }

}

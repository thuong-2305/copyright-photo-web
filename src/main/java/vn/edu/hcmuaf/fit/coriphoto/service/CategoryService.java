package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.CategoryDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.model.CategoryParent;

import java.util.List;

public class CategoryService {
    private final CategoryDAO categories = new CategoryDAO();

    public List<Category> getAll() {
        return categories.getAll();
    }

    public List<Category> getTrendCategory() {
        return categories.getTrendCategory();
    }

    public List<CategoryParent> getTypeImages() {
        return categories.getTypeImage();
    }

    public Category getById(int cid) {
        return categories.getById(cid);
    }

    public boolean deleteCategory(int cid) {
        return categories.deleteCategory(cid);
    }

    public boolean updateCategory(int cid, String name) {
        return categories.updateCategory(cid, name);
    }

    public boolean addCategory(String name, int cpid) {
        return categories.addCategory(name, cpid);
    }

    public int getCategoryIdByName(String name) {
        return categories.getCategoryIdByName(name);
    }

    public String getNameCategoryById(int cid) { return categories.getNameCategoryById(cid); }

}

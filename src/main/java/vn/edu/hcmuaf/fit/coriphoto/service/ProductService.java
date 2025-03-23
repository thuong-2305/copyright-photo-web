package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.ProductDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts;

import java.time.LocalDateTime;
import java.util.List;

public class ProductService {
    private final ProductDAO products = new ProductDAO();

    public List<Product> getAll() {
        return products.getALl();
    }

    public Product getById(int id) {
        return products.getById(id);
    }

    public boolean addProduct(Product product) {
        return products.addProduct(product);
    }
    public boolean deleteProductById(int id) {
        return products.deleteProductById(id);
    }

    public void updateProduct(Product product) {
        products.updateProduct(product);
    }

    public List<TrendProducts> getTopTrend() {
        return products.getTrendProducts();
    }

    public List<Product> getByCategoryId(int cid) {
        return products.getByCategoryId(cid);
    }

    public List<Product> sortProductsLatest(int cid) {
        return products.sortProductsLatest(cid);
    }

    public List<Product> getProductPopular(int cid) {
        return products.getProductPopular(cid);
    }

    public List<Product> getProductLatest(int cid) {
        return products.getProductLatest(cid);
    }

    public List<Product> getProductsRelated(int cid, int id) {
        return products.getProductsRelated(cid, id);
    }

    public void addProduct(int uid, int cid, String name, String description, String size,
                           String dimension, LocalDateTime dateUpload, String url, double price) {
        products.addProduct(uid, cid, name, description, size, dimension, dateUpload, url, price);
    }

    public List<Product> searchGetProducts(String content) {
        return products.searchGetProducts(content);
    }

    public List<Product> getAllProductsWaiting() { return products.getAllProductsWaiting(); }

    public boolean updateStatus(String action, int id) { return products.updateStatus(action, id); }

    public int getInNextProduct() { return products.getInNextProduct(); }
}

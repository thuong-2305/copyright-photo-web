package vn.edu.hcmuaf.fit.coriphoto.service;

import vn.edu.hcmuaf.fit.coriphoto.dao.ProductDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts;

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



    public static void main(String[] args) {
        List<Product> res = new ProductService().sortProductsLatest(23);
        res.forEach(e -> System.out.println(e));
    }
}

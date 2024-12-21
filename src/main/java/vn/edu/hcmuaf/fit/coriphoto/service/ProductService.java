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

    public List<TrendProducts> getTopTrend() {
        return products.getTrendProducts();
    }

    public static void main(String[] args) {
        List<TrendProducts> res = new ProductService().getTopTrend();
        res.forEach(e -> System.out.println(res.size()));
    }
}

package vn.edu.hcmuaf.fit.coriphoto.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "SearchController", value = "/search")
public class SearchController extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy parameters
        String content = request.getParameter("content");
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        String[] sizes = request.getParameterValues("size");
        String quality = request.getParameter("quality");

        if (content == null) content = "";

        // Tìm kiếm cơ bản
        List<Product> products = productService.searchGetProducts(content.trim());

        // Áp dụng filters
        try {
            // Filter by price
            if (minPriceStr != null && !minPriceStr.isEmpty() ||
                    maxPriceStr != null && !maxPriceStr.isEmpty()) {
                double minPrice = minPriceStr != null && !minPriceStr.isEmpty() ?
                        Double.parseDouble(minPriceStr) : 0;
                double maxPrice = maxPriceStr != null && !maxPriceStr.isEmpty() ?
                        Double.parseDouble(maxPriceStr) : Double.MAX_VALUE;

                products = productService.filterByPrice(products, minPrice, maxPrice);
            }

            // Filter by size
            if (sizes != null && sizes.length > 0) {
                List<Product> sizeFiltered = new ArrayList<>();

                for (String size : sizes) {
                    sizeFiltered.addAll(productService.filterBySize(products, size));
                }

                // Remove duplicates
                products = sizeFiltered.stream().distinct().collect(Collectors.toList());
            }

            // Filter by quality
            if (quality != null && !quality.isEmpty()) {
                products = productService.filterByQuality(products, quality);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set attributes
        request.setAttribute("products", products);
        request.setAttribute("content", content);

        // Forward to JSP
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private List<Product> sortProducts(List<Product> products, String sortType) {
        switch (sortType) {
            case "newest":
                products.sort((p1, p2) -> p2.getDateUpload().compareTo(p1.getDateUpload()));
                break;
            case "price-low":
                products.sort((p1, p2) -> Double.compare(p1.getPrice(), p2.getPrice()));
                break;
            case "price-high":
                products.sort((p1, p2) -> Double.compare(p2.getPrice(), p1.getPrice()));
                break;
            case "popular":
                // Implement popularity sorting if you have view count
                break;
            default:
                // relevant - keep original order
                break;
        }
        return products;
    }
}
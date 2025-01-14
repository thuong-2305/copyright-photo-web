package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductsController", value = "/admin-products")
public class AdminProductsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService service = new ProductService();
        // Lấy danh sách sp từ service
        List<Product> products = service.getAll();
//        for (Product p : products) {
//            System.out.println(p.getName());
//        }
        // Gửi danh sách sp tới JSP
        request.setAttribute("products", products);

        request.getRequestDispatcher("admin-products.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nhận dữ liệu từ form
        String name = request.getParameter("nameProduct");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String contributor = request.getParameter("contributor");
        String status = request.getParameter("status");

        // Tạo đối tượng Product
        Product product = new Product();
        product.setName(name);
        product.setDescription(description);
        product.setCid(Integer.parseInt(category)); // Lưu ý: Loại ảnh (Category ID)
        product.setPrice(price);
        product.setUid(Integer.parseInt(contributor)); // Người đóng góp (User ID)
        product.setStatus(status);
        System.out.println(product);

        // Lưu sản phẩm vào database thông qua ProductService
        ProductService productService = new ProductService();
        productService.addProduct(product);

        // Chuyển hướng lại trang quản lý sản phẩm
        response.sendRedirect("admin-products");
    }
}
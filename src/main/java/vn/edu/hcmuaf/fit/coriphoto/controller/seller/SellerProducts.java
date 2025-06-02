package vn.edu.hcmuaf.fit.coriphoto.controller.seller;


import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SellerProducts", value = "/seller-products")
public class SellerProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedBy = request.getHeader("X-Requested-By");
        ProductService service = new ProductService();

        // Xóa sản phẩm dựa vào id
        if ("AJAX".equals(requestedBy)) {
            int productId =Integer.parseInt(request.getParameter("product_id"));
            String action = request.getParameter("action");

            if ("delete".equals(action)) {
                boolean success = service.deleteProductById(productId);
                if (success) {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    // Tạo đối tượng Gson
                    Gson gson = new Gson();

                    Map<String, Object> responseData = new HashMap<>();
                    responseData.put("success", true);
                    // Chuyển đối tượng Map thành JSON
                    String jsonResponse = gson.toJson(responseData);
                    // Gửi dữ liệu JSON về client
                    response.getWriter().write(jsonResponse);
                }
            }
        }
    }
}
package vn.edu.hcmuaf.fit.coriphoto.controller.seller;


import com.google.gson.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.ProductSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SellerProducts", value = "/seller-products")
public class SellerProducts extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        try {
            int productId = Integer.parseInt(id);
            ProductService productService = new ProductService();
            Product product = productService.getById(productId);
            if (product != null) {
                Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDate.class, new JsonSerializer<LocalDate>() {
                        @Override
                        public JsonElement serialize(LocalDate src, Type typeOfSrc, JsonSerializationContext context) {
                            return new JsonPrimitive(src.toString());
                        }
                    })
                    .registerTypeAdapter(LocalDateTime.class, new JsonSerializer<LocalDateTime>() {
                        @Override
                        public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
                            return new JsonPrimitive(src.toString());
                        }
                    })
                    .registerTypeAdapter(Product.class, new ProductSerializer())
                    .create();
                String jsonResponse = gson.toJson(product);
                response.getWriter().write(jsonResponse);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Sản phẩm không tồn tại");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ");
        }
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
                System.out.println(success);
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
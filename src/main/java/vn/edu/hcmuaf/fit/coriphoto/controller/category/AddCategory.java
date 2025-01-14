package vn.edu.hcmuaf.fit.coriphoto.controller.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;

import java.io.IOException;

@WebServlet(name = "AddCategory", value = "/addCategory")
public class AddCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Đọc dữ liệu JSON từ body của request
        StringBuilder jsonData = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            jsonData.append(line);
        }

        // Parse JSON
        JSONObject jsonObject = new JSONObject(jsonData.toString());
        String categoryName = jsonObject.getString("categoryName");

        // Kiểm tra xem tên danh mục có trống không
        if (categoryName == null || categoryName.trim().isEmpty()) {
            // Trả về lỗi nếu tên danh mục không hợp lệ
            response.getWriter().write("{\"success\": false, \"message\": \"Tên danh mục không được để trống\"}");
            return;
        }

        // Thêm danh mục vào cơ sở dữ liệu (hoặc danh sách của bạn)
        CategoryService categoryService = new CategoryService();
        boolean isAdded = categoryService.addCategory(categoryName, 3);

        if (isAdded) {
            // Lấy categoryId từ tên danh mục
            int categoryId = categoryService.getCategoryIdByName(categoryName);

            // Tạo đối tượng JSON để trả về
            JSONObject responseObject = new JSONObject();
            responseObject.put("success", true);
            responseObject.put("message", "Danh mục đã được thêm thành công!");
            responseObject.put("categoryId", categoryId);  // Gửi categoryId về client
            responseObject.put("categoryName", categoryName);  // Gửi categoryName về client

            // Trả về JSON response
            response.getWriter().write(responseObject.toString());
        } else {
            // Nếu có lỗi khi thêm danh mục
            JSONObject responseObject = new JSONObject();
            responseObject.put("success", false);
            responseObject.put("message", "Lỗi khi thêm danh mục");

            response.getWriter().write(responseObject.toString());
        }
    }
}

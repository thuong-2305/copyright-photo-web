package vn.edu.hcmuaf.fit.coriphoto.controller.category;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;

import java.io.IOException;

@WebServlet(name = "GetCategory", value = "/getCategory")
public class GetCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        System.out.println("cid: " + cid);

        // Lấy thông tin danh mục từ service
        CategoryService categoryService = new CategoryService();
        Category category = categoryService.getById(cid); // Phương thức lấy danh mục theo ID

        if (category != null) {
            // Chuyển đối tượng Category thành JSON
            Gson gson = new Gson();
            String categoryJson = gson.toJson(category);

            // Cấu hình phản hồi là JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            // Gửi JSON về client
            response.getWriter().write(categoryJson);
        } else {
            // Nếu không tìm thấy danh mục, trả về lỗi 404
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Danh mục không tồn tại");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

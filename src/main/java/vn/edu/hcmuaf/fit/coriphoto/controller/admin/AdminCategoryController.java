package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminCategoryController", value = "/admin-category")
public class AdminCategoryController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        List<Category> categories = categoryService.getAll_notImage();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("admin-category.jsp").forward(request,response);
    }



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        CategoryService categoryService = new CategoryService();

        if ("delete".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            boolean success = categoryService.deleteCategory(categoryId);
            if (success) {
                // Trả về dữ liệu JSON cho AJAX
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Tạo đối tượng Gson
                Gson gson = new Gson();

                Map<String, Object> responseData = new HashMap<>();
                responseData.put("success", true);
                // Chuyển đối tượng Map thành JSON
                String jsonResponse = gson.toJson(responseData);
                System.out.println("jsonResponse " + jsonResponse);
                // Gửi dữ liệu JSON về client
                response.getWriter().write(jsonResponse);
            }
        }
        else {
            String categoryName = request.getParameter("category_name");
            boolean success = categoryService.addCategory(categoryName, 0);
            if (success) {
                // Trả về dữ liệu JSON cho AJAX
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                // Tạo đối tượng Gson
                Gson gson = new Gson();

                Map<String, Object> responseData = new HashMap<>();
                responseData.put("success", true);
                // Chuyển đối tượng Map thành JSON
                String jsonResponse = gson.toJson(responseData);
                System.out.println("jsonResponse " + jsonResponse);
                // Gửi dữ liệu JSON về client
                response.getWriter().write(jsonResponse);
            }
        }
    }
}

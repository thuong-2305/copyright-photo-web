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

        boolean success;

        if ("delete".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            success = categoryService.deleteCategory(categoryId);
        }
        else if ("edit".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String categoryName = request.getParameter("category_name");
            success = categoryService.updateCategory(categoryId, categoryName);
        }
        else {
            String categoryName = request.getParameter("category_name");
            success = categoryService.addCategory(categoryName, 0);
        }

        if (success) {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            Gson gson = new Gson();

            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", true);

            String jsonResponse = gson.toJson(responseData);

            response.getWriter().write(jsonResponse);
        }
    }
}

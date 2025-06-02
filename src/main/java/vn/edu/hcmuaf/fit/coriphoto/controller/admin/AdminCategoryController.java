package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;

import java.io.IOException;
import java.time.LocalDateTime;
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
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        String action = request.getParameter("action");
        CategoryService categoryService = new CategoryService();
        boolean success;

        if ("delete".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            success = categoryService.deleteCategory(categoryId);

            ActivityLog loginLog = new ActivityLog("DANGER", user.getUid(),
                    user.getUsername(), LocalDateTime.now(),
                    user.getUsername() + " đã xóa thông tin danh mục có id:" + categoryId);
            new LogService().insertLog(loginLog);

        }
        else if ("edit".equals(action)) {
            int categoryId = Integer.parseInt(request.getParameter("category_id"));
            String categoryName = request.getParameter("category_name");
            success = categoryService.updateCategory(categoryId, categoryName);

            ActivityLog loginLog = new ActivityLog("WARNING", user.getUid(),
                    user.getUsername(), LocalDateTime.now(),
                    user.getUsername() + " đã cập nhật thông tin danh mục có id:" + categoryId);
            new LogService().insertLog(loginLog);
        }
        else {
            String categoryName = request.getParameter("category_name");
            success = categoryService.addCategory(categoryName, 0);

            ActivityLog loginLog = new ActivityLog("INFO", user.getUid(),
                    user.getUsername(), LocalDateTime.now(),
                    user.getUsername() + " đã thêm danh mục mới có tên:" + categoryName);
            new LogService().insertLog(loginLog);
        }

        if (success) {
            Gson gson = new Gson();

            Map<String, Object> responseData = new HashMap<>();
            responseData.put("success", true);

            String jsonResponse = gson.toJson(responseData);

            response.getWriter().write(jsonResponse);
        }
    }
}

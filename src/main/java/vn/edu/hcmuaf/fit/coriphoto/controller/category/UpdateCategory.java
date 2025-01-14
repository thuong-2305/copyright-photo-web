package vn.edu.hcmuaf.fit.coriphoto.controller.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;

import java.io.IOException;

@WebServlet(name = "UpdateCategory", value = "/updateCategory")
public class UpdateCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("categoryId");
        String categoryName = request.getParameter("categoryName");

        // Cập nhật danh mục trong cơ sở dữ liệu
        CategoryService categoryService = new CategoryService();
        boolean isUpdated = categoryService.updateCategory(Integer.parseInt(categoryId), categoryName);

        if (isUpdated) {
            response.sendRedirect("/admin-category");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Cập nhật không thành công");
        }
    }
}

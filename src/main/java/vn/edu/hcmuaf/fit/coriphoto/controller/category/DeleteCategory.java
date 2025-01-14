package vn.edu.hcmuaf.fit.coriphoto.controller.category;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;

import java.io.IOException;

@WebServlet(name = "DeleteCategory", value = "/deleteCategory")
public class DeleteCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        System.out.println("cid: " + cid);
        CategoryService categoryService = new CategoryService();
        categoryService.deleteCategory(cid);
        response.sendRedirect("admin-category");



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

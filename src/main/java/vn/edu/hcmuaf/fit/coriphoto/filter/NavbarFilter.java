package vn.edu.hcmuaf.fit.coriphoto.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;

import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "NavbarFilter", urlPatterns = "/*")
public class NavbarFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//
//        CategoryService categoryService = new CategoryService();
//        List<Category> categories = categoryService.getAll();
//        httpRequest.setAttribute("categories", categories);


        chain.doFilter(request, response);
    }
}
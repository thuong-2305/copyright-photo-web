package vn.edu.hcmuaf.fit.coriphoto.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.io.IOException;

@WebFilter(
        filterName = "AdminFilter" ,
        urlPatterns = {
            "/ShowDashBoard",
            "/admin-products",
            "/admin-customer",
            "/admin-category",
            "/AdminHandleActNotify",
            "/AdminHandleAddImage",
            "/AdminHandleAddProduct",
            "/AdminHandleEditProduct",
            "/AdminhandleViewProductsCategory",
            "/admin-notification",
        })
public class AdminFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws
            ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(true);

        httpResponse.setContentType("application/json");
        httpResponse.setCharacterEncoding("UTF-8");

        User user = (User) session.getAttribute("auth");
        if(user != null) {
            if(user.getRole() != 0)
                return;
        } else return;

        httpRequest.setAttribute("username", user.getUsername());
        chain.doFilter(request, response);
    }
}
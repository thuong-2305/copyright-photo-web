package vn.edu.hcmuaf.fit.coriphoto.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.io.IOException;

@WebFilter(filterName = "AuthFilter" , urlPatterns = "/*")
public class AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws
            ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(true);

        User auth = null;
        if (session != null) {
            auth = (User) session.getAttribute("auth");
        }
        request.setAttribute("auth", auth);

        chain.doFilter(request, response);
    }
}
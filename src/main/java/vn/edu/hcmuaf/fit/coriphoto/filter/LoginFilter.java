package vn.edu.hcmuaf.fit.coriphoto.filter; import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

@WebFilter(filterName = "LoginFilter" , urlPatterns = "/login.jsp")
public class LoginFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(true);

        User auth = (User) session.getAttribute("auth");

        if (auth != null) {
            httpResponse.sendRedirect("/");
            return;
        }

        chain.doFilter(request, response);
    }
}
package vn.edu.hcmuaf.fit.coriphoto.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import vn.edu.hcmuaf.fit.coriphoto.model.Cart;
import vn.edu.hcmuaf.fit.coriphoto.model.Category;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;
import vn.edu.hcmuaf.fit.coriphoto.service.CategoryService;

import java.io.IOException;
import java.util.List;

@WebFilter(filterName = "NavbarFilter", urlPatterns = "/*")
public class NavbarFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;

        CategoryService categoryService = new CategoryService();
        List<Category> categories = categoryService.getAll();
        httpRequest.setAttribute("categories", categories);

        CartService cartService = new CartService();

        User user = (User) httpRequest.getSession().getAttribute("auth");
        int uid = (user != null) ? user.getUid() : -1;
        int cartLen;
        if(uid > -1) {
            Cart cart = cartService.getCart(uid);
            cartLen = cart.getNumItems();
        }
        else {
            try {
                int uidTemp = (Integer) httpRequest.getSession().getAttribute("idCartNotLogin");
                Cart cart = cartService.getCart(uidTemp);
                cartLen = cart.getNumItems();
            } catch(Exception _) {
                cartLen = 0;
            }
        }

        httpRequest.setAttribute("cartLength", cartLen);

        chain.doFilter(request, response);
    }
}
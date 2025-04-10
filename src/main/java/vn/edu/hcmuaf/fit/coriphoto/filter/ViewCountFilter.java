package vn.edu.hcmuaf.fit.coriphoto.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.service.ViewService;

import java.io.IOException;


@WebFilter(filterName = "ViewCount", urlPatterns = {"/product-detail"})
public class ViewCountFilter implements Filter {
    private ViewService viewService = new ViewService();

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (request instanceof HttpServletRequest httpReq) {
            HttpSession session = httpReq.getSession();
            // Kiểm tra xem tham số "pid" có tồn tại trong request hay không
            String pid = httpReq.getParameter("pid");
            if (pid != null && !pid.trim().isEmpty()) {
                // Ghi nhận lượt view nếu chưa được đánh dấu trong session
                viewService.recordView(pid, session);
            }
        }

        // Tiếp tục chuyển request cho Filter/Servlet tiếp theo
        chain.doFilter(request, response);
    }
}
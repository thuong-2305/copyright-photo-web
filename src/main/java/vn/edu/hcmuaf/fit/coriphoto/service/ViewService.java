package vn.edu.hcmuaf.fit.coriphoto.service;

import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.dao.ViewDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.util.List;

public class ViewService {
    private ViewDAO viewDao;

    public ViewService() {
        this.viewDao = new ViewDAO();
    }

    // Phương thức ghi nhận lượt view nếu trong session chưa có flag cho sản phẩm pid
    public void recordView(String pid, HttpSession session) {
        String sessionKey = "viewed_" + pid;
        if (session.getAttribute(sessionKey) == null) {
            User user = (User) session.getAttribute("auth");
            int uid = -1; // Không có user
            if (user != null) {
                uid = user.getUid();
            }
            String sessionId = session.getId();
            viewDao.incrementView(pid, uid, sessionId);
            // Đánh dấu flag để lần reload sau không tăng view nữa
            System.out.println("Session id = "+sessionId);
            session.setAttribute(sessionKey, true);
        }
    }

    public List<Product> getTopViewedProducts(int limit) {
        return viewDao.getTopViewedProducts(limit);
    }
}
package vn.edu.hcmuaf.fit.coriphoto.controller.favourite;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.dao.FavouriteDAO;
import vn.edu.hcmuaf.fit.coriphoto.model.Favourite;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "Favourite", value = "/Favourite")
public class FavouriteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("auth");

        if (currentUser == null) {
            // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy danh sách sản phẩm yêu thích của người dùng
        FavouriteDAO favoriteDAO = new FavouriteDAO();
        List<Product> favoriteProducts = favoriteDAO.getFavouriteProducts(currentUser.getUid());

        // Đặt dữ liệu vào request attribute
        request.setAttribute("favoriteProducts", favoriteProducts);

        // Chuyển hướng đến trang JSP hiển thị danh sách yêu thích
        request.getRequestDispatcher("favourite.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        try {
            // 1. Lấy thông tin người dùng từ session
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("auth");

            // 2. Kiểm tra đăng nhập
            if (currentUser == null) {
                // Người dùng chưa đăng nhập
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Vui lòng đăng nhập để sử dụng tính năng này");
                jsonResponse.put("redirectToLogin", true);
                out.print(jsonResponse.toString());
                return;
            }

            // 3. Lấy thông tin sản phẩm từ request
            int userId = currentUser.getUid();
            int productId = Integer.parseInt(request.getParameter("productId"));
            String action = request.getParameter("action");

            // 4. Khởi tạo đối tượng DAO
            FavouriteDAO favoriteDAO = new FavouriteDAO();

            // 5. Xử lý yêu cầu tùy thuộc vào action
            if ("toggle".equals(action)) {
                // Kiểm tra xem sản phẩm đã yêu thích chưa
                boolean isFavorite = favoriteDAO.checkFavouriteExists(userId, productId);

                if (isFavorite) {
                    // Nếu đã yêu thích, xóa khỏi danh sách
                    favoriteDAO.removeFavourite(userId, productId);
                    jsonResponse.put("isFavorite", false);
                    jsonResponse.put("message", "Đã xóa sản phẩm khỏi danh sách yêu thích");
                } else {
                    // Nếu chưa yêu thích, thêm vào danh sách
                    // Tạo đối tượng Favourite
                    Favourite favourite = new Favourite();
                    favourite.setUserId(userId);
                    favourite.setProductId(productId);
                    favourite.setDateAdded(new Timestamp(System.currentTimeMillis()));

                    favoriteDAO.addFavourite(favourite);
                    jsonResponse.put("isFavorite", true);
                    jsonResponse.put("message", "Đã thêm sản phẩm vào danh sách yêu thích");
                }

                jsonResponse.put("success", true);
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "Không hỗ trợ hành động này");
            }

        } catch (Exception e) {
            // Xử lý ngoại lệ
            jsonResponse.put("success", false);
            jsonResponse.put("message", "Đã xảy ra lỗi: " + e.getMessage());
            e.printStackTrace();
        }

        out.print(jsonResponse.toString());
    }
}
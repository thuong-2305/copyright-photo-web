package vn.edu.hcmuaf.fit.coriphoto.controller.seller;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.SellerService;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ShowStatistic", value = "/ShowStatistic")
public class ShowStatistic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser != null && currentUser.getRole() <= 1 ) {
            request.setAttribute("user", currentUser); // Truyền thông tin người dùng vào request
            String username = currentUser.getUsername();
            request.setAttribute("username", username);
        } else {
            response.sendRedirect("login.jsp");
            return;
        }

        int idSeller = currentUser.getUid();
        SellerService sellerService = new SellerService();

        // Lấy tham số lọc danh mục
        String categoryParentName = request.getParameter("categoryParentName");

        // Lấy dữ liệu sản phẩm từ database
        List<Map<String, Object>> productsStat;
        if (categoryParentName == null || categoryParentName.equals("all") || categoryParentName.isEmpty()) {
            productsStat = sellerService.getProductStatsBySellerId(idSeller);
        } else {
            productsStat = sellerService.getProductStatsByCategory(idSeller, categoryParentName);
        }

        // Xử lý dữ liệu cho các thông số khác
        int buyTotals = sellerService.getBuyTotalsById(idSeller);
        double totalIncome = sellerService.getTotalIncome(idSeller);
        double balance = sellerService.getBalance(idSeller);
        int totalImgSelled = sellerService.getTotalImgSelled(idSeller);
        int totalRecords = productsStat.size();

        System.out.println("Productstat: " + productsStat);

        // Kiểm tra yêu cầu Ajax
        String requestedWith = request.getHeader("X-Requested-With");
        if ("XMLHttpRequest".equals(requestedWith)) {
            // Trả về JSON cho Ajax
            Gson gson = new Gson();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");


            String jsonResponse = gson.toJson(productsStat);
            response.getWriter().write(jsonResponse);
            return; // Dừng xử lý tại đây, không chuyển tiếp đến JSP
        }

        // Set các thuộc tính cho JSP
        request.setAttribute("buyTotals", buyTotals);
        request.setAttribute("totalIncome", totalIncome);
        request.setAttribute("balance", balance);
        request.setAttribute("totalImgSelled", totalImgSelled);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("categoryParentName", categoryParentName);

        // Chuyển tiếp đến JSP
        request.getRequestDispatcher("homepage-seller.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}



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
        if (currentUser != null) {
            request.setAttribute("user", currentUser); // Truyền thông tin người dùng vào request
        } else {
            response.sendRedirect("login.jsp");
            return;
        }

        int idSeller = currentUser.getUid();
        SellerService sellerService = new SellerService();

        // Các tham số phân trang từ DataTables, nếu không có thì đặt mặc định
        int start = 0;  // Default value for start
        int length = 5; // Default value for length
        try {
            start = Integer.parseInt(request.getParameter("start"));
            length = Integer.parseInt(request.getParameter("length"));
        } catch (NumberFormatException e) {
            // Keep default values if the parameters are missing or invalid
        }

        String categoryParentName = request.getParameter("categoryParentName");

        // Lấy dữ liệu sản phẩm từ database với phân trang
        List<Map<String, Object>> productsStat;
        int totalRecords;

        if (categoryParentName == null || categoryParentName.equals("all") || categoryParentName.isEmpty()) {
            productsStat = sellerService.getProductStatsBySellerIdWithPagination(idSeller, start, length);
            totalRecords = sellerService.getTotalRecords(idSeller);
        } else {
            productsStat = sellerService.getProductStatsByCategoryWithPagination(idSeller, categoryParentName, start, length);
            totalRecords = sellerService.getTotalRecordsByCategory(idSeller, categoryParentName);
        }

        // Các thông tin thống kê
        int buyTotals = sellerService.getBuyTotalsById(idSeller);
        double totalIncome = sellerService.getTotalIncome(idSeller);
        double balance = sellerService.getBalance(idSeller);
        int totalImgSelled = sellerService.getTotalImgSelled(idSeller);

        // Clean data before returning JSON
        Gson gson = new Gson();
        for (Map<String, Object> product : productsStat) {
            String cleanedName = cleanName((String) product.get("name"));
            product.put("name", cleanedName);
        }

        // Trả về dữ liệu dưới dạng JSON cho DataTables
        Map<String, Object> result = new HashMap<>();
        result.put("draw", request.getParameter("draw"));
        result.put("recordsTotal", totalRecords);
        result.put("recordsFiltered", totalRecords);
        result.put("data", productsStat);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String jsonResponse = gson.toJson(result);
        response.getWriter().write(jsonResponse);

        // In log để kiểm tra
        System.out.println("Received parameters:");
        System.out.println("Start: " + request.getParameter("start"));
        System.out.println("Length: " + request.getParameter("length"));
        System.out.println("Draw: " + request.getParameter("draw"));
        System.out.println("Total Records: " + totalRecords);
        System.out.println("Data: " + productsStat);
        System.out.println("Category Parent Name: " + categoryParentName);

        System.out.println("Statistics:");
        System.out.println("Buy Totals: " + buyTotals);
        System.out.println("Total Income: " + totalIncome);
        System.out.println("Balance: " + balance);
        System.out.println("Total Images Sold: " + totalImgSelled);
        System.out.println("JSON Response: " + jsonResponse);

        // Truyền các thông tin vào request để gửi tới JSP
        request.setAttribute("buyTotals", buyTotals);
        request.setAttribute("totalIncome", totalIncome);
        request.setAttribute("balance", balance);
        request.setAttribute("totalImgSelled", totalImgSelled);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("categoryParentName", categoryParentName);

        request.getRequestDispatcher("homepage-seller.jsp").forward(request, response);
    }

    private String cleanName(String name) {
        try {
            return new String(name.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return name; // If error occurs, return original name
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}


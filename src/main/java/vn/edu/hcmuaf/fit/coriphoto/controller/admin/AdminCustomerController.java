package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.AuthService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminCustomerController", value = "/admin-customer")
public class AdminCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        if (id != null) {
            try {
                int userId = Integer.parseInt(id);
                AuthService authService = new AuthService();
                User user = authService.getUserById(userId);
                if (user != null) {
                    response.setContentType("application/json");
                    Gson gson = new Gson();
                    String jsonResponse = gson.toJson(user);
                    response.getWriter().write(jsonResponse);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "User không tồn tại");
                }
            } catch (NumberFormatException e) {
                System.out.println(e.getMessage());
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID không hợp lệ");
            }
        } else {
            UserService userService = new UserService();
            List<User> users = userService.getAllCustomers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("admin-customer.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedBy = request.getHeader("X-Requested-By");
        UserService service = new UserService();

        if ("AJAX".equals(requestedBy)) {
            int userId =Integer.parseInt(request.getParameter("user_id"));
            String action = request.getParameter("action");

            if ("delete".equals(action)) {
                boolean success = service.deleteUserById(userId);
                if (success) {
                    // Trả về dữ liệu JSON cho AJAX
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    // Tạo đối tượng Gson
                    Gson gson = new Gson();

                    Map<String, Object> responseData = new HashMap<>();
                    responseData.put("success", true);
                    // Chuyển đối tượng Map thành JSON
                    String jsonResponse = gson.toJson(responseData);
                    System.out.println("jsonResponse " + jsonResponse);
                    // Gửi dữ liệu JSON về client
                    response.getWriter().write(jsonResponse);
                }
            }
        }else{
            String form = request.getParameter("defineForm");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            AuthService authService = new AuthService();


            if ("formAdd".equals(form)) {
                authService.registerUser(email,password,username);
            }else {
                User user = new User();
                user.setEmail(email);
                user.setPassword(password);
                user.setUsername(username);

                user.setUid(Integer.parseInt(request.getParameter("idUser")));
                service.updateUser(user);
            }

            response.sendRedirect("admin-customer");
        }
    }
}
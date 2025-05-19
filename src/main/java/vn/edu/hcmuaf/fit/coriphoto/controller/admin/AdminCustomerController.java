package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.UserSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.EmailSenderTask;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@WebServlet(name = "AdminCustomerController", value = "/admin-customer")
public class AdminCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        List<User> users = userService.getAllCustomers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin-customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedBy = request.getHeader("X-Requested-By");
        UserService userService = new UserService();

        if ("AJAX".equals(requestedBy)) {
            String action = request.getParameter("action");

            if ("delete".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("user_id"));
                boolean success = userService.deleteUserById(userId);
                if (success) {
                    Gson gson = new Gson();

                    Map<String, Object> responseData = new HashMap<>();
                    responseData.put("success", true);
                    String jsonResponse = gson.toJson(responseData);
                    response.getWriter().write(jsonResponse);
                }
            }
            else if ("view".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("user_id"));
                User user = userService.getUser(userId);
                Gson gson = new GsonBuilder()
                        .registerTypeAdapter(LocalDate.class, new JsonSerializer<LocalDate>() {
                            @Override
                            public JsonElement serialize(LocalDate src, Type typeOfSrc, JsonSerializationContext context) {
                                return new JsonPrimitive(src.toString());
                            }
                        })
                        .registerTypeAdapter(LocalDateTime.class, new JsonSerializer<LocalDateTime>() {
                            @Override
                            public JsonElement serialize(LocalDateTime src, Type typeOfSrc, JsonSerializationContext context) {
                                return new JsonPrimitive(src.toString());
                            }
                        })
                        .registerTypeAdapter(User.class, new UserSerializer())
                        .create();

                Map<String, Object> responseData = new HashMap<>();
                responseData.put("success", true);
                responseData.put("user", user);
                String jsonResponse = gson.toJson(responseData);
                response.getWriter().write(jsonResponse);
            }
            else if ("update".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("user_id"));
                String fullName = request.getParameter("fullName");
                String username = request.getParameter("username");

                User user = userService.getUser(userId);
                user.setFullName(fullName);
                user.setUsername(username);
                boolean success = userService.updateUser(user);

                Gson gson = new Gson();

                Map<String, Object> responseData = new HashMap<>();
                responseData.put("success", success);
                String jsonResponse = gson.toJson(responseData);
                response.getWriter().write(jsonResponse);
            }
            else if ("add".equals(action)) {
                String fullName = request.getParameter("fullName");
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("pass");
                int role = Integer.parseInt(request.getParameter("role"));

                User user = new User(role, fullName, username, email, password);
                boolean success = userService.createUser(user);

                if (success) {
                    String subject = "Xác thực tài khoản của bạn trên CopyRightPhoto";
                    String body = "Chúc mừng! Tài khoản của bạn đã được tạo thành công bởi quản trị viên hệ thống trên CopyRightPhoto\n" +
                            "Thông tin đăng nhập:\n" +
                            "Tên đăng nhập: " + username + "\n" +
                            "Email: " + email + "\n" +
                            "Mật khẩu: " + password + "\n" +
                            "Vui lòng đổi mật khẩu sau khi đăng nhập lần đầu.";

                    // Gửi email ở thread riêng để không làm chậm phản hồi ajax
                    ExecutorService executor = Executors.newSingleThreadExecutor();
                    executor.execute(new EmailSenderTask(email, subject, body));
                    executor.shutdown();
                }

                Gson gson = new Gson();

                Map<String, Object> responseData = new HashMap<>();
                responseData.put("success", success);
                String jsonResponse = gson.toJson(responseData);
                response.getWriter().write(jsonResponse);
            }
        }
    }
}
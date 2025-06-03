package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.UserSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.*;
import vn.edu.hcmuaf.fit.coriphoto.service.*;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@WebServlet(name = "AdminCustomerController", value = "/admin-customer")
public class AdminCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();
        List<User> users = userService.getAllUsers();
        PermissionService permissionService = new PermissionService();
        List<Permission> permissions = permissionService.getAllPermissions();
        request.setAttribute("users", users);
        request.setAttribute("permissions", permissions);
        request.getRequestDispatcher("admin-customer.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user_root = (User) session.getAttribute("auth");
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

                    ActivityLog loginLog = new ActivityLog("DANGER", user_root.getUid(),
                            user_root.getUsername(), LocalDateTime.now(),
                            user_root.getUsername() + " đã xóa thông tin user có id:" + userId);
                    new LogService().insertLog(loginLog);
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

                ActivityLog loginLog = new ActivityLog("WARNING", user_root.getUid(),
                        user_root.getUsername(), LocalDateTime.now(),
                        user_root.getUsername() + " đã cập nhật thông tin danh mục có id:" + userId);
                new LogService().insertLog(loginLog);
            }
            else if ("add".equals(action)) {
                String fullName = request.getParameter("fullName");
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("pass");
                int role = Integer.parseInt(request.getParameter("role"));

                User user = new User(role, fullName, username, email, password);
                boolean success = userService.createUser(user);

                // Khởi tạo quyền mặc định khi tạo mới user
                int userId = userService.getUidByEmail(email);
                List<Integer> permissionIds = switch (user.getRole()) {
                    case 2 -> // User
                            Arrays.asList(1);
                    case 1 -> // Seller
                            Arrays.asList(1, 2);
                    case 0 -> // Admin
                            Arrays.asList(1, 2, 3, 8);
                    default -> Collections.emptyList();
                };
                for (Integer permissionId : permissionIds) {
                    int idPR = new PermissionRoleService().getIdPRByIdPermission(permissionId);
                    new PermissionUserService().insertPermissionUser(idPR, userId);
                }
                // End

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

                ActivityLog loginLog = new ActivityLog("INFO", user_root.getUid(),
                        user_root.getUsername(), LocalDateTime.now(),
                        user_root.getUsername() + " đã thêm user mới có name:" + username);
                new LogService().insertLog(loginLog);
            }
        }
    }
}
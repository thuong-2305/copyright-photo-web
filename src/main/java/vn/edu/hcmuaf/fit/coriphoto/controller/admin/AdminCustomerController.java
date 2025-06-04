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
import java.time.format.DateTimeFormatter;
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
            } else if ("updateRole".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("user_id"));
                int newRole = Integer.parseInt(request.getParameter("role"));

                User user = userService.getUser(userId);
                if (user == null) {
                    Map<String, Object> responseData = new HashMap<>();
                    responseData.put("success", false);
                    responseData.put("error", "Không tìm thấy user");
                    response.getWriter().write(new Gson().toJson(responseData));
                    return;
                }

                user.setRole(newRole);
                boolean success = userService.updateUser(user);

                Map<String, Object> responseData = new HashMap<>();
                responseData.put("success", success);
                if (success) {
                    ActivityLog loginLog = new ActivityLog("WARNING", user_root.getUid(),
                            user_root.getUsername(), LocalDateTime.now(),
                            user_root.getUsername() + " đã cập nhật quyền hạn của user có id:" + userId + " thành role: " + newRole);
                    new LogService().insertLog(loginLog);
                } else {
                    responseData.put("error", "Cập nhật quyền hạn thất bại");
                }
                response.getWriter().write(new Gson().toJson(responseData));
            }
            else if ("lock".equals(action)) {
                int userId = Integer.parseInt(request.getParameter("user_id"));
                String lockUntilStr = request.getParameter("lockUntil");
                String lockReason = request.getParameter("lockReason");

                LocalDateTime lockUntil = LocalDateTime.parse(lockUntilStr, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
                AccountLock accountLock = new AccountLock(0, userId, LocalDateTime.now(), lockUntil, lockReason);
                boolean success = userService.lockUser(accountLock);

                Gson gson = new Gson();
                Map<String, Object> responseData = new HashMap<>();
                responseData.put("success", success);
                String jsonResponse = gson.toJson(responseData);
                response.getWriter().write(jsonResponse);

                if (success) {
                    ActivityLog lockLog = new ActivityLog("WARNING", user_root.getUid(),
                            user_root.getUsername(), LocalDateTime.now(),
                            user_root.getUsername() + " đã khóa tài khoản user có id:" + userId + " đến " + lockUntilStr);
                    new LogService().insertLog(lockLog);

                    User user = userService.getUser(userId);
                    String subject = "Tài khoản của bạn đã bị khóa";
                    String body = "Tài khoản của bạn trên CopyRightPhoto đã bị khóa bởi quản trị viên.\n" +
                            "Thời gian khóa: " + LocalDateTime.now() + "\n" +
                            "Thời gian mở khóa: " + lockUntilStr + "\n" +
                            "Lý do: " + (lockReason != null && !lockReason.isEmpty() ? lockReason : "Không có lý do cụ thể") + "\n" +
                            "Vui lòng liên hệ quản trị viên để biết thêm chi tiết.";

                    ExecutorService executor = Executors.newSingleThreadExecutor();
                    executor.execute(new EmailSenderTask(user.getEmail(), subject, body));
                    executor.shutdown();
                }
            }
        }
    }
}
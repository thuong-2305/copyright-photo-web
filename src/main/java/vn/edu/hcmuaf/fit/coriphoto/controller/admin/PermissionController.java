package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;
import vn.edu.hcmuaf.fit.coriphoto.service.PermissionRoleService;
import vn.edu.hcmuaf.fit.coriphoto.service.PermissionUserService;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "PermissionController", urlPatterns = {"/permissions/*"})
public class PermissionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PermissionUserService permissionUserService = new PermissionUserService();
        PermissionRoleService permissionRoleService = new PermissionRoleService();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String pathInfo = request.getPathInfo(); // "/5"
        if (pathInfo == null || !pathInfo.matches("/\\d+")) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(new JSONObject().put("error", "Invalid user ID").toString());
            out.flush();
            return;
        }

        try {
            int uid = Integer.parseInt(pathInfo.substring(1));
            List<Integer> idPRs = permissionUserService.getPermissionRolesByUserId(uid);
            List<Map<String, Object>> permissions = new ArrayList<>();

            for (Integer idPR : idPRs) {
                Integer idPermission = permissionRoleService.getIdPermissionByIdPR(idPR);
                if (idPermission != null) {
                    String permissionName = permissionRoleService.getPermissionNameById(idPermission);
                    Map<String, Object> perm = new HashMap<>();
                    perm.put("idPR", idPR);
                    perm.put("idPermission", idPermission);
                    perm.put("name", permissionName);
                    permissions.add(perm);
                }
            }

            JSONArray jsonArray = new JSONArray(permissions);
            out.print(jsonArray.toString());
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print(new JSONObject().put("error", "Internal error: " + e.getMessage()));
        } finally {
            out.flush();
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PermissionUserService permissionUserService = new PermissionUserService();
        PermissionRoleService permissionRoleService = new PermissionRoleService();
        UserService userService = new UserService();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        User user_root = (User) request.getSession().getAttribute("auth");

        // Đọc dữ liệu JSON từ request body
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            sb.append(line);
        }
        JSONObject jsonRequest = new JSONObject(sb.toString());

        int uid = jsonRequest.getInt("uid");
        int idPermission = jsonRequest.getInt("idPermission");

        // Lấy role của user
        User user = userService.getUser(uid);
        if (user == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(new JSONObject().put("error", "Không tìm thấy user").toString());
            out.flush();
            return;
        }
        int userRole = user.getRole();

        // Kiểm tra quyền có vượt quá cấp quyền hạn của user không
        boolean canAdd = true;
        String errorMessage = "";

        if (userRole == 2) { // User (cấp 1)
            if (idPermission != 1) {
                canAdd = false;
                errorMessage = "User chỉ có thể được cấp quyền 'Đăng ký bán'!";
            }
        } else if (userRole == 1) { // Seller (cấp 2)
            if (idPermission > 3) {
                canAdd = false;
                errorMessage = "Seller chỉ có thể được cấp quyền từ 'Đăng ký bán' đến 'Xóa sản phẩm đã upload'!";
            }
        }
        // Admin (role = 0) có thể cấp tất cả quyền, không cần kiểm tra

        if (!canAdd) {
            response.setStatus(HttpServletResponse.SC_FORBIDDEN);
            out.print(new JSONObject().put("error", errorMessage).toString());
            out.flush();
            return;
        }

        // Tìm idPR từ idPermission
        Integer idPR = permissionRoleService.getIdPRByIdPermission(idPermission);
        if (idPR == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.print(new JSONObject().put("error", "Không tìm thấy permission_role").toString());
            out.flush();
            return;
        }

        // Kiểm tra xem quyền đã được cấp chưa
        if (permissionUserService.hasPermission(uid, idPR)) {
            response.setStatus(HttpServletResponse.SC_CONFLICT);
            out.print(new JSONObject().put("error", "Quyền này đã được cấp cho user!").toString());
            out.flush();
            return;
        }

        // Thêm quyền
        int idPU = permissionUserService.insertPermissionUser(idPR, uid);
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("idPU", idPU);
        out.print(jsonResponse.toString());
        ActivityLog successLog = new ActivityLog("INFO", user_root.getUid(), user_root.getUsername(), LocalDateTime.now(),
                user_root.getUsername() + " đã thêm quyền mới có ID: " + idPermission + " cho user ID: " + uid + " thành công");
        new LogService().insertLog(successLog);
        out.flush();
    }
}
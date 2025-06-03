package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.service.PermissionUserService;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet(name = "PermissionRemoveController", value = "/admin/permissions/remove")
public class PermissionRemoveController extends HttpServlet {

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Thiết lập kiểu phản hồi
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {
            // Đọc JSON từ body
            BufferedReader reader = request.getReader();
            String body = reader.lines().collect(Collectors.joining());
            JSONObject json = new JSONObject(body);

            // Lấy uid và idPR từ JSON
            int uid = json.getInt("uid");
            int idPR = json.getInt("idPR");

            // Gọi DAO để xóa quyền
            PermissionUserService permissionUserDAO = new PermissionUserService();
            boolean success = permissionUserDAO.removePermissionUser(uid, idPR);

            // Trả kết quả
            if (success) {
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write(new JSONObject().put("message", "Xóa quyền thành công").toString());
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write(new JSONObject().put("error", "Không tìm thấy quyền cần xóa hoặc không xóa được").toString());
            }

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write(new JSONObject().put("error", "Lỗi xử lý yêu cầu: " + e.getMessage()).toString());
            e.printStackTrace();
        }
    }
}
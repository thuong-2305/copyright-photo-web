package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(name = "UploadAvatar", value = "/UploadAvatar")
@MultipartConfig
public class UploadAvatar extends HttpServlet {
    private static final String UPLOAD_DIR = "../assets/images/avatars"; // Thư mục lưu ảnh

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");

        if (currentUser == null) {
            response.getWriter().write("User not logged in.");
            return;
        }

        int userId = currentUser.getUid();
        Part filePart = request.getPart("avatar");

        if (filePart == null || filePart.getSize() == 0) {
            response.getWriter().write("No file uploaded.");
            return;
        }

        // Đường dẫn thư mục lưu ảnh
        String uploadPath = getServletContext().getRealPath("/") + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Tạo thư mục nếu chưa tồn tại
        }

        // Đặt tên file theo userID
        String fileName = userId + ".png"; // Định dạng PNG
        File newFile = new File(uploadPath, fileName);

        // Xóa ảnh cũ nếu tồn tại
        if (newFile.exists() && !newFile.delete()) {
            response.getWriter().write("Failed to delete old file.");
            return;
        }

        // Lưu ảnh mới
        try (InputStream input = filePart.getInputStream();
             FileOutputStream output = new FileOutputStream(newFile)) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = input.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
        }

        // Cập nhật đường dẫn ảnh trong database
        String avatarPath = UPLOAD_DIR + "/" + fileName;
        UserService userService = new UserService();
        boolean updateSuccess = userService.updateAvatarPath(userId, avatarPath);

        if (updateSuccess) {
            response.getWriter().write(avatarPath);
        } else {
            response.getWriter().write("Database update failed.");
        }
    }
}

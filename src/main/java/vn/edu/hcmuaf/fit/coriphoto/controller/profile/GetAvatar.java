package vn.edu.hcmuaf.fit.coriphoto.controller.profile;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.*;

@WebServlet(name = "GetAvatar", value = "/GetAvatar")
public class GetAvatar extends HttpServlet {
    private static final String DEFAULT_AVATAR = "../assets/images/avart-default.png";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");

        if (currentUser == null) {
            response.getWriter().write(DEFAULT_AVATAR);
            return;
        }

        int userId = currentUser.getUid();
        UserService userService = new UserService();
        String urlAvatar = userService.getAvatarPath(userId);

        // Nếu avatar chưa có, trả về ảnh mặc định
        if (urlAvatar == null || urlAvatar.isEmpty()) {
            urlAvatar = DEFAULT_AVATAR;
        }

        request.setAttribute("urlAvatar", urlAvatar);
        request.getRequestDispatcher("editprofile.jsp").forward(request, response);
    }
}



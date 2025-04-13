package vn.edu.hcmuaf.fit.coriphoto.controller.admin;

import com.google.gson.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.controller.serializer.UserSerializer;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.lang.reflect.Type;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        UserService service = new UserService();

        if ("AJAX".equals(requestedBy)) {
            int userId = Integer.parseInt(request.getParameter("user_id"));
            String action = request.getParameter("action");


            if ("delete".equals(action)) {
                boolean success = service.deleteUserById(userId);
                if (success) {
                    Gson gson = new Gson();

                    Map<String, Object> responseData = new HashMap<>();
                    responseData.put("success", true);
                    String jsonResponse = gson.toJson(responseData);
                    response.getWriter().write(jsonResponse);
                }
            } else if ("edit".equals(action)) {
                User user = service.getUser(userId);
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

            } else if ("update".equals(action)) {
                String fullName = request.getParameter("fullName");
                String username = request.getParameter("username");

                User user = service.getUser(userId);
                user.setFullName(fullName);
                user.setUsername(username);
                boolean success = service.updateUser(user);

                Gson gson = new Gson();

                Map<String, Object> responseData = new HashMap<>();
                responseData.put("success", success);
                String jsonResponse = gson.toJson(responseData);
                response.getWriter().write(jsonResponse);
            }
        }
    }
}
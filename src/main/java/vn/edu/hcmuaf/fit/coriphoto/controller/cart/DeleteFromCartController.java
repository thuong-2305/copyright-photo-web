package vn.edu.hcmuaf.fit.coriphoto.controller.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.model.Cart;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "DeleteFromCartController", value = "/deleteFromCart")
public class DeleteFromCartController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        JSONObject jsonResponse = new JSONObject();

        try {
            User user = (User) request.getSession().getAttribute("auth");
            String pidStr = request.getParameter("pid");
            if (pidStr == null || pidStr.trim().isEmpty()) {
                jsonResponse.put("error", "Product ID is missing");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
                out.print(jsonResponse.toString());
                out.flush();
                return;
            }

            int pid = Integer.parseInt(pidStr);
            HttpSession session = request.getSession();
            CartService cartService = new CartService();

            Integer uidTemp = (Integer) session.getAttribute("idCartNotLogin");
            int uid = (user != null) ? user.getUid() : (uidTemp != null ? uidTemp : -1); // Giá trị mặc định nếu không có uidTemp

            if (uid == -1) {
                jsonResponse.put("error", "User not authenticated and no temporary cart ID found");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 401
                out.print(jsonResponse.toString());
                out.flush();
                return;
            }

            System.out.println("Tests delete cart: " + uid);
            cartService.deleteItem(uid, pid);
            Cart cart = cartService.getCart(uid);
            int cartLen = cart != null ? cart.getNumItems() : 0;
            double total = cartService.getCartTotal(uid);
            int numChecked = cart != null ? cartService.getNumChecked(cart.getCartId()) : 0;

            jsonResponse.put("cartLen", cartLen);
            jsonResponse.put("total", total);
            jsonResponse.put("numChecked", numChecked);

            out.print(jsonResponse.toString());
        } catch (NumberFormatException e) {
            jsonResponse.put("error", "Invalid product ID format");
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            out.print(jsonResponse.toString());
        } catch (Exception e) {
            jsonResponse.put("error", "Server error: " + e.getMessage());
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
            out.print(jsonResponse.toString());
            e.printStackTrace(); // In stack trace ra log để debug
        } finally {
            out.flush();
            out.close();
        }
    }
}
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        int pid = Integer.parseInt(request.getParameter("pid"));

        HttpSession session = request.getSession();
        CartService cartService = new CartService();

        int uidTemp = (Integer) session.getAttribute("idCartNotLogin");
        int uid = (user != null) ? user.getUid() : uidTemp;

        System.out.println("Tests delete cart:" + uid);
        cartService.deleteItem(uid, pid);
        Cart cart = cartService.getCart(uid);
        int cartLen = cart != null ? cart.getNumItems() : 0;
        double total = cartService.getCartTotal(uid);
        int numChecked = cart != null ? cartService.getNumChecked(cart.getCartId()) : 0;

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("cartLen", cartLen);
        jsonResponse.put("total", total);
        jsonResponse.put("numChecked", numChecked);

        out.print(jsonResponse.toString());
        out.flush();
        out.close();
    }
}
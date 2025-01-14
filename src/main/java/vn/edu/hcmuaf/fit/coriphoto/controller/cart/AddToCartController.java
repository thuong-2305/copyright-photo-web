package vn.edu.hcmuaf.fit.coriphoto.controller.cart;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
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
import java.io.InputStreamReader;
import java.io.PrintWriter;

@WebServlet(name = "AddToCartController", value = "/addToCart")
public class AddToCartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("auth");
        int pid = Integer.parseInt(request.getParameter("pid"));

        HttpSession session = request.getSession();
        CartService cartService = new CartService();

        if (session.getAttribute("idCartNotLogin") == null) {
            int idCartNotLogin = cartService.getNumCar() * -1;
            session.setAttribute("idCartNotLogin", idCartNotLogin);
        }

        int uidTemp = (Integer) session.getAttribute("idCartNotLogin");
        int uid = (user != null) ? user.getUid() : uidTemp;

        boolean addSuccess;
        Cart cart;
        int cartLen;

        addSuccess = cartService.addToCart(pid, uid);
        cart = cartService.getCart(uid);
        cartLen = cart != null ? cart.getNumItems() : 0;

        try {
            Gson gson = new Gson();
            JsonObject data = gson.fromJson(new InputStreamReader(request.getInputStream()), JsonObject.class);
            int licenseId = data.get("licenseId").getAsInt();
            if (licenseId == 2 && cart != null)
                cartService.updatePriceOfCartDetail(cart.getCartId(), pid, licenseId);
        } catch (Exception _) {}

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("addSuccess", addSuccess);
        jsonResponse.put("cartLen", cartLen);

        out.print(jsonResponse.toString());
        out.flush();
        out.close();
    }
}
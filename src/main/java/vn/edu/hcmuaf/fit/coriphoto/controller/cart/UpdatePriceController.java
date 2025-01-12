package vn.edu.hcmuaf.fit.coriphoto.controller.cart;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;

@WebServlet(name = "UpdatePriceController", value = "/updatePrice")
public class UpdatePriceController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject data = gson.fromJson(new InputStreamReader(request.getInputStream()), JsonObject.class);
        boolean isChecked = data.get("checked").getAsBoolean();
        int cartId = data.get("cartId").getAsInt();
        int pid = data.get("pid").getAsInt();
        System.out.println(isChecked + " " + cartId + " " + pid);

        CartService cartService = new CartService();
        if(isChecked) {
            cartService.updateChecked(cartId, 1, pid);
        } else {
            cartService.updateChecked(cartId, 0, pid);
        }
        int numChecked = cartService.getNumChecked(cartId);
        System.out.println(numChecked);

        String gift = "";
        double total = cartService.getCartTotalWithCartId(cartId);
        double totalFinal = 0;

        System.out.println(totalFinal);
        System.out.println(total);

        if(numChecked < 5) {
            gift = "";
            totalFinal = 0;
        }
        else if(numChecked < 11) {
            gift = "Nhận ưu đãi gỉảm 10%";
            totalFinal = total - total * 0.1;
        }
        else if(numChecked < 21) {
            gift = "Nhân ưu đãi giảm 20%";
            totalFinal = total - total * 0.2;
        } else {
            gift = "Nhân ưu đãi giảm 30%";
            totalFinal = total - total * 0.3;
        }

        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("gift", gift);
        jsonResponse.addProperty("total", total);
        jsonResponse.addProperty("totalFinal", totalFinal);
        jsonResponse.addProperty("numChecked", numChecked);

        // Gửi phản hồi về client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(jsonResponse));
        out.flush();
        out.close();
    }
}
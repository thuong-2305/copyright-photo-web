package vn.edu.hcmuaf.fit.coriphoto.controller.cart;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

@WebServlet(name = "UpdateLicenseController", value = "/updateLicense")
public class UpdateLicenseController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        JsonObject data = gson.fromJson(new InputStreamReader(request.getInputStream()), JsonObject.class);
        int cartId = data.get("cartId").getAsInt();
        int pid = data.get("pid").getAsInt(); // Thêm pid để xác định sản phẩm
        int licenseId = data.get("licenseId").getAsInt();

        CartService cartService = new CartService();

        // Cập nhật licenseId và giá trong database
        cartService.updatePriceOfCartDetail(cartId, pid, licenseId);
        double newPrice = cartService.getUpdatedPrice(cartId, pid);


        // Tạo phản hồi JSON
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("success", true);
        jsonResponse.addProperty("newPrice", newPrice); // Trả về giá mới

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(jsonResponse));
        out.flush();
        out.close();
    }
}
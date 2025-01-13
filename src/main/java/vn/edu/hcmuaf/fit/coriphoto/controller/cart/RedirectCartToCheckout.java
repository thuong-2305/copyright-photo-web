package vn.edu.hcmuaf.fit.coriphoto.controller.cart;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.PaymentMethod;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;
import vn.edu.hcmuaf.fit.coriphoto.service.LicenseService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet(name = "RedirectCartToCheckout", value = "/RedirectCartToCheckout")
public class RedirectCartToCheckout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Kiểm tra xem người dùng đã đăng nhập hay chưa
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            response.sendRedirect("/");
            return;
        }

        UserService userService = new UserService();
        List<PaymentMethod> paymentMethods = userService.getAllPaymentMethods(currentUser.getUid());

        // Lấy dữ liệu từ form (request parameters)
        String selectedProductsJson = request.getParameter("selectedProducts");
        int numChecked = Integer.parseInt(request.getParameter("numChecked"));
        double total = Double.parseDouble(request.getParameter("total"));
        double totalFinal = Double.parseDouble(request.getParameter("totalFinal"));

        // Xác định promotionId
        int promotionId;
        if (numChecked < 5) promotionId = 1;
        else if (numChecked < 10) promotionId = 2;
        else if (numChecked < 25) promotionId = 3;
        else promotionId = 4;

        // Parse JSON của selectedProducts
        JsonArray selectedProducts = JsonParser.parseString(selectedProductsJson).getAsJsonArray();

        List<Product> selectedProductList = new ArrayList<>();
        ProductService productService = new ProductService();
        List<String> licenseNames = new ArrayList<>();
        List<Integer> licenseIds = new ArrayList<>();

        for (JsonElement element : selectedProducts) {
            JsonObject productObject = element.getAsJsonObject();
            int cartId = productObject.get("cartId").getAsInt();
            int productId = productObject.get("productId").getAsInt();
            int licenseId = productObject.get("licenseId").getAsInt();

            String licenseName = new LicenseService().getLicenseName(licenseId);
            Product product = productService.getById(productId);

            selectedProductList.add(product);
            licenseNames.add(licenseName);
            licenseIds.add(licenseId);
        }

        double discountAmount = total - totalFinal;

        System.out.println("licenseIds: " + licenseIds);
        System.out.println("promotionId: " + promotionId);
        System.out.println("totalAfterDiscount: " + totalFinal);
        System.out.println("paymentMethods: " + paymentMethods);
        System.out.println("numChecked: " + numChecked);
        System.out.println("licenseNames: " + licenseNames);
        System.out.println("products: " + selectedProductList);
        System.out.println("totalBeforeDiscount: " + total);
        System.out.println("discountAmount: " + discountAmount);

        // Đặt các thuộc tính để chuyển sang JSP
        request.setAttribute("licenseIds", licenseIds);
        request.setAttribute("promotionId", promotionId);
        request.setAttribute("totalAfterDiscount", totalFinal);
        request.setAttribute("paymentMethods", paymentMethods);
        request.setAttribute("numChecked", numChecked);
        request.setAttribute("licenseNames", licenseNames);
        request.setAttribute("products", selectedProductList);
        request.setAttribute("totalBeforeDiscount", total);
        request.setAttribute("discountAmount", discountAmount);

        // Forward tới trang JSP
        request.getRequestDispatcher("cart-checkout.jsp").forward(request, response);
    }

}

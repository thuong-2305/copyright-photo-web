package vn.edu.hcmuaf.fit.coriphoto.controller.order;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.dao.PaymentMethodDAO;
import vn.edu.hcmuaf.fit.coriphoto.datetime.FormatDateTime;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
@WebServlet(name = "CartOrderController", value = "/CartOrderController")
public class CartOrderController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra người dùng đã đăng nhập
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            response.sendRedirect("/");
            return;
        }
        int uid = currentUser.getUid();
        String paymentTypeId = request.getParameter("paymentTypeId");
        String pmid = request.getParameter("pmid");
        String[] productIds = request.getParameterValues("productIds");
        String[] productPrices = request.getParameterValues("productPrices");
        String[] licenseIds = request.getParameterValues("licenseIds");
        // Chuyển đổi chuỗi licenseIds thành mảng int
        int[] licenseIdsArray = convertStringToIntArray(licenseIds[0]);
        // Lấy thông tin giảm giá và tổng tiền

        int promotionId = Integer.parseInt(request.getParameter("promotionId"));
        double totalBeforeDiscount = Double.parseDouble(request.getParameter("totalBeforeDiscount"));
        double totalAfterDiscount = Double.parseDouble(request.getParameter("totalAfterDiscount"));
        double discountAmount = 0;

        if (totalAfterDiscount == 0) {
            totalAfterDiscount = totalBeforeDiscount;
            discountAmount = 0;
        }
        else {
            discountAmount = totalBeforeDiscount - totalAfterDiscount;

        }

        int numChecked = Integer.parseInt(request.getParameter("numChecked"));

        request.setAttribute("totalBeforeDiscount", totalBeforeDiscount);
        request.setAttribute("totalAfterDiscount", totalAfterDiscount);
        request.setAttribute("discountAmount", discountAmount);
        request.setAttribute("numChecked", numChecked);

        // Nếu không có sản phẩm nào, trả về lỗi
        if (productIds == null || productIds.length == 0) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Không có sản phẩm nào để thanh toán.");
            return;
        }
        // Tính toán lại giá sản phẩm dựa trên licenseIds
        for (int i = 0; i < productPrices.length; i++) {
            if (licenseIdsArray[i] == 2) { // Nếu licenseId là 2, tăng giá gấp đôi
                double price = Double.parseDouble(productPrices[i]);
                productPrices[i] = String.valueOf(price * 2);
            }
        }

        ProductService productService = new ProductService();
        List<Product> products = new ArrayList<>();
        for (String ele : productIds) {
            products.add(productService.getById(Integer.parseInt(ele)));
        }

        // Chuẩn bị dịch vụ liên quan
        OrderService orderService = new OrderService();
        PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
        UserService userService = new UserService();
        int getPmId = -1; // ID phương thức thanh toán

        if (pmid == null || pmid.isEmpty()) {
            // Tạo phương thức thanh toán nếu chưa có
            if (Integer.parseInt(paymentTypeId) == 1) {
                LocalDate cardExpiryLD = FormatDateTime.format(request.getParameter("cardExpiry"));
                userService.addPaymentMethodCard(uid,
                        request.getParameter("cardName"),
                        request.getParameter("cardNumber"),
                        Integer.parseInt(paymentTypeId),
                        request.getParameter("cardBank"),
                        cardExpiryLD,
                        Integer.parseInt(request.getParameter("cardCVC")));
                getPmId = paymentMethodDAO.getPmidByUidAccountNumber(uid, request.getParameter("cardNumber"));
            } else if (Integer.parseInt(paymentTypeId) == 2) {
                LocalDate bankExpiryLD = FormatDateTime.format(request.getParameter("bankExpiry"));
                userService.addPaymentMethodBank(uid,
                        request.getParameter("bankAccountHolder"),
                        request.getParameter("bankAccountNumber"),
                        Integer.parseInt(paymentTypeId),
                        request.getParameter("bankName"),
                        bankExpiryLD);
                getPmId = paymentMethodDAO.getPmidByUidAccountNumber(uid, request.getParameter("bankAccountNumber"));
            }
        } else {
            getPmId = Integer.parseInt(pmid);
        }
        // Tạo đơn hàng cho từng sản phẩm
        CartService cartService = new CartService();


        for (int i = 0; i < productIds.length; i++) {
            int licenseId = licenseIdsArray[i];
            // Gọi service để tạo đơn hàng
            orderService.createOrder(uid, getPmId, promotionId, licenseId, totalBeforeDiscount, products);
            cartService.deleteItem(uid, Integer.parseInt(productIds[i]));
        }
        // Chuyển hướng sau khi hoàn thành
        response.sendRedirect("/");
    }
    // Hàm chuyển đổi chuỗi có dấu ngoặc vuông và số phân tách dấu phẩy thành mảng int
    private static int[] convertStringToIntArray(String str) {
        // Loại bỏ dấu ngoặc vuông và khoảng trắng, sau đó tách các số theo dấu phẩy
        str = str.replaceAll("[\\[\\]\\s]", "");
        String[] stringNumbers = str.split(",");
        // Chuyển đổi mảng chuỗi thành mảng int
        int[] intArray = new int[stringNumbers.length];
        for (int i = 0; i < stringNumbers.length; i++) {
            intArray[i] = Integer.parseInt(stringNumbers[i]);
        }
        return intArray;
    }
}
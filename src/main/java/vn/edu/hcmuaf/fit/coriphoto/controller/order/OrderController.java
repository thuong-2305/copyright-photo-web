package vn.edu.hcmuaf.fit.coriphoto.controller.order;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Or;
import vn.edu.hcmuaf.fit.coriphoto.dao.PaymentMethodDAO;
import vn.edu.hcmuaf.fit.coriphoto.dao.UserDAO;
import vn.edu.hcmuaf.fit.coriphoto.datetime.FormatDateTime;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderController", value = "/OrderController")
public class OrderController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ request
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            response.sendRedirect("/");
            return;
        }

        int uid = currentUser.getUid();
        String userEmail = currentUser.getEmail();


        String paymentTypeId = request.getParameter("paymentTypeId");
        String pmid = request.getParameter("pmid");

        String bankAccountHolder = request.getParameter("bankAccountHolder");
        String bankAccountNumber = request.getParameter("bankAccountNumber");
        String bankName = request.getParameter("bankName");
        String bankExpiry = request.getParameter("bankExpiry");

        String cardName = request.getParameter("cardName");
        String cardNumber = request.getParameter("cardNumber");
        String cardExpiry = request.getParameter("cardExpiry");
        String cardCVC = request.getParameter("cardCVC");
        String cardBank = request.getParameter("cardBank");

        System.out.println("paymentTypeId" + paymentTypeId);
        System.out.println("pmid" + pmid);


        System.out.println("Thanh toán bằng thẻ tín dụng:");
        System.out.println("Tên trên thẻ: " + cardName);
        System.out.println("Số thẻ: " + cardNumber);
        System.out.println("Card Bank: " + cardBank);
        System.out.println("Ngày hết hạn: " + cardExpiry);
        System.out.println("CVC: " + cardCVC);


        // Xử lý logic liên quan đến tài khoản ngân hàng
        System.out.println("Thanh toán bằng tài khoản ngân hàng:");
        System.out.println("Chủ tài khoản: " + bankAccountHolder);
        System.out.println("Số tài khoản: " + bankAccountNumber);
        System.out.println("Tên ngân hàng: " + bankName);
        System.out.println("Ngày hết hạn: " + bankExpiry);


        int promotionId = Integer.parseInt(request.getParameter("promotionId"));
        double totalAfterDiscount = Double.parseDouble(request.getParameter("totalAfterDiscount"));
        int licenseId = Integer.parseInt(request.getParameter("licenseId"));
        double totalBeforeDiscount = Double.parseDouble(request.getParameter("totalBeforeDiscount"));


        // Lấy thông tin sản phẩm
        String[] productIds = request.getParameterValues("productIds");
        String[] productNames = request.getParameterValues("productNames");
        String[] productPrices = request.getParameterValues("productPrices");

        if (licenseId == 2) {
            for (int i = 0; i < productPrices.length; i++) {
                double price = Double.parseDouble(productPrices[i]);
                productPrices[i] = String.valueOf(price * 2);
            }
        }

        ProductService productService = new ProductService();
        List<Product> products = new ArrayList<>();
        for (String ele : productIds) {
            products.add(productService.getById(Integer.parseInt(ele)));
        }

        // In các giá trị đã lấy từ request
        System.out.println("Products: " + products);
        System.out.println("Promotion ID: " + promotionId);
        System.out.println("Total After Discount: " + totalAfterDiscount);
        System.out.println("License ID: " + licenseId);

        // In thông tin sản phẩm
        if (productIds != null) {
            System.out.println("Product IDs: ");
            for (String productId : productIds) {
                System.out.println(productId);
            }
        }

        if (productNames != null) {
            System.out.println("Product Names: ");
            for (String productName : productNames) {
                System.out.println(productName);
            }
        }

        if (productPrices != null) {
            System.out.println("Product Prices: ");
            for (String productPrice : productPrices) {
                System.out.println(productPrice);
            }
        }

        OrderService orderService = new OrderService();

        // thanh toán bằng thẻ có sẵn lưu trong tài khoản
        if (!pmid.isEmpty()) {
            boolean isOrderCreated = orderService.createOrder(uid, Integer.parseInt(pmid), promotionId, licenseId, totalBeforeDiscount, products);
            System.out.println("Tạo đơn thành công: " + isOrderCreated);
            if (isOrderCreated) {
                Product product = products.get(0);
                String imageName = product.getName();
                String imageUrl = product.getUrl();
                if (imageUrl.startsWith("../")) {
                    imageUrl = imageUrl.substring(3);
                }
                String absolutePath = request.getServletContext().getRealPath(imageUrl);
                EmailUtils.sendEmailWithAttachment(userEmail, "Thông tin đơn hàng",
                        "Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi!\n\n" +
                                "===== THÔNG TIN ĐƠN HÀNG =====\n" +
                                "- Số tiền thanh toán: " + totalAfterDiscount + " VND\n" +
                                "- Ngày mua hàng: " + FormatDateTime.format(LocalDate.now().toString()) + "\n\n" +
                                "Vui lòng kiểm tra file license đính kèm để biết thêm chi tiết về sản phẩm của bạn.\n\n" +
                                "Nếu có bất kỳ thắc mắc nào, đừng ngần ngại liên hệ với chúng tôi.\n\n" +
                                "Hỗ trợ khách hàng: coriphototpk@gmail.com\n\n" +
                                "Trân trọng,\n"
                        , absolutePath, imageName, licenseId);
            }
        }

        // thanh toán bằng các phương thức
        else {
            int getPmId = -1;
            PaymentMethodDAO paymentMethodDAO = new PaymentMethodDAO();
            UserService userService = new UserService();
            if (Integer.parseInt(paymentTypeId) == 1) {
                LocalDate cardExpiryLD = FormatDateTime.format(cardExpiry);
                System.out.println("Add card: " + userService.addPaymentMethodCard(uid, cardName, cardNumber, Integer.parseInt(paymentTypeId), cardBank, cardExpiryLD , Integer.parseInt(cardCVC)));
                getPmId = paymentMethodDAO.getPmidByUidAccountNumber(uid, cardNumber);
                boolean isOrderCreated = orderService.createOrder(uid, getPmId, promotionId, licenseId, totalBeforeDiscount, products);
                System.out.println("Tạo đơn thành công: " + isOrderCreated);
                if (isOrderCreated) {
                    Product product = products.get(0);
                    String imageName = product.getName();
                    String imageUrl = product.getUrl();
                    if (imageUrl.startsWith("../")) {
                        imageUrl = imageUrl.substring(3);
                    }
                    String absolutePath = request.getServletContext().getRealPath(imageUrl);
                    EmailUtils.sendEmailWithAttachment(userEmail, "Thông tin đơn hàng",
                            "Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi!\n\n" +
                                    "===== THÔNG TIN ĐƠN HÀNG =====\n" +
                                    "- Số tiền thanh toán: " + totalAfterDiscount + " VND\n" +
                                    "- Ngày mua hàng: " + FormatDateTime.format(LocalDate.now().toString()) + "\n\n" +
                                    "Vui lòng kiểm tra file license đính kèm để biết thêm chi tiết về sản phẩm của bạn.\n\n" +
                                    "Nếu có bất kỳ thắc mắc nào, đừng ngần ngại liên hệ với chúng tôi.\n\n" +
                                    "Hỗ trợ khách hàng: coriphototpk@gmail.com\n\n" +
                                    "Trân trọng,\n"
                            , absolutePath, imageName, licenseId);
                    response.sendRedirect("order-success.jsp");
                }
                // XỬ LÍ RESPONSE KHI ĐƠN HÀNG không thành công
                else {
                    response.sendRedirect("order-fail.jsp");
                }
            }
            else if (Integer.parseInt(paymentTypeId) == 2) {
                LocalDate bankExpiryLD = FormatDateTime.format(bankExpiry);
                System.out.println("Add bank: " +  userService.addPaymentMethodBank(uid, bankAccountHolder, bankAccountNumber, Integer.parseInt(paymentTypeId), bankName, bankExpiryLD));
                getPmId = paymentMethodDAO.getPmidByUidAccountNumber(uid, bankAccountNumber);
                boolean isOrderCreated = orderService.createOrder(uid, getPmId, promotionId, licenseId, totalBeforeDiscount, products);
                System.out.println("Tạo đơn thành công: " + isOrderCreated);

                if (isOrderCreated) {
                    Product product = products.get(0);
                    String imageName = product.getName();
                    String imageUrl = product.getUrl();
                    if (imageUrl.startsWith("../")) {
                        imageUrl = imageUrl.substring(3);
                    }
                    String absolutePath = request.getServletContext().getRealPath(imageUrl);
                    EmailUtils.sendEmailWithAttachment(userEmail, "Thông tin đơn hàng",
                            "Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi!\n\n" +
                                    "===== THÔNG TIN ĐƠN HÀNG =====\n" +
                                    "- Số tiền thanh toán: " + totalAfterDiscount + " VND\n" +
                                    "- Ngày mua hàng: " + FormatDateTime.format(LocalDate.now().toString()) + "\n\n" +
                                    "Vui lòng kiểm tra file license đính kèm để biết thêm chi tiết về sản phẩm của bạn.\n\n" +
                                    "Nếu có bất kỳ thắc mắc nào, đừng ngần ngại liên hệ với chúng tôi.\n\n" +
                                    "Hỗ trợ khách hàng: coriphototpk@gmail.com\n\n" +
                                    "Trân trọng,\n"
                            , absolutePath, imageName, licenseId);
                    response.sendRedirect("order-success.jsp");
                }
                // XỬ LÍ RESPONSE KHI ĐƠN HÀNG không thành công
                else {
                    response.sendRedirect("order-fail.jsp");
                }
            }
        }
        response.sendRedirect("order-fail.jsp");

    }
}

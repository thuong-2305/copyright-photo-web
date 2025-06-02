package vn.edu.hcmuaf.fit.coriphoto.controller.vnpay.common;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

/**
 *
 * @author CTT VNPAY
 */
@WebServlet(name = "ajaxServlet", value = "/payment")
public class ajaxServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String bankCode = req.getParameter("bankCode");
        double totalBeforeDiscount = Double.parseDouble(req.getParameter("totalBeforeDiscount"));

//        double amountDouble = Double.parseDouble(req.getParameter("totalBill"));

        // Xử lý lưu và tạo đơn hàng khi thanh toán
        OrderService orderService = new OrderService();

        User auth = (User) req.getSession().getAttribute("auth");

        int promotionId = Integer.parseInt(req.getParameter("promotionId"));

        // Lấy mảng licensedIds tu việc mua nhiều sản phẩm từ giỏ hàng
        String[] licenseIds = req.getParameterValues("licenseIds");
        String[] productIds = req.getParameterValues("productIds");


        // Lấy licenseId từ việc mua 1 sản phẩm trực tiếp
        if (licenseIds == null) {
            String licenseId = req.getParameter("licenseId");
            licenseIds = new String[1];
            licenseIds[0] = licenseId;
        }

        int orderId = orderService.addOrderAndGetId(auth.getUid(), -1, promotionId, totalBeforeDiscount);

        ProductService productService = new ProductService();
        List<Product> products = new ArrayList<>();
        for (String ele : productIds) {
            products.add(productService.getById(Integer.parseInt(ele)));
        }

        HttpSession session = req.getSession();
        session.setAttribute("uid", auth.getUid());
        session.setAttribute("products", products);
        session.setAttribute("licenseIds", licenseIds);
        session.setAttribute("userEmail", auth.getEmail());
        session.setAttribute("orderId", orderId);
        session.setAttribute("totalBeforeDiscount", totalBeforeDiscount);

        for(int i = 0; i < products.size(); i++) {
            Product p = products.get(i);
            int licenseId = Integer.parseInt((licenseIds[i]));
            double price = licenseId == 2 ? p.getPrice() * 2 : p.getPrice();
            orderService.addOrderDetails(orderId, p.getId(), licenseId, price);
        }
        // Xử lý lưu và tạo đơn hàng khi thanh toán

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String orderType = "other";

        long amount = (long) (totalBeforeDiscount * 100);
        String vnp_TxnRef = orderId+"";
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");

        if (bankCode != null && !bankCode.isEmpty()) {
            vnp_Params.put("vnp_BankCode", bankCode);
        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);

        String locate = req.getParameter("language");
        if (locate != null && !locate.isEmpty()) {
            vnp_Params.put("vnp_Locale", locate);
        } else {
            vnp_Params.put("vnp_Locale", "vn");
        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        resp.sendRedirect(paymentUrl);
    }
}


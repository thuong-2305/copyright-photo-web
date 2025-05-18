 package vn.edu.hcmuaf.fit.coriphoto.controller.vnpay.common;

    import com.google.gson.Gson;
    import com.google.gson.JsonObject;
    import java.io.IOException;import java.net.URLEncoder;
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
    @WebServlet(name = "vnpayOrder", value = "/vnpayOrder")

    public class vnpayOrder extends HttpServlet {

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String orderType = "other";
            String bankCode = request.getParameter("bankCode");

            // lấy thông tin user
            HttpSession session = request.getSession();
            User currentUser = (User) session.getAttribute("loggedInUser");
            if (currentUser == null) {
                response.sendRedirect("/");
                return;
            }


            int uid = currentUser.getUid();

            // lấy thông tin của order
            OrderService orderService = new OrderService();
            int promotionId = Integer.parseInt(request.getParameter("promotionId"));
            int licenseId = Integer.parseInt(request.getParameter("licenseId"));
            long totalBeforeDiscount = Math.round(Double.parseDouble(request.getParameter("totalBeforeDiscount")) * 100);

            // Lấy thông tin sản phẩm
            String[] productIds = request.getParameterValues("productIds");
            String[] productPrices = request.getParameterValues("productPrices");
            ProductService productService = new ProductService();
            List<Product> products = new ArrayList<>();
            for (String ele : productIds) {
                products.add(productService.getById(Integer.parseInt(ele)));
            }


            if (licenseId == 2) {
                for (int i = 0; i < productPrices.length; i++) {
                    double price = Double.parseDouble(productPrices[i]);
                    productPrices[i] = String.valueOf(price * 2);
                }
            }

            // thanh toán VNPay không cần pmid
            int orderId = -1;
            boolean isOrderCreated = orderService.createOrder(uid, -1, promotionId, licenseId, totalBeforeDiscount, products);
            if (isOrderCreated) {
                orderId = orderService.getLastOrderId();
            }


            String vnp_TxnRef = orderId + "";
            String vnp_IpAddr = Config.getIpAddress(request);

            String vnp_TmnCode = Config.vnp_TmnCode;

            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(totalBeforeDiscount));
            vnp_Params.put("vnp_CurrCode", "VND");

            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            }
            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
            vnp_Params.put("vnp_OrderType", orderType);

            String locate = request.getParameter("language");
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

            com.google.gson.JsonObject job = new JsonObject();
            job.addProperty("code", "00");
            job.addProperty("message", "success");
            job.addProperty("data", paymentUrl);
            Gson gson = new Gson();
            response.getWriter().write(gson.toJson(job));

            response.sendRedirect(paymentUrl);

        }

    }

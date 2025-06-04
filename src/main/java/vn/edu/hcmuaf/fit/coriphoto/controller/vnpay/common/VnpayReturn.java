package vn.edu.hcmuaf.fit.coriphoto.controller.vnpay.common;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.datetime.FormatDateTime;
import vn.edu.hcmuaf.fit.coriphoto.model.ActivityLog;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;
import vn.edu.hcmuaf.fit.coriphoto.service.LogService;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author HP
 */

@WebServlet(name = "VnpayReturn", value = "/vnpayReturn")
public class VnpayReturn extends HttpServlet {
    private static final ExecutorService emailExecutor = Executors.newFixedThreadPool(5); // Giới hạn 5 thread

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements(); ) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
            if (signValue.equals(vnp_SecureHash)) {
                String paymentCode = request.getParameter("vnp_TransactionNo");
                String orderId = request.getParameter("vnp_TxnRef");

                OrderService orderService = new OrderService();

                int oid = Integer.parseInt(orderId);

                boolean transSuccess = false;
                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    //update banking system
                    orderService.updateOrderStatus(oid, "Completed");
                    transSuccess = true;
                    // Lấy thông tin từ session
                    HttpSession session = request.getSession();
                    User user = (User) session.getAttribute("auth");
                    int uid = (int) session.getAttribute("uid");
                    List<Product> products = (List<Product>) session.getAttribute("products");
                    String[] licenseIds = (String[]) session.getAttribute("licenseIds");
                    String userEmail = (String) session.getAttribute("userEmail");
                    double totalBeforeDiscount = (double) session.getAttribute("totalBeforeDiscount");

                    // Chuẩn bị dữ liệu để gửi email
                    List<String> imageNames = new ArrayList<>();
                    List<Integer> licenses = new ArrayList<>();
                    List<String> imagePaths = new ArrayList<>();

                    for (int i = 0; i < products.size(); i++) {
                        imageNames.add(products.get(i).getName()); // Lấy tên ảnh
                        String imageUrl = products.get(i).getUrl();
                        if (imageUrl.startsWith("../")) {
                            imageUrl = imageUrl.substring(3);
                        }
                        String absolutePath = request.getServletContext().getRealPath(imageUrl);
                        imagePaths.add(absolutePath);
                        licenses.add(Integer.parseInt(licenseIds[i])); // Chuyển licenseId thành int
                    }

                    // Gửi email với thông tin đơn hàng và file đính kèm
                    emailExecutor.submit(() -> {
                        try {
                            EmailUtils.sendEmailWithAttachments(userEmail, "Thông tin đơn hàng",
                                    "Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi!\n\n" +
                                            "===== THÔNG TIN ĐƠN HÀNG =====\n" +
                                            "- Số tiền thanh toán: " + totalBeforeDiscount + " VND\n" +
                                            "- Ngày mua hàng: " + FormatDateTime.format(LocalDate.now().toString()) + "\n\n" +
                                            "Vui lòng kiểm tra file license đính kèm để biết thêm chi tiết về sản phẩm của bạn.\n\n" +
                                            "Nếu có bất kỳ thắc mắc nào, đừng ngần ngại liên hệ với chúng tôi.\n\n" +
                                            "Hỗ trợ khách hàng: coriphototpk@gmail.com\n\n" +
                                            "Trân trọng,\n",
                                    imagePaths, imageNames, licenses);
                        } catch (Exception e) {
                            System.err.println("Failed to send email: " + e.getMessage());
                            e.printStackTrace();
                        }
                    });

                    CartService cartService = new CartService();

                    for (Product product : products) {
                        cartService.deleteItem(uid, Integer.parseInt(product.getId() + ""));
                    }

                    ActivityLog loginLog = new ActivityLog("INFO", user.getUid(),
                            user.getUsername(), LocalDateTime.now(),
                            user.getUsername() + " đã thanh toán thành công với đơn hàng có id là: " + orderId);
                    new LogService().insertLog(loginLog);

                    // Xóa session sau khi sử dụng xong
                    session.removeAttribute("products");
                    session.removeAttribute("licenseIds");
                    session.removeAttribute("userEmail");
                    session.removeAttribute("orderId");
                    session.removeAttribute("totalBeforeDiscount");
                } else {
                    orderService.updateOrderStatus(oid, "Failed");
                }
//                request.setAttribute("transResult", transSuccess);
//                request.getRequestDispatcher("payment-result.jsp").forward(request, response);
                if (transSuccess) response.sendRedirect("order-success.jsp");
                else response.sendRedirect("order-failed.jsp");
            } else {
                //RETURN PAGE ERROR
                System.out.println("GD KO HOP LE (invalid signature)");
            }
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

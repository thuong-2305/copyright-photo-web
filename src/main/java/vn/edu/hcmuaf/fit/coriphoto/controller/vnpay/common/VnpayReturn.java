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
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;
import vn.edu.hcmuaf.fit.coriphoto.service.OrderService;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author HP
 */

@WebServlet(name = "VnpayReturn", value = "/vnpayReturn")
public class VnpayReturn extends HttpServlet {
    private static final ExecutorService emailExecutor = Executors.newFixedThreadPool(5); // Giới hạn 5 thread
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
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
                System.out.println("Loading.........................");
                String orderId = request.getParameter("vnp_TxnRef");

                System.out.println("Test result: " + orderId);

                OrderService orderService = new OrderService();

                int oid = Integer.parseInt(orderId);

                boolean transSuccess = false;
                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    //update banking system
                    orderService.updateOrderStatus(oid, "Completed");
                    System.out.println("Success");
                    transSuccess = true;
                    // Lấy thông tin từ session
                    HttpSession session = request.getSession();
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
                            System.out.println("Email sent successfully to " + userEmail);
                        } catch (Exception e) {
                            System.err.println("Failed to send email: " + e.getMessage());
                            e.printStackTrace();
                        }
                    });

                    CartService cartService = new CartService();

                    for (Product product : products) {
                        cartService.deleteItem(uid, Integer.parseInt(product.getId() + ""));
                    }

                    // Xóa session sau khi sử dụng xong
                    session.removeAttribute("products");
                    session.removeAttribute("licenseIds");
                    session.removeAttribute("userEmail");
                    session.removeAttribute("orderId");
                    session.removeAttribute("totalBeforeDiscount");
                } else {
                    orderService.updateOrderStatus(oid, "Failed");
                    System.out.println("Failed");
                }
                request.setAttribute("transResult", transSuccess);
                request.getRequestDispatcher("payment-result.jsp").forward(request, response);
            } else {
                //RETURN PAGE ERROR
                System.out.println("GD KO HOP LE (invalid signature)");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

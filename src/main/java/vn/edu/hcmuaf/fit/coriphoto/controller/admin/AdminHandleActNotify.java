package vn.edu.hcmuaf.fit.coriphoto.controller.admin;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.service.EmailUtils;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminHandleActNotify", value = "/AdminHandleActNotify")
public class AdminHandleActNotify extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String act = (String) request.getParameter("act");
        int id = Integer.parseInt(request.getParameter("id"));
        int uid = Integer.parseInt(request.getParameter("uid"));

        ProductService productService = new ProductService();
        productService.updateStatus(act, id);
        List<Product> products = productService.getAllProductsWaiting();
        request.setAttribute("products", products);

        UserService userService = new UserService();
        Product product = productService.getById(id);
        String email = userService.getEmail(uid);
        String subject = "Phản hồi ảnh đã upload";
        String content = "Hình ảnh với id: " + id + ", có tên: " + product.getName()
                + (act.equals("accepted") ? " đã được chấp nhận." : " bị từ chối do không đạt tiêu chuẩn.");

        EmailUtils.sendEmail(email, subject, content);

        request.getRequestDispatcher("admin-notification.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
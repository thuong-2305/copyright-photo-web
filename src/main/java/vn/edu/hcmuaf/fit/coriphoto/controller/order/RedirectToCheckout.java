package vn.edu.hcmuaf.fit.coriphoto.controller.order;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.PaymentMethod;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.LicenseService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;
import vn.edu.hcmuaf.fit.coriphoto.service.PromotionService;
import vn.edu.hcmuaf.fit.coriphoto.service.UserService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "RedirectToCheckout", value = "/RedirectToCheckout")
public class RedirectToCheckout extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser == null) {
            response.sendRedirect("/");
            return;
        }
        UserService userService = new UserService();
        List<PaymentMethod> paymentMethods = userService.getAllPaymentMethods(currentUser.getUid());


        String productIdsParam = request.getParameter("productIds");
        String[] productIds = productIdsParam.split(",");


        LicenseService licenseService = new LicenseService();
        String license = request.getParameter("condition");
        System.out.println(license);
        int licenseId = licenseService.getIdLicenseByName(license);


        ProductService productService = new ProductService();
        List<Product> products = new ArrayList<>();

        double totalBeforeDiscount = 0;

        for (String ele : productIds) {
            Product p = productService.getById(Integer.parseInt(ele));
            double productPrice = p.getPrice();
            if (!"standard".equalsIgnoreCase(license)) productPrice *= 2;
            totalBeforeDiscount += productPrice;
            products.add(p);
        }


        PromotionService promotionService = new PromotionService();
        int totalProducts = products.size();
        double percentage = 0;
        int promotionId = 0;
        if (totalProducts < 5) {
            promotionId = 1;
            percentage = promotionService.getDiscountByPromotionID(promotionId);
        } else if (totalProducts < 10) {
            promotionId = 2;
            percentage = promotionService.getDiscountByPromotionID(promotionId);
        } else if (totalProducts < 25) {
            promotionId = 3;
            percentage = promotionService.getDiscountByPromotionID(promotionId);
        } else {
            promotionId = 4;
            percentage = promotionService.getDiscountByPromotionID(promotionId);

        }

        double discountAmount = totalBeforeDiscount * percentage;
        double totalAfterDiscount = totalBeforeDiscount - discountAmount;

        request.setAttribute("licenseId", licenseId);
        request.setAttribute("promotionId", promotionId);
        request.setAttribute("totalAfterDiscount", totalAfterDiscount);
        request.setAttribute("percentage", percentage);
        request.setAttribute("paymentMethods", paymentMethods);
        request.setAttribute("license", license);
        request.setAttribute("products", products);
        request.setAttribute("totalBeforeDiscount", totalBeforeDiscount);
        request.setAttribute("discountAmount", discountAmount);


        System.out.println("License ID: " + licenseId);
        System.out.println("Promotion ID: " + promotionId);
        System.out.println("Total Before Discount: " + totalBeforeDiscount);
        System.out.println("Total After Discount: " + totalAfterDiscount);
        System.out.println("Discount Amount: " + discountAmount);
        System.out.println("Percentage: " + percentage);
        System.out.println("License: " + license);
        System.out.println("Products: " + products);
        System.out.println("Payment Methods: " + paymentMethods);


//        response.sendRedirect("checkout.jsp");
        request.getRequestDispatcher("checkout.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }


}

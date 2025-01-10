package vn.edu.hcmuaf.fit.coriphoto.controller.seller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.SellerService;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ShowStatistic", value = "/ShowStatistic")
public class ShowStatistic extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("loggedInUser");
        if (currentUser != null) {
            request.setAttribute("user", currentUser);
        } else {
            response.sendRedirect("login.jsp");
            return;
        }

        int idSeller = currentUser.getUid();
        SellerService sellerService = new SellerService();
        int buyTotals = sellerService.getBuyTotalsById(idSeller);
        double totalIncome = sellerService.getTotalIncome(idSeller);
        double balance = sellerService.getBalance(idSeller);
        int totalImgSelled = sellerService.getTotalImgSelled(idSeller);
        String categoryParentName = request.getParameter("categoryParentName");
        System.out.println(categoryParentName);
        List<Map<String,Object>> productsStat;

        if (categoryParentName == null || categoryParentName.equals("all"))
            productsStat = sellerService.getProductStatsBySellerId(idSeller);
        else productsStat = sellerService.getProductStatsByCategory(idSeller, categoryParentName);


        request.setAttribute("buyTotals", buyTotals);
        request.setAttribute("totalIncome", totalIncome);
        request.setAttribute("balance", balance);
        request.setAttribute("productsStat", productsStat);
        request.setAttribute("totalImgSelled", totalImgSelled);


        request.getRequestDispatcher("homepage-seller.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

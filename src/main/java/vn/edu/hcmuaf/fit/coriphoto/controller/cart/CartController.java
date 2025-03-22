package vn.edu.hcmuaf.fit.coriphoto.controller.cart;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.coriphoto.model.Cart;
import vn.edu.hcmuaf.fit.coriphoto.model.CartDetail;
import vn.edu.hcmuaf.fit.coriphoto.model.Product;
import vn.edu.hcmuaf.fit.coriphoto.model.User;
import vn.edu.hcmuaf.fit.coriphoto.service.CartService;
import vn.edu.hcmuaf.fit.coriphoto.service.ProductService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CartService cartService = new CartService();
        ProductService productService = new ProductService();

        User user = (User) session.getAttribute("auth");

        int idTemp, uid;
        if(session.getAttribute("idCartNotLogin") != null) {
            idTemp = (Integer) session.getAttribute("idCartNotLogin");
            uid = (user != null ) ? user.getUid() : idTemp;
        } else {
            if(user == null) {
                request.setAttribute("cart", new Cart());
                request.setAttribute("cartItems", new ArrayList<CartDetail>());
                request.setAttribute("products", new ArrayList<Product>());
                request.setAttribute("total", 0);

//                request.getRequestDispatcher("cart.jsp").forward(request, response);

                request.getRequestDispatcher("new-cart.jsp").forward(request,response);
                return;
            } else uid = user.getUid();
        }

        Cart cart = cartService.getCart(uid);
        List<CartDetail> cartItems = cart.getCartItems();

        double total = cartService.getCartTotal(uid);

        List<Product> products = new ArrayList<>();
        for(CartDetail item : cartItems) {
            products.add(productService.getById(item.getPid()));
        }
        int numChecked = cartService.getNumChecked(cart.getCartId());

        String gift = "";
        double totalFinal = 0;

        if(numChecked < 5) {
            gift = "";
            totalFinal = 0;
        }
        else if(numChecked < 11) {
            gift = "Chúc mừng bạn đã nhận được ưu đãi gỉảm 10%";
            totalFinal = total - total * 0.1;
        }
        else if(numChecked < 21) {
            gift = "Chúc mừng bạn đã nhận được ưu đãi gỉảm 20%";
            totalFinal = total - total * 0.2;
        } else {
            gift = "Chúc mừng bạn đã nhận được ưu đãi gỉảm 30%";
            totalFinal = total - total * 0.3;
        }

        request.setAttribute("cart", cart);
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("products", products);
        request.setAttribute("total", total);
        request.setAttribute("numChecked", numChecked);
        request.setAttribute("gift", gift);
        request.setAttribute("totalFinal", totalFinal);

//        request.getRequestDispatcher("cart.jsp").forward(request, response);
        request.getRequestDispatcher("new-cart.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
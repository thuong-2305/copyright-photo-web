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
import vn.edu.hcmuaf.fit.coriphoto.service.ViewService;

import java.io.IOException;
import java.util.*;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        CartService cartService = new CartService();
        ProductService productService = new ProductService();

        User user = (User) session.getAttribute("auth");

        int idTemp, uid;
        if (session.getAttribute("idCartNotLogin") != null) {
            idTemp = (Integer) session.getAttribute("idCartNotLogin");
            uid = (user != null) ? user.getUid() : idTemp;
        } else {
            if (user == null) {
                ViewService viewService = new ViewService();
                List<Product> topViewedProducts = viewService.getTopViewedProducts(10);
                request.setAttribute("topViewedProducts", topViewedProducts);
                request.getRequestDispatcher("no-item-cart.jsp").forward(request, response);
                return;
            } else {
                uid = user.getUid();
            }
        }

        Cart cart = cartService.getCart(uid);
        List<CartDetail> cartItems = cart.getCartItems();

        int numbers = cartItems.size();

        // khi trong giỏ hàng không có sản phẩm nào
        if (numbers == 0) {
            ViewService viewService = new ViewService();
            List<Product> topViewedProducts = viewService.getTopViewedProducts(10);
            request.setAttribute("topViewedProducts", topViewedProducts);
            request.getRequestDispatcher("no-item-cart.jsp").forward(request, response);
            return;
        }

        double total = cartService.getCartTotal(uid);

        List<Product> products = new ArrayList<>();
        for (CartDetail item : cartItems) {
            products.add(productService.getById(item.getPid()));
        }
        int numChecked = cartService.getNumChecked(cart.getCartId());

        // Tính danh mục phổ biến nhất và thứ hai
        Map<Integer, Integer> categoryCount = new HashMap<>();
        for (Product product : products) {
            int categoryId = product.getCid();
            categoryCount.put(categoryId, categoryCount.getOrDefault(categoryId, 0) + 1);
        }

        // Sắp xếp danh mục theo số lượng sản phẩm (giảm dần)
        List<Map.Entry<Integer, Integer>> sortedCategories = new ArrayList<>(categoryCount.entrySet());
        sortedCategories.sort((a, b) -> b.getValue().compareTo(a.getValue()));

        // Lấy danh sách ID sản phẩm trong giỏ hàng để loại trừ
        Set<Integer> productIdsInCart = new HashSet<>();
        for (Product product : products) {
            productIdsInCart.add(product.getId());
        }

        // Lấy 10 sản phẩm gợi ý
        // Lấy 10 sản phẩm gợi ý
        List<Product> suggestedProducts = new ArrayList<>();
        int remainingProducts = 10; // Số sản phẩm cần lấy

        // Lấy từ danh mục phổ biến nhất
        if (!sortedCategories.isEmpty()) {
            int mostPopularCategoryId = sortedCategories.get(0).getKey();
            List<Product> productsFromMostPopular = productService.getProductsByCategoryNotIn(mostPopularCategoryId, productIdsInCart, remainingProducts);
            suggestedProducts.addAll(productsFromMostPopular);
            remainingProducts -= productsFromMostPopular.size();
        }

        // Nếu chưa đủ 10 sản phẩm, lấy từ danh mục phổ biến thứ hai (nếu có)
        if (remainingProducts > 0 && sortedCategories.size() > 1) {
            int secondMostPopularCategoryId = sortedCategories.get(1).getKey();
            List<Product> productsFromSecondPopular = productService.getProductsByCategoryNotIn(secondMostPopularCategoryId, productIdsInCart, remainingProducts);
            suggestedProducts.addAll(productsFromSecondPopular);
            remainingProducts -= productsFromSecondPopular.size();
        }

        // Nếu vẫn chưa đủ 10 sản phẩm, lấy từ danh mục ngẫu nhiên
        if (remainingProducts > 0) {
            List<Integer> excludeCategoryIds = new ArrayList<>();
            // Loại trừ danh mục phổ biến nhất và thứ hai (nếu có)
            if (!sortedCategories.isEmpty()) {
                excludeCategoryIds.add(sortedCategories.get(0).getKey());
            }
            if (sortedCategories.size() > 1) {
                excludeCategoryIds.add(sortedCategories.get(1).getKey());
            }
            List<Product> productsFromRandomCategory = productService.getProductsFromRandomCategoryNotIn(excludeCategoryIds, productIdsInCart, remainingProducts);
            suggestedProducts.addAll(productsFromRandomCategory);
        }

        String gift = "";
        double totalFinal = 0;

        if (numChecked < 5) {
            gift = "";
            totalFinal = 0;
        } else if (numChecked < 10) {
            gift = "Chúc mừng bạn đã nhận được ưu đãi giảm 10%";
            totalFinal = total - total * 0.1;
        } else if (numChecked < 25) {
            gift = "Chúc mừng bạn đã nhận được ưu đãi giảm 20%";
            totalFinal = total - total * 0.2;
        } else {
            gift = "Chúc mừng bạn đã nhận được ưu đãi giảm 30%";
            totalFinal = total - total * 0.3;
        }

        request.setAttribute("cart", cart);
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("products", products);
        request.setAttribute("total", total);
        request.setAttribute("numChecked", numChecked);
        request.setAttribute("gift", gift);
        request.setAttribute("totalFinal", totalFinal);
        request.setAttribute("suggestedProducts", suggestedProducts);

        request.getRequestDispatcher("new-cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý POST nếu cần
    }
}
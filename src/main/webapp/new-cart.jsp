<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.CartDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.LicenseService" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.UserService" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Shopping Cart</title>
  <!-- Bootstrap 4 CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Custom CSS -->
  <jsp:include page="include/head.jsp"/>

  <style>
    #nav:not(.scrolled) .title-logo { color: black; }
    #nav:not(.scrolled) .title-item { color: black !important; }
    #nav:not(.scrolled) .nav-item:hover { color: #009970; }
    #nav:not(.scrolled) .title-item:hover { color: #009970 !important; }
    #nav:not(.scrolled) .title-item:hover i { color: #009970 !important; }
    #nav:not(.scrolled) .nav-item:hover .title-item { color: #009970 !important; }
  </style>

  <link rel="stylesheet" href="./assets/css/new-cart.css">
</head>
<body>
<jsp:include page="include/navbar.jsp"/>

<div id="cart">
  <div class="container my-5 py-5">
    <div class="row">
      <!-- Cart Items -->
      <div class="col-md-8">
        <div class="cart-items">
          <%
            List<CartDetail> items = (List<CartDetail>) request.getAttribute("cartItems");
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (items != null && products != null) {
              for (int i = items.size() - 1; i >= 0; i--) {
                CartDetail item = items.get(i);
                Product product = products.get(i);
          %>
          <div class="cart-item">
            <input type="checkbox" class="selectBuy"
                   data-cart-id="<%= item.getCartId() %>"
                   data-product-id="<%= product.getId() %>"
                   data-license-id="<%= item.getLicenseId() %>"
              <% if (item.getChecked() == 1) { %> checked <% } %>>
            <a href="/product-detail?pid=<%= product.getId() %>">
              <img src="<%= product.getUrl() %>" alt="<%= product.getId() %>">
            </a>
            <div class="cart-item-details">
              <p><%= new CategoryService().getById(product.getCid()).getName() %> | <%= product.getName() %></p>
              <small>Giấy phép: <%= new LicenseService().getLicenseName(item.getLicenseId()) %></small>
            </div>
            <div class="price-section">
              <p><fmt:formatNumber value="<%= item.getPrice() %>" pattern="#,### đ" /></p>
              <button class="remove-btn" data-product-id="<%= product.getId() %>">×</button>
            </div>
          </div>
          <%
              }
            }
          %>
        </div>
      </div>

      <!-- Order Summary -->
      <div class="col-md-4">
        <div class="delivery-info">
          <p class="mb-0">
            <i class="bi bi-tag-fill text-success mr-1"></i> <!-- Icon tag xanh -->
            ${gift}
            <i class="bi bi-gift-fill text-danger ml-1"></i> <!-- Icon gift đỏ -->
          </p>
        </div>
        <div class="order-summary">
          <h5>Tóm tắt đơn hàng</h5>
          <div class="row">
            <div class="col-8">Tạm tính (<span id="numChecked">${numChecked}</span> sản phẩm):</div>
            <div class="col-4 text-right" id="subtotal"><fmt:formatNumber value="${total}" pattern="#,### đ" /></div>
          </div>
          <div class="row">
            <div class="col-8">Tiết kiệm:</div>
            <div class="col-4 text-right" id="saving">
              <c:if test="${totalFinal > 0 && total > totalFinal}">
                <fmt:formatNumber value="${total - totalFinal}" pattern="-#,### đ" />
              </c:if>
            </div>
          </div>
          <hr>
          <div class="row">
            <div class="col-8">Tổng cộng:</div>
            <div class="col-4 text-right" id="totalFinal">
              <c:choose>
                <c:when test="${totalFinal > 0}">
                  <fmt:formatNumber value="${totalFinal}" pattern="#,### đ" />
                </c:when>
                <c:otherwise>
                  <fmt:formatNumber value="${total}" pattern="#,### đ" />
                </c:otherwise>
              </c:choose>
            </div>
          </div>
          <!-- Hidden fields -->
          <input type="hidden" id="hiddenNumChecked" name="numChecked" value="${numChecked}">
          <input type="hidden" id="hiddenTotal" name="total" value="${total}">
          <input type="hidden" id="hiddenGift" name="gift" value="${gift}">
          <input type="hidden" id="hiddenTotalFinal" name="totalFinal" value="${totalFinal}">
          <button class="btn btn-checkout" id="checkoutButton">Tiếp tục thanh toán →</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Notification -->
<div class="alert alert-success align-items-center position-fixed" role="alert" style="display: none;">
  <i class="bi bi-check2-circle"></i><span></span>
</div>

<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/scripts.jsp"/>

<!-- Bootstrap 4 JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- Numeral.js -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!-- Custom JS -->
<script src="./assets/js/new-cart.js"></script>
</body>
</html>
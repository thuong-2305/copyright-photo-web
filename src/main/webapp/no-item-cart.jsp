<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Giỏ Hàng Trống</title>
  <!-- Bootstrap 4 CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <!-- Bootstrap Icons -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <link rel="stylesheet" href="">
  <!-- Custom CSS -->
  <jsp:include page="include/head.jsp"/>

  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f8f9fa;
    }

    #nav:not(.scrolled) .title-logo {
      color: black;
    }

    #nav:not(.scrolled) .title-item {
      color: black !important;
    }

    #nav:not(.scrolled) .nav-item:hover {
      color: #009970;
    }

    #nav:not(.scrolled) .title-item:hover {
      color: #009970 !important;
    }

    #nav:not(.scrolled) .title-item:hover i {
      color: #009970 !important;
    }

    #nav:not(.scrolled) .nav-item:hover .title-item {
      color: #009970 !important;
    }
  </style>
  <link rel="stylesheet" href="./assets/css/no-item-cart.css">

</head>
<body>
<!-- Navbar -->
<jsp:include page="include/navbar.jsp"/>

<!-- Empty Cart Section -->
<div class="empty-cart-container my-5 pt-5">
  <div class="empty-cart-content">
    <i class="bi bi-cart-x"></i>
    <h2>Giỏ hàng của bạn đang trống</h2>
    <p>Hãy khám phá thêm các sản phẩm tuyệt vời và thêm chúng vào giỏ hàng của bạn!</p>
    <a href="/" class="btn btn-home">Quay về trang chủ</a>
  </div>
</div>

<!-- Top Viewed Products -->
<% List<Product> topViewedProducts = (List<Product>) request.getAttribute("topViewedProducts"); %>
<% if (topViewedProducts != null && !topViewedProducts.isEmpty()) { %>
<div class="categories-container">
  <div class="container-title">
    <p>Sản phẩm nổi bật</p>
    <p><a href="products?cid=<%= topViewedProducts.getFirst().getCid() %>">Xem tất cả</a></p>
  </div>
  <div class="categories-image">
    <%
      for (int i = 0; i < 5; i++) {
        Product item = topViewedProducts.get(i);
    %>
    <a href="product-detail?pid=<%= item.getId() %>">
      <div class="image">
        <img src="<%= item.getUrl() %>" alt=""/>
        <div class="btn-in-image">
          <button class="favorite-btn" data-product-id="<%= item.getId() %>">
            <i class="fa-regular fa-heart"></i>
          </button>
          <button class="addCart" data-product-id="<%= item.getId() %>">
            <i class="fa-solid fa-cart-plus"></i>
          </button>
        </div>
      </div>
    </a>
    <% } %>
  </div>
  <div class="categories-image">
    <%
      for (int i = 5; i < 10; i++) {
        Product item = topViewedProducts.get(i);
    %>
    <a href="product-detail?pid=<%= item.getId() %>">
      <div class="image">
        <img src="<%= item.getUrl() %>" alt=""/>
        <div class="btn-in-image">
          <button class="favorite-btn" data-product-id="<%= item.getId() %>">
            <i class="fa-regular fa-heart"></i>
          </button>
          <button class="addCart" data-product-id="<%= item.getId() %>">
            <i class="fa-solid fa-cart-plus"></i>
          </button>
        </div>
      </div>
    </a>
    <% } %>
  </div>
</div>
<% } %>

<!-- Notification -->
<div class="alert alert-success align-items-center position-fixed" role="alert" style="display: none;">
  <i class="bi bi-check2-circle"></i><span></span>
</div>



<!-- Footer -->
<jsp:include page="include/footer.jsp"/>

<!-- Scripts -->
<jsp:include page="include/scripts.jsp"/>
<script src="./assets/js/suggest-products.js"></script>



<!-- Bootstrap 4 JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
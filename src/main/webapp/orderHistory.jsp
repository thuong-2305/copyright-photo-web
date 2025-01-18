<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 1/15/2025
  Time: 8:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="../assets/css/navbar-footer.css">
  <link rel="stylesheet" href="../assets/css/history-order.css">
  <link rel="stylesheet" href="../assets/css/like.css">
  <link rel="stylesheet" href="../assets/css/search.css">
  <link rel="stylesheet" href="../assets/css/homeuser.css">
  <link rel="stylesheet" href="../assets/libraries/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css">
  <title>CoRiPhoto</title>
</head>

<body>

<!--section history -->
<section class="history container">
  <div class="title mt-5">
    <h3>Lịch sử các đơn hàng</h3>
  </div>
  <div class="history-line d-flex flex-wrap">
    <div class="order-card">
      <div class="order-header">
        <div class="order-info">
          <span class="order-id fs-5">Đơn hàng #2472</span>
          <span class="order-status paid">Đã giao thành công</span>
        </div>
        <div class="order-price">
          Tổng tiền: 120.000 vnđ
        </div>
      </div>
      <div class="order-details">
        <hr>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-calendar"></i> Thời gian:</span>
          <span class="order-date">16 Tháng 11, 2022 lúc 12:05 PM</span>
        </div>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-credit-card"></i> Phương thức thanh toán:</span>
          <span class="order-date">Chuyển khoản thẻ ngân hàng</span>
        </div>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-envelope"></i> Email nhận hàng:</span>
          <span class="order-date">test123@gmail.com</span>
        </div>
        <hr>
        <div class="product-item">
          <img src="../assets/images/ai/Food/005.jpg" class="product-img" />
          <div class="product-info">
            <span class="product-name">Bánh sanwith dưới màn đen</span>
            <span>Người đăng ảnh: Nguyễn Thanh Thương, </span>
            <span class="product-sku">Giấy phép tiêu chuẩn,</span>
            <span class="product-quantity fw-semibold">Giá: 120.000đ</span>
            <a href="product_details.html" class="text-success px-2">Xem ảnh</a>
          </div>
        </div>
      </div>
    </div>

    <div class="order-card">
      <div class="order-header">
        <div class="order-info">
          <span class="order-id fs-5">Đơn hàng #2325</span>
          <span class="order-status paid">Đã giao thành công</span>
        </div>
        <div class="order-price">
          Tổng tiền: 1.080.000 vnđ
        </div>
      </div>
      <div class="order-details">
        <hr>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-calendar"></i> Thời gian:</span>
          <span class="order-date">16 Tháng 11, 2022 lúc 12:05 PM</span>
        </div>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-credit-card"></i> Phương thức thanh toán:</span>
          <span class="order-date">Chuyển khoản thẻ ngân hàng</span>
        </div>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-envelope"></i> Email nhận hàng:</span>
          <span class="order-date">test123@gmail.com</span>
        </div>
        <hr>
        <div class="text-with-line"><i class="fa-solid fa-layer-group me-2 text-danger"></i>Được ưu đãi giảm giá 10% </div>
        <div class="more-items">
          <div class="product-item">
            <img src="../assets/images/ai/Food/005.jpg" class="product-img" />
            <div class="product-info">
              <span class="product-name">Bánh sanwith dưới màn đen</span>
              <span>Người đăng ảnh: Nguyễn Thanh Thương, </span>
              <span class="product-sku">Giấy phép tiêu chuẩn,</span>
              <span class="product-quantity fw-semibold">Giá: 120.000đ</span>
              <a href="product_details.html" class="text-success px-2">Xem ảnh</a>
            </div>
          </div>
          <div class="product-item">
            <img src="../assets/images/ai/Food/002.jpg" class="product-img" />
            <div class="product-info">
              <span class="product-name">Bánh sanwith dưới màn đen</span>
              <span>Người đăng ảnh: Nguyễn Thanh Thương, </span>
              <span class="product-sku">Giấy phép tiêu chuẩn,</span>
              <span class="product-quantity fw-semibold">Giá: 120.000đ</span>
              <a href="product_details.html" class="text-success px-2">Xem ảnh</a>
            </div>
          </div>
          <div class="product-item">
            <img src="../assets/images/ai/Food/001.jpg" class="product-img" />
            <div class="product-info">
              <span class="product-name">Bánh sanwith dưới màn đen</span>
              <span>Người đăng ảnh: Nguyễn Thanh Thương, </span>
              <span class="product-sku">Giấy phép tiêu chuẩn,</span>
              <span class="product-quantity fw-semibold">Giá: 120.000đ</span>
              <a href="product_details.html" class="text-success px-2">Xem ảnh</a>
            </div>
          </div>
          <div class="product-item">
            <img src="../assets/images/ai/Food/002.jpg" class="product-img" />
            <div class="product-info">
              <span class="product-name">Bánh sanwith dưới màn đen</span>
              <span>Người đăng ảnh: Nguyễn Thanh Thương, </span>
              <span class="product-sku">Giấy phép tiêu chuẩn,</span>
              <span class="product-quantity fw-semibold">Giá: 120.000đ</span>
              <a href="product_details.html" class="text-success px-2">Xem ảnh</a>
            </div>
          </div>
          <div class="product-item">
            <img src="../assets/images/ai/Food/001.jpg" class="product-img" />
            <div class="product-info">
              <span class="product-name">Bánh sanwith dưới màn đen</span>
              <span>Người đăng ảnh: Nguyễn Thanh Thương, </span>
              <span class="product-sku">Giấy phép tiêu chuẩn,</span>
              <span class="product-quantity fw-semibold">Giá: 120.000đ</span>
              <a href="product_details.html" class="text-success px-2">Xem ảnh</a>
            </div>
          </div>
          <div class="details-header">
            <span class="shipping-info"></span>
            <span class="order-date"> <span class="fw-semibold">Tổng cộng:</span> <strike class="text-secondary">1.200.000 vnđ</strike> 1.080.000 vnđ</span>
          </div>
        </div>
      </div>
    </div>

    <div class="order-card">
      <div class="order-header">
        <div class="order-info">
          <span class="order-id fs-5">Đơn hàng #2111</span>
          <span class="order-status paid">Đã giao thành công</span>
        </div>
        <div class="order-price">
          Tổng tiền: 120.000 vnđ
        </div>
      </div>
      <div class="order-details">
        <hr>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-calendar"></i> Thời gian:</span>
          <span class="order-date">16 Tháng 11, 2022 lúc 12:05 PM</span>
        </div>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-credit-card"></i> Phương thức thanh toán:</span>
          <span class="order-date">Chuyển khoản thẻ ngân hàng</span>
        </div>
        <div class="details-header">
          <span class="shipping-info"><i class="fa-regular fa-envelope"></i> Email nhận hàng:</span>
          <span class="order-date">test123@gmail.com</span>
        </div>
        <hr>
        <div class="product-item">
          <img src="../assets/images/ai/Food/005.jpg" class="product-img" />
          <div class="product-info">
            <span class="product-name">Bánh sanwith dưới màn đen</span>
            <span>Người đăng ảnh: Nguyễn Thanh Thương, </span>
            <span class="product-sku">Giấy phép tiêu chuẩn,</span>
            <span class="product-quantity fw-semibold">Giá: 120.000đ</span>
            <a href="product_details.html" class="text-success px-2">Xem ảnh</a>
          </div>
        </div>
      </div>
    </div>

  </div>
</section>
<!--section favourate -->

<jsp:include page="include/footer.jsp"/>

<script src="../assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/homepage.js"></script>
<script src="../assets/js/navbar.js"></script>
<script src="../assets/js/homeuser.js"></script>
</body>

</html>
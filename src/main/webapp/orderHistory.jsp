<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="assets/css/navbar-footer.css">
  <link rel="stylesheet" href="assets/css/history-order.css">
  <link rel="stylesheet" href="assets/css/like.css">
  <link rel="stylesheet" href="assets/css/search.css">
  <link rel="stylesheet" href="assets/css/homeuser.css">
  <link rel="stylesheet" href="assets/libraries/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css">
  <title>CoRiPhoto</title>
  <style>
    #nav {
      position: fixed !important;
      background: white;
      margin-bottom: 20px;
    }

    .modal {
      z-index: 9999;
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

    #nav:not(.scrolled) .container .login-button {
      background-color: transparent;
      color: black;
      padding: 7px 19px;
      border: 1px solid black;
    }

    .image-text {
      position: relative;
      margin: 10px;
    }

    .image-text img {
      max-width: 100px;
      max-height: 100px;
      border-radius: 8px;
    }

    .delete-img {
      position: absolute;
      top: 5px;
      right: 5px;
      background: rgba(255, 255, 255, 0.7);
      border-radius: 50%;
      padding: 5px;
      cursor: pointer;
    }
  </style>
</head>

<body>
<jsp:include page="include/navbar.jsp"/>


<!--section history -->
<section class="history container">
  <div class="title mt-5">
    <h3>Lịch sử mua hàng</h3>
  </div>
  <div class="history-line d-flex flex-wrap">
    <c:forEach var="order" items="${orders}">
      <div class="order-card">
        <div class="order-header">
          <div class="order-info">
            <span class="order-id fs-5">Đơn hàng #${order.orderId}</span>
            <span class="order-status paid">Đã giao thành công</span>
          </div>
          <div class="order-price">
            <span>Tổng tiền: </span>
            <c:choose>
              <c:when test="${priceMap[order.orderId] == order.totalPrice}">
                <!-- Nếu không có giảm giá, chỉ hiển thị số tiền -->
                <span>
                <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0 VNĐ"/>
            </span>
              </c:when>
              <c:otherwise>
                <!-- Nếu có giảm giá, hiển thị giá gốc và giá sau giảm -->
                <span class="fw-semibold me-2 text-decoration-line-through small">
                <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0"/>
            </span>
                <span>
                <fmt:formatNumber value="${priceMap[order.orderId]}" pattern="#,##0 VNĐ"/>
            </span>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
        <div class="order-details">
          <hr>
          <div class="details-header">
            <span class="shipping-info"><i class="fa-regular fa-calendar"></i> Thời gian:</span>
            <span class="order-date">${order.orderDate}
            </span>
          </div>
          <div class="details-header">
            <span class="shipping-info"><i class="fa-regular fa-credit-card"></i> Phương thức thanh toán:</span>
            <span class="order-date text-uppercase">${paymentTypes[order.paymentMethodId]}</span>
          </div>
          <div class="details-header">
            <span class="shipping-info"><i class="fa-regular fa-envelope"></i> Email nhận hàng:</span>
            <span class="order-date">${userEmails[order.uid]}</span>
          </div>
          <hr>

          <c:forEach var="detail" items="${orderDetailsMap[order.orderId]}">
            <c:set var="product" value="${productMap[detail.productId]}" />
            <div class="product-item">
              <img src="${product.url}" class="product-img" />
              <div class="product-info">
                <span class="product-name">${product.name}</span>
                <span class="product-sku">
                <c:choose>
                  <c:when test="${detail.licenseId == 1}">Giấy phép tiêu chuẩn</c:when>
                  <c:when test="${detail.licenseId == 2}">Giấy phép nâng cao</c:when>
                </c:choose>
              </span>
                <span class="product-quantity fw-semibold">
                  Giá: <fmt:formatNumber value="${detail.price}" pattern="#,##0 VNĐ"/>
                </span>
                <a href="product-detail?pid=${product.id}" class="text-success px-2">Xem ảnh</a>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </c:forEach>
  </div>
</section>
<!--section favourate -->

<jsp:include page="include/footer.jsp"/>

<script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/homepage.js"></script>
<script src="assets/js/navbar.js"></script>
<script src="assets/js/homeuser.js"></script>
</body>

</html>
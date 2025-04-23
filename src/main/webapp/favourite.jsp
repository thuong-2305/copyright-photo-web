<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="assets/css/navbar-footer.css">
  <link rel="stylesheet" href="assets/css/favourite.css">
  <link rel="stylesheet" href="assets/css/search.css">
  <link rel="stylesheet" href="assets/css/homeuser.css">
  <link rel="stylesheet" href="assets/libraries/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css">
  <script src="assets/libraries/jquery/jquery-3.7.1.min.js"></script>
  <title>CoRiPhoto</title>
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<section class="likes container">
  <div class="title">
    <h3>Hình ảnh yêu thích&#40;<span>3</span>&#41;</h3>
  </div>
  <div class="img-like">
    <div class="toolbar">
      <button class="tool-btn" title="Giỏ hàng">
        <i class="fas fa-shopping-cart"></i>
      </button>
      <button class="tool-btn" title="Chọn nhiều">
        <i class="far fa-copy"></i>
      </button>
      <button class="tool-btn" title="Xóa">
        <i class="fas fa-trash"></i>
      </button>
      <button class="clear-btn"><i class="fas fa-clear"></i> Bỏ lựa chọn</button>
    </div>

    <div class="image-gallery">
      <!-- Sử dụng JSTL để lặp qua danh sách sản phẩm yêu thích -->
      <c:forEach var="product" items="${favoriteProducts}">
        <div class="image-card" data-product-id="${product.id}">
          <div class="image-container">
            <!-- Hiển thị hình ảnh -->
            <img src="${product.url}" alt="${product.name}">
            <!-- Nút xóa yêu thích -->
            <button class="remove-btn" onclick="toggleFavorite(${product.id})">&times;</button>
          </div>
          <div class="image-info">
            <!-- Hiển thị thông tin sản phẩm -->
            <div class="image-id">
              <span class="badge">RF</span>
              <span>Image ID: ${product.id}</span>
            </div>
            <h3 class="image-title">${product.name}</h3>
            <p class="image-credit">Credit: ${product.description}</p>
            <div class="image-actions">
              <button class="select-btn"><i class="fas fa-check"></i></button>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</section>
<%-- notification --%>
<div class="alert alert-primary d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0%"
>
  <i class="bi bi-exclamation-triangle"></i><span></span>
</div>
<div class="alert alert-success d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0%"
>
  <i class="bi bi-check2-circle"></i><span></span>
</div>
<%-- notification --%>
<jsp:include page="include/footer.jsp"/>

<script src="assets/js/favourite.js"></script>
<script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/homepage.js"></script>
<script src="assets/js/navbar.js"></script>
<script src="assets/js/homeuser.js"></script>
</body>

</html>

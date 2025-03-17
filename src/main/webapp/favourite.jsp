<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 03/03/2025
  Time: 12:51 SA
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="assets/css/navbar-footer.css">
  <link rel="stylesheet" href="assets/css/favourite.css?11">
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
    <!-- fn:length() trả về độ dài của list. -->
    <h3 class="favorite-title">Hình ảnh yêu thích (<span class="counter"><c:out value="${fn:length(favoriteProducts)}"/></span>)</h3>
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
      <div class="toolbar-divider"></div>
      <button class="clear-btn"><i class="fas fa-times-circle"></i> Bỏ lựa chọn</button>
    </div>

    <div class="image-gallery">
      <!-- Sử dụng JSTL để lặp qua danh sách sản phẩm yêu thích -->
      <c:forEach var="product" items="${favoriteProducts}">
        <div class="image-card" data-product-id="${product.id}">
          <div class="image-container">
            <!-- Hiển thị hình ảnh -->
            <img src="${product.url}" alt="${product.name}">
            <!-- Overlay effect -->
            <div class="image-overlay">
              <button class="action-btn preview-btn" title="Xem trước" onclick="window.open('product-detail?pid=${product.id}', '_blank')">
                <i class="fas fa-eye"></i>
              </button>
              <button class="action-btn cart-btn addCart" data-product-id="${product.id}" title="Thêm vào giỏ hàng">
                <i class="fas fa-cart-plus"></i>
              </button>
            </div>
            <!-- Nút xóa yêu thích -->
            <button class="remove-btn" onclick="toggleFavorite(${product.id})">
              <i class="fas fa-heart-broken"></i>
            </button>
          </div>
          <div class="image-info">
            <!-- Hiển thị thông tin sản phẩm -->
            <div class="image-id">
              <span class="badge">RF</span>
              <span class="id-text">ID: ${product.id}</span>
            </div>
            <h3 class="image-title">${product.name}</h3>
            <p class="image-credit">Credit: ${product.description}</p>
            <div class="image-actions">
              <div class="price-tag">${product.price}₫</div>
              <button class="select-btn" title="Chọn hình ảnh">
                <i class="fas fa-check"></i>
              </button>
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
<script>
  $(document).ready(function () {
    $(".addCart, .addCart2").click(function (event) {
      let productId = $(this).data("product-id");
      let isAddCart2 = $(this).hasClass("addCart2");
      // let selectedCondition = isAddCart2 ? $('input[name="condition"]:checked').val() : 1;
      let selectedCondition = isAddCart2
              ? ($('input[name="condition"]:checked').val() === 'advance' ? 2 : 1)
              : 1;
      event.preventDefault();
      $.ajax({
        url: "addToCart?pid=" + productId,
        method: "POST",
        contentType: "application/json",
        data: JSON.stringify({
          "licenseId": selectedCondition
        }),
        success: function (response) {
          if (response.addSuccess) {
            $(".alert-success span").text("Thêm thành công!");
            $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
              $(this).addClass("d-none");
            });
            $("#nav .container a.cart span").text(response.cartLen);
          } else {
            $(".alert-primary span").text("Sản phẩm đã có trong giỏ hàng!");
            $(".alert-primary").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
              $(this).addClass("d-none");
            });
          }
        },
        error: function () {
          alert("Có lỗi xảy ra, vui lòng thử lại sau.");
        }
      });
    });
  });
</script>
<script>
  // Hàm xử lý yêu thích
  function toggleFavorite(productId) {
    if (confirm("Bạn có chắc muốn xóa sản phẩm này khỏi danh sách yêu thích?")) {
      // Gửi yêu cầu AJAX để xóa sản phẩm
      fetch(`RemoveFavourite?action=remove&productId=`+productId, {
        method: 'POST'
      })
              .then(response => response.json())
              .then(data => {
                if (data.success) {
                  alert(data.message);
                  document.querySelector('.counter').textContent = document.querySelectorAll('.image-card').length;
                  location.reload(); // Tải lại trang sau khi xóa thành công
                } else {
                  alert("Có lỗi xảy ra: " + data.message);
                }
              })
              .catch(error => {
                alert(productId);
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi xóa sản phẩm.");
              });
    }
  }
</script>
</body>

</html>

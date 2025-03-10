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
      <button class="tool-btn" title="In">
        <i class="fas fa-print"></i>
      </button>
      <button class="tool-btn" title="Xóa">
        <i class="fas fa-trash"></i>
      </button>
      <button class="clear-btn">Bỏ lựa chọn</button>
    </div>

    <div class="image-gallery">
      <!-- Sử dụng JSTL để lặp qua danh sách sản phẩm yêu thích -->
      <c:forEach var="product" items="${favoriteProducts}">
        <div class="image-card">
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

<jsp:include page="include/footer.jsp"/>

<script src="assets/js/favourite.js"></script>
<script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/homepage.js"></script>
<script src="assets/js/navbar.js"></script>
<script src="assets/js/homeuser.js"></script>
<script>
  // Hàm xử lý yêu thích
  function toggleFavorite(productId) {
    if (confirm("Bạn có chắc muốn xóa sản phẩm này khỏi danh sách yêu thích?")) {
      // Gửi yêu cầu AJAX để xóa sản phẩm khỏi danh sách yêu thích
      fetch(`FavoriteServlet?action=remove&productId=${productId}`, {
        method: 'POST'
      }).then(response => response.json())
              .then(data => {
                if (data.success) {
                  alert(data.message);
                  location.reload(); // Tải lại trang sau khi xóa thành công
                } else {
                  alert("Có lỗi xảy ra: " + data.message);
                }
              }).catch(error => {
        console.error("Error:", error);
        alert("Có lỗi xảy ra khi xóa sản phẩm.");
      });
    }
  }
</script>
</body>

</html>

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
      <!-- Hình ảnh 1 -->
      <div class="image-card selected">
        <div class="image-container">
          <img
                  src="./assets/images/Animal/1.jpg"
                  alt="Apple in Pie Crust wrapped in leaves"
          />
          <button class="remove-btn">&times;</button>
        </div>
        <div class="image-info">
          <div class="image-id">
            <span class="badge">RF</span>
            <span>Image ID: 2M709YH</span>
          </div>
          <h3 class="image-title">Apple in Pie Crust wrapped in leaves</h3>
          <p class="image-credit">
            Credit: The Picture Pantry / Alamy Stock Photo
          </p>
          <div class="image-actions">

            <button class="select-btn selected">
              <i class="fas fa-check"></i>
            </button>
          </div>
        </div>
      </div>

      <!-- Hình ảnh 2 -->
      <div class="image-card">
        <div class="image-container">
          <img
                  src="./assets/images/Animal/2.jpg"
                  alt="Man in dark green winter sweater eating soup"
          />
        </div>
        <div class="image-info">
          <div class="image-id">
            <span class="badge">RF</span>
            <span>Image ID: PWPMJ1</span>
          </div>
          <h3 class="image-title">
            Man in dark green winter sweater eating soup
          </h3>
          <p class="image-credit">
            Credit: The Picture Pantry / Alamy Stock Photo
          </p>
          <div class="image-actions">

            <button class="select-btn"><i class="fas fa-check"></i></button>
          </div>
        </div>
      </div>

      <!-- Hình ảnh 3 -->
      <div class="image-card">
        <div class="image-container">
          <img
                  src="./assets/images/Animal/3.jpg"
                  alt="Autumn Thanksgiving, Friendsgiving, feast table"
          />
        </div>
        <div class="image-info">
          <div class="image-id">
            <span class="badge">RF</span>
            <span>Image ID: 2DW7ACE</span>
          </div>
          <h3 class="image-title">
            Autumn Thanksgiving, Friendsgiving, feast table
          </h3>
          <p class="image-credit">
            Credit: The Picture Pantry / Alamy Stock Photo
          </p>
          <div class="image-actions">

            <button class="select-btn"><i class="fas fa-check"></i></button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<jsp:include page="include/footer.jsp"/>

<script src="assets/js/favourite.js"></script>
<script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/homepage.js"></script>
<script src="assets/js/navbar.js"></script>
<script src="assets/js/homeuser.js"></script>
</body>

</html>

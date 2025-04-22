<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/6/2025
  Time: 12:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="./assets/css/type-images.css">
  <jsp:include page="include/head.jsp" />
  <title>CoRiPhoto</title>
  <style>
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
</head>

<body>
<!--section navbar -->
<jsp:include page="include/navbar.jsp"/>
<!--section navbar -->

<!--section banner -->
<section class="banner">
  <div class="banner-home d-flex justify-content-center align-items-center flex-column">
    <div class="main-title d-flex justify-content-center flex-column align-items-center">
      <h1 class="fw-bold m-2">ẢNH AI</h1>
      <p>Khá phá nhiều hơn về tập ảnh ai của chúng tôi.</p>
    </div>
    <div class="search-container">
      <div class="dropdown">
        <button class="fw-medium" id="type-search"><i class="fa-solid fa-image px-2"></i><span>Tất cả
                            ảnh</span><i class="fa-solid fa-caret-down px-2"></i></button>
        <div class="dropdown-content">
          <a href="#" class="active" data-icon="fa-image"><i class="fa-solid fa-image pe-3"></i>Tất cả
            ảnh</a>
          <a href="#" data-icon="fa-camera"><i class="fa-solid fa-camera px-3"></i>Ảnh chụp</a>
          <a href="#" data-icon="fa-vector-square"><i
                  class="fa-solid fa-vector-square px-3"></i>Vectors</a>
          <a href="#" data-icon="fa-pen-fancy"><i class="fa-solid fa-pen-fancy px-3"></i>AI</a>
        </div>
      </div>
      <div class="search-bar">
        <input type="text" id="search-input" placeholder="Tìm kiếm tất cả ảnh">
        <span class="clear-btn">&#10005;</span>
      </div>
      <button class="search-button"><i class="fa-solid fa-magnifying-glass"></i><span class="ps-2 fw-bold">Tìm
                        kiếm</span></button>
    </div>
  </div>
</section>
<!--section banner -->


<!-- section category detail -->
<section id="tranding">
  <div class="pane-top text-center my-3">
    <h1 class="fw-bold">Khám phá tài nguyên theo phong cách</h1>
    <p class="fs-3 mb-5">Khám phá các phong cách <span class="text-success fw-semibold">hình ảnh AI</span> khác nhau
      để thể hiện những ý tưởng mạnh mẽ của bạn và kết nối với khán giả</p>
  </div>
  <div class="tranding-container">
    <div class="swiper tranding-slider">
      <div class="swiper-wrapper">
        <jsp:useBean id="slides" scope="request" type="java.util.List"/>
        <c:forEach var="slide" items="${slides}">
          <!-- Slide-start -->
          <div class="swiper-slide tranding-slide">
            <a href="product-detail?pid=${ slide.id }">
            <div class="tranding-slide-img">
              <img src="${slide.url}" alt="Trending">
            </div>
            <div class="tranding-slide-content">
              <div class="tranding-slide-content-bottom">
                <h5 class="style text-success fw-semibold mt-1">
                  <i class="fa-solid fa-tags me-2"></i>${slide.name}
                </h5>
              </div>
            </div>
            </a>
          </div>
          <!-- Slide-end -->
        </c:forEach>
      </div>
    </div>
  </div>
</section>
<!-- section category detail -->

<hr>
<!-- section category trend -->
<section class="trend-type">
  <div class="trending-section">
    <h1 class="title mb-2 fs-1">Xu hướng tháng này</h1>
    <p class="subtitle fs-5">Khám phá các vectơ hoàn hảo cho các dự án và chiến dịch trong mùa này.</p>
    <div class="trending-items">
      <div class="item">
        <div class="image-layout">
          <div class="column left">
            <img src="../assets/images/ai/Plant/03.png">
            <img src="../assets/images/ai/Plant/05.png">
          </div>
          <div class="column right">
            <img src="../assets/images/ai/Plant/18.png">
          </div>
        </div>
        <p class="item-title">Hoa thực vật</p>
      </div>
      <div class="item">
        <div class="image-layout">
          <div class="column left">
            <img src="../assets/images/ai/Number/02.png">
            <img src="../assets/images/ai/Number/05.png">
          </div>
          <div class="column right">
            <img src="../assets/images/ai/Number/09.png">
          </div>
        </div>
        <p class="item-title">Các con số</p>
      </div>
      <div class="item">
        <div class="image-layout">
          <div class="column left">
            <img src="../assets/images/ai/Animal/054.png">
            <img src="../assets/images/ai/Animal/055.png">
          </div>
          <div class="column right">
            <img src="../assets/images/ai/Animal/056.png">
          </div>
        </div>
        <p class="item-title">Động vật</p>
      </div>
      <div class="item">
        <div class="image-layout">
          <div class="column left">
            <img src="../assets/images/ai/ImageWorld/006.jpg">
            <img src="../assets/images/ai/ImageWorld/003.jpg">
          </div>
          <div class="column right">
            <img src="../assets/images/ai/ImageWorld/000.jpg">
          </div>
        </div>
        <p class="item-title">Thế giới trong sách</p>
      </div>
    </div>
  </div>
</section>
<!-- section category trend -->

<!-- section infomation addition -->
<section class="info-why">
  <h1 class="title mb-2 fs-1 text-center">Tại sao giấy phép hỉnh ảnh AI</h1>
  <div class="contain d-flex ">
    <div class="box">
      <img src="../assets/images/ai/Plant/20.png" alt="">
      <div class="content">
        <h3>Không giới hạn về sáng tạo</h3>
        <p>Bạn có thể tìm thấy hình ảnh minh họa cho bất kỳ chủ đề nào bạn muốn,
          từ những hình ảnh trừu tượng đến những hình ảnh chân thực.</p>
      </div>
    </div>
    <div class="box">
      <img src="../assets/images/ai/Food/010.webp" alt="">
      <div class="content">
        <h3>Hài hòa về nghệ thuật</h3>
        <p>Hình ảnh minh họa giúp bạn tạo ra những thiết kế đồng nhất và chuyên nghiệp.</p>
      </div>
    </div>
    <div class="box">
      <img src="../assets/images/ai/Animal/045.jpg" alt="">
      <div class="content">
        <h3>Hoàn hảo để kể chuyện</h3>
        <p>Hình ảnh minh họa là một cách tuyệt vời để kể những câu chuyện hấp dẫn và gây ấn tượng.</p>
      </div>
    </div>
  </div>
</section>
<!-- section infomation addition -->

<!--section footer -->
<section class="footer">
  <div class="container d-flex justify-content-space">
    <div class="footer-column">
      <h3 class="fw-bold"><span class="text-success">C</span>o<span class="text-success">R</span>iPhoto</h3>
      <br><br>
      <div class="social-icons d-flex">
        <a href="#" class="text-decoration-none text-dark mx-2">
          <i class="fa-brands fa-facebook-f"></i>
        </a>
        <a href="#" class="text-decoration-none text-dark mx-2">
          <i class="fa-brands fa-github"></i>
        </a>
        <a href="#" class="text-decoration-none text-dark mx-2">
          <i class="fa-brands fa-pinterest-p"></i>
        </a>
      </div>
    </div>
    <div class="footer-column">
      <h3>Giấy phép</h3>
      <br>
      <ul>
        <li><a href="#">Về giấy phép</a></li>
        <li><a href="#">Nhà phân phối</a></li>
        <li><a href="#">Bản quyền</a></li>
      </ul>
    </div>
    <div class="footer-column">
      <h3>Về chúng tôi</h3>
      <br>
      <ul>
        <li><a href="#"><i class="fa-solid fa-envelope pe-2"></i>coriphoto@gmail.com</a></li>
        <li><a href="#"><i class="fa-solid fa-phone pe-2"></i>081 222 1111</a></li>
        <li><a href="#"><i class="fa-solid fa-location-dot pe-2"></i>Hồ Chí Minh, Việt Nam</a></li>
      </ul>
    </div>
    <div class="footer-column">
      <h3 class="fs-4 mb-3 fw-bold">Bản tin</h3>
      <p>Đăng ký nhận bản tin của chúng tôi để nhận được những hình ảnh mới, mẹo và chương trình giảm giá mỗi
        tuần.</p>
      <form class="newsletter-form">
        <input type="email" placeholder="Enter your email address" required>
        <button type="submit">Subscribe</button>
      </form>
    </div>
  </div>
  <div class="footer-bottom">
    <p>Chính sách bảo mật • Điều khoản và điều kiện</p>
  </div>
</section>
<!--section footer -->

<script src="../assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/libraries/swiper/js/swiper-bundle.min.js"></script>
<script src="../assets/js/homepage.js"></script>
<script src="../assets/js/navbar.js"></script>
<script src="../assets/js/homeuser.js"></script>
<script src="../assets/js/type-images.js"></script>

</body>

</html>

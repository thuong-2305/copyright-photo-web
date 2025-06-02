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
<!-- section category detail -->
<section id="tranding" class="category-section">
  <div class="container">
    <div class="section-header">
      <h1 class="section-title">Khám phá tài nguyên theo phong cách</h1>
      <p class="section-subtitle">
        Khám phá các phong cách <span class="highlight">hình ảnh AI</span> khác nhau
        để thể hiện những ý tưởng mạnh mẽ của bạn và kết nối với khán giả
      </p>
    </div>

    <!-- Filter buttons -->
    <div class="filter-buttons">
      <button class="filter-btn active" data-filter="all">Tất cả</button>
      <button class="filter-btn" data-filter="nature">Thiên nhiên</button>
      <button class="filter-btn" data-filter="abstract">Trừu tượng</button>
      <button class="filter-btn" data-filter="portrait">Chân dung</button>
      <button class="filter-btn" data-filter="tech">Công nghệ</button>
    </div>

    <div class="tranding-container">
      <div class="swiper tranding-slider">
        <div class="swiper-wrapper">
          <jsp:useBean id="slides" scope="request" type="java.util.List"/>
          <c:forEach var="slide" items="${slides}">
            <!-- Slide-start -->
            <div class="swiper-slide tranding-slide">
              <a href="product-detail?pid=${slide.id}" class="card-link">
                <div class="card-wrapper">
                  <div class="tranding-slide-img">
                    <img src="${slide.url}" alt="${slide.name}" loading="lazy">
                    <div class="card-overlay">
                      <button class="btn-icon btn-view" title="Xem nhanh">
                        <i class="fa-solid fa-eye"></i>
                      </button>
                      <button class="btn-icon btn-favorite" title="Yêu thích">
                        <i class="fa-regular fa-heart"></i>
                      </button>
                    </div>
                  </div>
                  <div class="tranding-slide-content">
                    <h5 class="style-name">
                      <i class="fa-solid fa-tags"></i>
                      <span>${slide.name}</span>
                    </h5>
                    <div class="card-stats">
                      <span class="stat-item">
                        <i class="fa-solid fa-download"></i> 1.2k
                      </span>
                      <span class="stat-item">
                        <i class="fa-solid fa-heart"></i> 856
                      </span>
                    </div>
                  </div>
                </div>
              </a>
            </div>
            <!-- Slide-end -->
          </c:forEach>
        </div>

        <!-- Swiper Navigation -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
      </div>
    </div>
  </div>
</section>

<!-- Divider -->
<div class="section-divider">
  <div class="divider-shape"></div>
</div>

<!-- section category trend -->
<section class="trend-type">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">Xu hướng tháng này</h2>
      <p class="section-subtitle">
        Khám phá các vectơ hoàn hảo cho các dự án và chiến dịch trong mùa này.
      </p>
    </div>

    <div class="trending-items">
      <div class="trend-item">
        <div class="item-inner">
          <div class="image-layout">
            <div class="column left">
              <div class="image-placeholder small">
                <img src="../assets/images/ai/Number/06.png" alt="Plant 1">
              </div>
              <div class="image-placeholder small">
                <img src="../assets/images/ai/Number/03.png" alt="Plant 2">
              </div>
            </div>
            <div class="column right">
              <div class="image-placeholder large">
                <img src="../assets/images/ai/Number/08.png" alt="Plant 3">
              </div>
            </div>
          </div>
          <div class="trend-badge">
            <i class="fa-solid fa-fire"></i> Hot
          </div>
        </div>
        <h3 class="item-title">Hoa thực vật</h3>
        <p class="item-count">256 hình ảnh</p>
      </div>

      <div class="trend-item">
        <div class="item-inner">
          <div class="image-layout">
            <div class="column left">
              <div class="image-placeholder small">
                <img src="../assets/images/ai/Number/09.png" alt="Number 1">
              </div>
              <div class="image-placeholder small">
                <img src="../assets/images/ai/Number/02.png" alt="Number 2">
              </div>
            </div>
            <div class="column right">
              <div class="image-placeholder large">
                <img src="../assets/images/ai/Number/05.png" alt="Number 3">
              </div>
            </div>
          </div>
          <div class="trend-badge trending">
            <i class="fa-solid fa-arrow-trend-up"></i> Trending
          </div>
        </div>
        <h3 class="item-title">Các con số</h3>
        <p class="item-count">189 hình ảnh</p>
      </div>

      <div class="trend-item">
        <div class="item-inner">
          <div class="image-layout">
            <div class="column left">
              <div class="image-placeholder small">
                <img src="../assets/images/ai/Animal/054.png" alt="Animal 1">
              </div>
              <div class="image-placeholder small">
                <img src="../assets/images/ai/Animal/055.png" alt="Animal 2">
              </div>
            </div>
            <div class="column right">
              <div class="image-placeholder large">
                <img src="../assets/images/ai/Animal/056.png" alt="Animal 3">
              </div>
            </div>
          </div>
          <div class="trend-badge new">
            <i class="fa-solid fa-sparkles"></i> Mới
          </div>
        </div>
        <h3 class="item-title">Động vật</h3>
        <p class="item-count">342 hình ảnh</p>
      </div>

      <div class="trend-item">
        <div class="item-inner">
          <div class="image-layout">
            <div class="column left">
              <div class="image-placeholder small">
                <img src="../assets/images/ai/ImageWorld/008.jpg" alt="World 1">
              </div>
              <div class="image-placeholder small">
                <img src="../assets/images/ai/ImageWorld/007.jpg" alt="World 2">
              </div>
            </div>
            <div class="column right">
              <div class="image-placeholder large">
                <img src="../assets/images/ai/ImageWorld/006.jpg" alt="World 3">
              </div>
            </div>
          </div>
        </div>
        <h3 class="item-title">Thế giới trong sách</h3>
        <p class="item-count">128 hình ảnh</p>
      </div>
    </div>
  </div>
</section>

<!-- section infomation addition -->
<section class="info-why">
  <div class="container">
    <div class="section-header">
      <h2 class="section-title">Tại sao chọn giấy phép hình ảnh AI</h2>
    </div>

    <div class="info-grid">
      <div class="info-box">
        <div class="box-inner">
          <div class="box-icon">
            <i class="fa-solid fa-infinity"></i>
          </div>
          <div class="box-image">
            <img src="../assets/images/ai/Food/010.webp" alt="Creative">
          </div>
          <div class="box-content">
            <h3>Không giới hạn về sáng tạo</h3>
            <p>Bạn có thể tìm thấy hình ảnh minh họa cho bất kỳ chủ đề nào bạn muốn,
              từ những hình ảnh trừu tượng đến những hình ảnh chân thực.</p>
            <a href="#" class="learn-more">
              Tìm hiểu thêm <i class="fa-solid fa-arrow-right"></i>
            </a>
          </div>
        </div>
      </div>

      <div class="info-box">
        <div class="box-inner">
          <div class="box-icon">
            <i class="fa-solid fa-palette"></i>
          </div>
          <div class="box-image">
            <img src="../assets/images/ai/Food/010.webp" alt="Artistic">
          </div>
          <div class="box-content">
            <h3>Hài hòa về nghệ thuật</h3>
            <p>Hình ảnh minh họa giúp bạn tạo ra những thiết kế đồng nhất và chuyên nghiệp.</p>
            <a href="#" class="learn-more">
              Tìm hiểu thêm <i class="fa-solid fa-arrow-right"></i>
            </a>
          </div>
        </div>
      </div>

      <div class="info-box">
        <div class="box-inner">
          <div class="box-icon">
            <i class="fa-solid fa-book-open"></i>
          </div>
          <div class="box-image">
            <img src="../assets/images/ai/Food/010.webp" alt="Storytelling">
          </div>
          <div class="box-content">
            <h3>Hoàn hảo để kể chuyện</h3>
            <p>Hình ảnh minh họa là một cách tuyệt vời để kể những câu chuyện hấp dẫn và gây ấn tượng.</p>
            <a href="#" class="learn-more">
              Tìm hiểu thêm <i class="fa-solid fa-arrow-right"></i>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Statistics Section -->
<section class="stats-section">
  <div class="container">
    <div class="stats-grid">
      <div class="stat-card">
        <div class="stat-icon">
          <i class="fa-solid fa-images"></i>
        </div>
        <h3 class="stat-number" data-count="10000">10000+</h3>
        <p class="stat-label">Hình ảnh AI</p>
      </div>
      <div class="stat-card">
        <div class="stat-icon">
          <i class="fa-solid fa-users"></i>
        </div>
        <h3 class="stat-number" data-count="5000">1000+</h3>
        <p class="stat-label">Khách hàng hài lòng</p>
      </div>
      <div class="stat-card">
        <div class="stat-icon">
          <i class="fa-solid fa-download"></i>
        </div>
        <h3 class="stat-number" data-count="50000">10000+</h3>
        <p class="stat-label">Lượt tải xuống</p>
      </div>
      <div class="stat-card">
        <div class="stat-icon">
          <i class="fa-solid fa-star"></i>
        </div>
        <h3 class="stat-number" data-count="99">99%</h3>
        <p class="stat-label">% Hài lòng</p>
      </div>
    </div>
  </div>
</section>


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
<!-- Thêm Swiper JS vào cuối trang -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>

<script>
  // Initialize Swiper
  document.addEventListener('DOMContentLoaded', function() {
    const swiper = new Swiper('.tranding-slider', {
      // Số lượng slide hiển thị
      slidesPerView: 3,
      spaceBetween: 20, // Khoảng cách giữa các slide

      // Tự động chuyển slide
      autoplay: {
        delay: 5000,
        disableOnInteraction: false,
      },

      // Loop vô hạn
      loop: true,

      // Navigation
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },

      // Pagination
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },

      // Responsive breakpoints
      breakpoints: {
        // Khi màn hình >= 1200px
        1200: {
          slidesPerView: 3,
          spaceBetween: 30
        },
        // Khi màn hình >= 768px
        768: {
          slidesPerView: 2,
          spaceBetween: 20
        },
        // Khi màn hình < 768px
        0: {
          slidesPerView: 1,
          spaceBetween: 10
        }
      }
    });

    // Pause on hover
    const swiperContainer = document.querySelector('.tranding-slider');
    swiperContainer.addEventListener('mouseenter', () => {
      swiper.autoplay.stop();
    });

    swiperContainer.addEventListener('mouseleave', () => {
      swiper.autoplay.start();
    });
  });
</script>

<script src="../assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../assets/libraries/swiper/js/swiper-bundle.min.js"></script>
<script src="../assets/js/homepage.js"></script>
<script src="../assets/js/navbar.js"></script>
<script src="../assets/js/homeuser.js"></script>
<script src="../assets/js/type-images.js"></script>

</body>

</html>

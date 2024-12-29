<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>
    <title>Hồ sơ</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/homepage.css">
    <link rel="stylesheet" href="assets/css/navbar-footer.css">
    <link rel="stylesheet" href="assets/css/homeuser.css">
    <link rel="stylesheet" href="assets/css/editprofile.css">

    <link rel="stylesheet" href="assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>

<body>


<!--section navbar -->
<section id="nav">
    <div class="container">
        <nav class="navbar navbar-expand-lg w-100">
            <div class="container-fluid">
                <a class="navbar-brand me-auto" href="homeuser.html">
            <span class="title-logo fw-bold"><span class="text-success">C</span>o<span
                    class="text-success">R</span>iPhoto</span>
                </a>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasDarkNavbar"
                     aria-labelledby="offcanvasDarkNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title fw-bold" id="offcanvasDarkNavbarLabel">
                            <span class="text-success">C</span>o<span class="text-success">R</span>iPhoto
                        </h5>
                        <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-center flex-grow-1">
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" aria-current="page" href="homepage.html">
                                    <span class="fw-semibold">Ảnh</span>
                                    <i class="fa-solid fa-angle-down px-2"></i>
                                </a>
                                <div class="link-hover">
                                    <a href="type-images.html">Ảnh chụp</a>
                                    <a href="type-images.html">Ảnh vectors</a>
                                    <a href="type-images.html">Ảnh AI</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" href="category-details.html">
                                    <span class="fw-semibold">Danh mục</span>
                                    <i class="fa-solid fa-angle-down px-2"></i>
                                </a>
                                <div class="link-hover">
                                    <div class="dropdown">
                                        <a href="products.html"> Trừu tượng</a>
                                        <a href="products.html"> Công nghệ</a>
                                        <a href="products.html"> Tự nhiên</a>
                                        <a href="products.html"> Cuộc sống</a>
                                        <a href="products.html"> Động vật</a>
                                    </div>
                                    <div class="dropdown">
                                        <a href="products.html"> Các mùa</a>
                                        <a href="products.html"> Trên không</a>
                                        <a href="products.html"> Ban đêm</a>
                                        <a href="products.html"> Thành phố</a>
                                        <a href="products.html"> Quê hương</a>
                                    </div>
                                    <div class="dropdown">
                                        <a href="products.html"> Con người</a>
                                        <a href="products.html"> Du lịch</a>
                                        <a href="products.html"> Nghệ thuật</a>
                                        <a href="products.html"> Cuộc sống</a>
                                        <a href="category-details.html"> Tất cả Danh mục</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" href="#">
                                    <span class="fw-semibold">Giấy phép</span>
                                    <i class="fa-solid fa-angle-down px-2"></i>
                                </a>
                                <div class="link-hover">
                                    <a href="license-basic.html">Giấy phép ảnh tiêu chuẩn</a>
                                    <a href="license-basic.html">Giấy phép miễn phí bản quyền</a>
                                </div>
                            </li>
                            <!-- <li class="nav-item">
                              <a class="nav-link mx-lg-3 fw-semibold" href="#">Giới thiệu</a>
                            </li> -->
                        </ul>
                    </div>
                </div>
                <div class="d-flex align-items-center pt-1">
                    <div class="sell">
                        <a href="#" class="sell mx-lg-2 fw-semibold">Người phân phối<i
                                class="fa-solid fa-angle-down px-2"></i></a>
                        <div class="link-hover">
                            <a href="register-contributor.html">Đăng ký thành người phân phối</a>
                        </div>
                    </div>
                    <div class="line-separate mx-lg-1"></div>
                    <a href="like.html" class="love"><i class="fa-regular fa-heart"></i></a>
                    <a href="cart.html" class="cart"><i class="fa-solid fa-cart-shopping"></i></a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasDarkNavbar"
                        aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="d-flex align-items-center user-icon" id="user">
                    <img class="avatar position-relative" src="assets/images/avart-default.png"/>
                    <i class="fa fa-caret-down ms-2"></i>
                </div>
            </div>
        </nav>
    </div>
</section>
<!--section navbar -->

<!-- section user account -->
<section class="user-account bg-white">
    <div class="container">
        <div class="top d-flex mt-5 align-items-center">
            <img class="avatar position-relative" src="assets/images/avart-default.png"/>
            <div class="info">
                <div class="name">
                    <span>Hi, Test</span>
                    <p>test@gmail.com</p>
                </div>
                <a href="./editprofile.html" class="text-decoration-none">Chỉnh sửa hồ sơ</a>
            </div>
        </div>
        <div class="line-seperate"></div>
        <div class="option">
            <ul class="">
                <li class="item">
                    <a href="homeprofile.html">
                        <i class="fas fa-user-cog me-2"></i>
                        <p>Chi tiết tài khoản</p>
                    </a>
                </li>
                <li class="item">
                    <a href="like.html">
                        <i class="fas fa-heart me-2"></i>
                        <p>Yêu thích</p>
                    </a>
                </li>
                <li class="item">
                    <a href="cart.html">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <p>Giỏ hàng</p>
                    </a>
                </li>
                <li class="item">
                    <a href="history-order.html">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <p>Lịch sử mua hàng</p>
                    </a>
                </li>
                <li class="item">
                    <a href="homepage.html">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                        <p class="mb-0">Đăng xuất</p>
                    </a>
                </li>
            </ul>
        </div>
        <button class="btn-close btn-close-black close-user"></button>
    </div>
</section>
<div class="overlay"></div>
<!-- section user account -->

<div id="account-details">
    <div class="container-fluid">
        <div class="account-details-container">
            <!-- Khi người dùng không điền thông tin -->
            <div class="account-details-content">
                <div class="row">
                    <div class="col-3">
                        <div class="nav" id="account-menu-container">
                            <div class="account-menu-content">
                                <!-- Avatar -->
                                <div class="profile-avatar-container">
                                    <div class="profile-avatar-content">
                                        <div class="profile-image dp-ib">
                                            <img src="assets/images/avart-default.png" alt="avatar">
                                        </div>
                                        <div class="font-weight-bold ml-2 dp-ib profile-name">
                                            Zupiter
                                        </div>
                                    </div>
                                </div>
                                <!-- Navigation -->
                                <ul class="mt-3 menu-link stl-none">
                                    <li class="profile mt-2">
                                        <a href="ShowProfileInformation">Hồ sơ</a>
                                    </li>
                                    <li class="payment-method mt-2">
                                        <a href="ShowPaymentMethodProfile">Phương thức thanh toán</a>
                                    </li>
                                    <li class="change-password mt-2">
                                        <a href="ChangePassword">Đổi mật khẩu</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Content -->


                    <div class="col-8 main-content">
                        <c:if test="${not empty success}">
                            <div class="alert alert-success">
                                    ${success}
                            </div>
                        </c:if>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">
                                    ${error}
                            </div>
                        </c:if>
                        <div class="account-details-heading">
                            <h3>Hồ sơ</h3>
                            <h5>Quản lý thông tin hồ sơ để bảo vệ tài khoản</h5>
                        </div>
                        <form action="UpdateProfileName" method="post" class="account-details-body">
                            <div class="row name">
                                <div class="col-6 last-name-content">
                                    <div class="last-name-label">
                                        <label for="">
                                            <span>Tên</span>
                                        </label>
                                    </div>
                                    <div class="last-name-input">
                                        <input class="w-100 form-control" type="text" name="fullname" value="${user.fullName}">
                                    </div>
                                </div>
                            </div>
                            <div class="email">
                                <div class="email-content row align-items-center">
                                    <div class="email-label col-3 text-left pr-2">
                                        <label class="mb-0" for="">Email</label>
                                    </div>
                                    <div class="email-text col-9">
                                        <div class="email-text-from-user d-flex align-items-center text-left">
                                            ${user.email}
                                            <button type="button" id="changeEmailButton"
                                                    class="btn email-change pb-0 pt-0 mb-0 mt-0 ml-2"
                                                    data-toggle="modal" data-target="#otpModal">Thay đổi
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="otpModal" tabindex="-1" role="dialog"
                                     aria-labelledby="otpModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="otpModalLabel">Gửi OTP đến email</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Chúng tôi sẽ gửi OTP đến email của bạn để xác nhận thay đổi.</p>
                                                <button type="button" id="sendOtpButton" class="btn btn-primary">Gửi OTP</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="newEmailModal" tabindex="-1" role="dialog"
                                     aria-labelledby="newEmailModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="newEmailModalLabel">Nhập email mới</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <label for="newEmail">Email mới:</label>
                                                <input type="email" id="newEmail" class="form-control"
                                                       placeholder="Nhập email mới">
                                                <button type="button" id="submitNewEmail" class="btn btn-primary mt-3">Thay đổi email
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="username">
                                <div class="username-content row align-items-center">
                                    <div class="username-label col-3 text-left pr-2">
                                        <label class="mb-0" for="">Tên đăng nhập</label>
                                    </div>
                                    <div class="username-text col-9">
                                        <div class="username-text-from-user text-left">
                                            ${user.username}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="account-details-footer">
                                <div class="btn-container dp-flex">
                                    <button type="submit" class="btn-save dp-flex" value="change">
                                        <span>Lưu thay đổi</span>
                                    </button>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


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
<script src="assets/js/change-email.js"></script>
<script src="assets/js/send-otp.js"></script>
<script src="assets/js/navbar.js"></script>
<%--<script src="assets/js/editprofile.js"></script>--%>
<script src="assets/js/homeuser.js"></script>
<script src="assets/js/homepage.js"></script>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>
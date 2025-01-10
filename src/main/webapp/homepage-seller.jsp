<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>
    <title>Bán Ảnh</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/homepage-seller.css">
    <link rel="stylesheet" href="assets/css/navbar-footer.css">
    <link rel="stylesheet" href="assets/css/homeuser.css">
    <link rel="stylesheet" href="assets/css/editprofile.css">
    <link rel="stylesheet" href="assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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
                        data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="d-flex align-items-center user-icon" id="user">
                    <img class="avatar position-relative" src="../assets/images/avart-default.png"/>
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
            <img class="avatar position-relative" src="../assets/images/avart-default.png"/>
            <div class="info">
                <div class="name">
                    <span>Hi, Test</span>
                    <p>test@gmail.com</p>
                </div>
                <a href="editprofile.html" class="text-decoration-none">Chỉnh sửa hồ sơ</a>
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
                    <a href="../homepage.html">
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

<div id="homepage-seller">
    <div class="container-fluid">
        <div class="homepage-seller-container">
            <div class="homepage-seller-content">
                <div class="row">
                    <!-- Sidebar -->
                    <div class="col-2 pl-0 pr-0">
                        <div id="navbar-side" class="shadow-sm">
                            <div class="navbar-side-content">
                                <div
                                        class="profile-avatar-content w-100 d-flex flex-column text-center align-items-center justify-content-center py-3 bg-light">
                                    <div
                                            class="profile-image-container d-flex text-center align-items-center justify-content-center py-3">
                                        <div class="profile-image">
                                            <img class="rounded-circle mx-auto"
                                                 src="assets/images/avart-default.png" alt="Avatar profile">
                                        </div>
                                        <i class="fa fa-pencil-square" aria-hidden="true"></i>
                                    </div>
                                    <div class="profile-name">
                                        Zupiter
                                    </div>
                                </div>
                                <ul class="menu-link stl-none mt-3">
                                    <li class="dashboard d-flex text-center align-items-center justify-content-center"
                                        onclick="location.href='./homepage-seller.html';">
                                        <a href="./homepage-seller.html" class="text-dark"><i
                                                class="fa fa-chart-simple"></i> Thống
                                            Kê</a>
                                    </li>
                                    <li class="my-photos d-flex text-center align-items-center justify-content-center"
                                        onclick="location.href='myphoto-seller.html';">
                                        <a href="myphoto-seller.html" class="text-dark"><i class="fas fa-image"></i> Ảnh
                                            Của Tôi</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <!-- Main content -->
                    <div class="col-10">
                        <div id="main-content">
                            <div class="heading-content">
                                <h2>Thống kê</h2>
                                <h5 class="font-weight-normal">${totalImgSelled} ảnh</h5>
                            </div>

                            <!-- Các ô thông tin xem thống kê -->
                            <div class="show-statistic">
                                <div class="row mb-3 mt-4">
                                    <!-- Lượt mua -->
                                    <div class="col-3 download-container">
                                        <div class="download p-3 rounded d-flex align-items-center">
                                            <div class="download-image mr-3">
                                                <i class="fas fa-download"></i>
                                            </div>
                                            <div class="download-text-content d-flex flex-column">
                                                <div class="download-text">
                                                    Lượt mua
                                                </div>
                                                <div class="download-count font-weight-bold">
                                                    ${buyTotals}
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- Tổng thu nhập -->
                                    <div class="col-3 earning-container">
                                        <div class="earning p-3 rounded d-flex align-items-center">
                                            <div class="earning-image mr-3">
                                                <i class="fas fa-money-bill"></i>
                                            </div>
                                            <div class="earning-text-content d-flex flex-column">
                                                <div class="earning-text">
                                                    Tổng thu nhập
                                                </div>
                                                <div class="earning-total font-weight-bold">
                                                    ${totalIncome}
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- Số tiền hiện có -->
                                    <div class="col-6 available-earning-container">
                                        <div class="available-earning p-3 rounded d-flex align-items-center">
                                            <div class="available-earning-image mr-3">
                                                <i class="fas fa-money-bill-wave"></i>
                                            </div>
                                            <div class="available-earning-text-content d-flex flex-column">
                                                <div class="available-earning-text">
                                                    Số tiền hiện có
                                                    <!-- Thêm tooltip -->
                                                    <i class="fas fa-info-circle icon-available-earning-text"
                                                       data-toggle="tooltip" data-html="true"
                                                       title="<strong>Làm thế nào để tôi được trả tiền?</strong><br>Số tiền tối thiểu để rút về cần ít nhất hoặc nhiều hơn 500.000VNĐ."></i>
                                                </div>
                                                <div class="available-earning-total font-weight-bold">
                                                    ${balance}
                                                </div>
                                            </div>
                                            <div class="request-payout ml-auto">
                                                <button class="pt-2 pb-2 pl-4 pr-4">Rút tiền ngay</button>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>


                            <!-- Các nút danh mục -->
                            <!-- Combobox danh mục -->
                            <form action="ShowStatistic" method="get" id="categoryForm">
                                <div class="dropdown mt-5 mb-3">
                                    <button class="btn dropdown-toggle border" type="button" id="categoryDropdown"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Tất cả
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="categoryDropdown">
                                        <a class="dropdown-item" href="#" onclick="selectCategory('all')">Tất cả</a>
                                        <a class="dropdown-item" href="#" onclick="selectCategory('photo')">Photo</a>
                                        <a class="dropdown-item" href="#" onclick="selectCategory('vector')">Vector</a>
                                        <a class="dropdown-item" href="#" onclick="selectCategory('ai')">AI</a>
                                    </div>
                                </div>
                                <input type="hidden" name="categoryParentName" id="categoryInput" />
                                <input type="submit" style="display: none;" />
                            </form>


                            <form action="" class="statistics-form mt-2">
                                <table class="table admin-table table-statistics">
                                    <thead>
                                    <tr>
                                        <th class="product-image text-style-col">Ảnh</th>
                                        <th class="product-purchases text-style-col">Số lượt mua</th>
                                        <th class="product-average text-style-col">Trung bình</th>
                                        <th class="product-total text-style-col">Tổng tiền</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Duyệt qua các sản phẩm trong danh sách productsStat -->
                                    <c:forEach var="product" items="${productsStat}">
                                        <tr class="statistics-item">
                                            <!-- Ảnh -->
                                            <td class="product-image d-flex ">
                                                <a href="product-detail?pid=${product.id}">
                                                    <img class="image-style" src="${product.url}"
                                                         alt="Ảnh sản phẩm">
                                                </a>
                                                <div class="ml-2 product-image-content d-flex flex-column">
                                                    <div class="product-image-title">
                                                            ${product['name']} <!-- Tên sản phẩm -->
                                                    </div>
                                                    <div class="product-image-id">
                                                        #${product['id']} <!-- ID sản phẩm -->
                                                    </div>
                                                </div>
                                            </td>
                                            <!-- Số lượt mua -->
                                            <td class="product-purchases align-middle">
                                                <span class="purchase-count">${product['buycount']}</span>
                                                <!-- Số lượt mua -->
                                            </td>
                                            <!-- Trung bình -->
                                            <td class="product-average align-middle">
                                                <span class="price-amount">
                                                    ${product['averageprice']} <span class="currencySymbol">VNĐ</span> <!-- Giá trung bình -->
                                                </span>
                                            </td>
                                            <!-- Tổng tiền -->
                                            <td class="product-total align-middle">
                                                <span class="price-amount">
                                                    ${product['totalprice']} <span class="currencySymbol">VNĐ</span> <!-- Tổng tiền -->
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>

                                </table>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>


<script src="assets/js/homepage-seller.js"></script>
<script src="assets/js/navbar.js"></script>
<script src="assets/js/homeuser.js"></script>
<script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>

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
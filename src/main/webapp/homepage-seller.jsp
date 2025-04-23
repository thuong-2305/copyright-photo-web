<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">

<head>
    <title>Bán Ảnh</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <jsp:include page="include/head.jsp" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/homepage-seller.css">
    <link rel="stylesheet" href="assets/css/editprofile.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
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

<jsp:include page="include/navbar.jsp" />

<div id="homepage-seller">
    <div class="container-fluid">
        <div class="homepage-seller-container">
            <div class="homepage-seller-content">
                <div class="row mt-5">
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
                                        ${username}
                                    </div>
                                </div>
                                <ul class="menu-link stl-none mt-3">
                                    <li class="dashboard d-flex text-center align-items-center justify-content-center">
                                        <a href="#" class="text-dark"><i class="fa fa-chart-simple"></i> Thống Kê</a>
                                    </li>
                                    <li class="my-photos d-flex text-center align-items-center justify-content-center"
                                        onclick="location.href='myphoto-seller.html';">
                                        <a href="MyPhotoManage" class="text-dark">
                                            <i class="fas fa-image"></i> Ảnh Của Tôi
                                        </a>
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
                                                    <fmt:formatNumber value="${totalIncome}" pattern="#,##0" />
                                                    <span> VNĐ</span>                                                </div>
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
                            <div class="dropdown mt-5 mb-3">
                                <button class="btn dropdown-toggle border" type="button" id="categoryDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Tất cả
                                </button>
                                <div class="dropdown-menu" aria-labelledby="categoryDropdown">
                                    <a class="dropdown-item" href="#" onclick="selectCategory('all')">Tất cả</a>
                                    <a class="dropdown-item" href="#" onclick="selectCategory('photo')">Photo</a>
                                    <a class="dropdown-item" href="#" onclick="selectCategory('vector')">Vector</a>
                                    <a class="dropdown-item" href="#" onclick="selectCategory('ai')">AI</a>
                                </div>
                            </div>


                            <!-- Bảng thống kê sản phẩm -->
                            <table id="productsTable" class="display table admin-table table-statistics">
                                <thead>
                                <tr>
                                    <th class="product-id text-style-col">ID</th>
                                    <th class="product-name text-style-col">Tên sản phẩm</th>
                                    <th class="product-image text-style-col">Ảnh</th>
                                    <th class="product-purchases text-style-col">Số lượt mua</th>
                                    <th class="product-average text-style-col">Trung bình</th>
                                    <th class="product-total text-style-col">Tổng tiền</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- DataTables sẽ tự động điền dữ liệu vào đây -->
                                </tbody>
                            </table>


                            <!-- Input ẩn để lưu giá trị danh mục -->
                            <input type="hidden" name="categoryParentName" id="categoryInput" />
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


<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>
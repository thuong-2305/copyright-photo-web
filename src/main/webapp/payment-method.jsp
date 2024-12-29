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
    <link rel="stylesheet" href="assets/css/payment-method.css">
    <link rel="stylesheet" href="assets/css/homepage.css">
    <link rel="stylesheet" href="assets/css/navbar-footer.css">
    <link rel="stylesheet" href="assets/css/homeuser.css">
    <link rel="stylesheet" href="assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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

<div id="payment-method">
    <div class="container-fluid">
        <div class="payment-method-container">
            <div class="row">
                <div class="col-3">
                    <div class="nav" id="account-menu-container">
                        <div class="account-menu-content">
                            <!-- Avatar -->
                            <div class="profile-avatar-container">
                                <div class="profile-avatar-content">
                                    <div class="profile-image dp-ib">
                                        <img src="assets/images/avart-default.png" alt="">
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
                <div class="col-9 main-content">
                    <c:if test="${not empty addCardError}">
                        <div class="alert alert-danger">
                                ${addCardError}
                        </div>
                        <c:remove var="addCardError"/>
                    </c:if>

                    <c:if test="${not empty addBankError}">
                        <div class="alert alert-danger">
                                ${addBankError}
                        </div>
                        <c:remove var="addBankError"/>
                    </c:if>

                    <c:if test="${not empty deleteError}">
                        <div class="alert alert-danger">
                                ${deleteError}
                        </div>
                        <c:remove var="deleteError"/>
                    </c:if>

                    <c:if test="${not empty addBankSuccess}">
                        <div class="alert alert-success">
                                ${addBankSuccess}
                        </div>
                        <c:remove var="addBankSuccess"/>
                    </c:if>

                    <c:if test="${not empty addCardSuccess}">
                        <div class="alert alert-success">
                                ${addCardSuccess}
                        </div>
                        <c:remove var="addCardSuccess"/>
                    </c:if>

                    <c:if test="${not empty deleteSuccess}">
                        <div class="alert alert-success">
                                ${deleteSuccess}
                        </div>
                        <c:remove var="deleteSuccess"/>
                    </c:if>


                    <div class="credit-card-method">
                        <div class="credit-card-header pb-4 pt-4 d-flex">
                            <div class="title-credit-card dp-ib">
                                <span>Thẻ Tín Dụng/Ghi Nợ</span>
                            </div>
                            <div class="button-add-credit-card ml-auto">
                                <button class="pl-4 pr-4 pb-2 pt-2" data-toggle="modal" data-target="#addCreditCardModal">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    Thêm thẻ mới
                                </button>
                            </div>
                        </div>





                        <c:if test="${empty paymentMethods || !hasCard}">
                            <div class="mt-4 d-flex justify-content-center align-items-center">
                                <span>Bạn chưa liên kết thẻ</span>
                            </div>
                        </c:if>



                        <c:forEach var="payment" items="${paymentMethods}">
                            <c:if test="${payment.pmTypeId == 1}">
                                <div class="ba-card mt-4">
                                    <div class="ba-card-content d-flex">
                                        <!-- Hình ảnh -->
                                        <div class="ba-card-logo-wrapper mr-3">
                                            <img src="assets/images/bidv_card_image.jfif" alt="Logo" class="img-fluid">
                                        </div>
                                        <!-- Thông tin chi tiết, gồm 3 dòng bên phải -->
                                        <div class="ba-card-info d-flex flex-column">
                                            <div class="ba-card-brief mb-2">
                                                <div class="ba-card-name-wrapper d-flex">
                                                    <span class="ba-card-name">${payment.provider}</span>
                                                </div>
                                            </div>
                                            <div class="ba-card-username">
                                                <span>Họ Và Tên: ${payment.accountName}</span>
                                            </div>
                                            <div class="ba-card-branch">
                                                <label class="ba-card-branch-label">STK:</label>
                                                <span>${payment.accountNumber}</span>
                                            </div>
                                        </div>
                                        <div class="ba-card-buttons ml-auto">
                                            <button class="ba-btn-delete align-items-center"
                                                    onclick="confirmDelete('${payment.pmid}')">Xóa
                                            </button>
                                        </div>

                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>

                    <div class="bank-method mt-4">
                        <div class="bank-method-header pb-4 pt-4 d-flex">
                            <div class="title-bank-method dp-ib">
                                <span>Tài Khoản Ngân Hàng Của Tôi</span>
                            </div>
                            <div class="button-add-bank ml-auto">
                                <button class="pl-4 pr-4 pb-2 pt-2" data-toggle="modal" data-target="#addBankAccountModal">
                                    <i class="fa fa-plus" aria-hidden="true"></i>
                                    Thêm Tài Khoản Ngân Hàng Liên Kết
                                </button>
                            </div>
                        </div>
                        <div class="bank-method-body">

                            <c:if test="${empty paymentMethods || !hasBankAccount}">
                                <div class="mt-4 d-flex justify-content-center align-items-center">
                                    <span>Bạn chưa liên kết thẻ</span>
                                </div>
                            </c:if>


                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger">
                                        ${errorMessage}
                                </div>
                            </c:if>
                            <!-- Hiển thị thẻ ngân hàng -->
                            <c:forEach var="payment" items="${paymentMethods}">
                                <c:if test="${payment.pmTypeId == 2}">
                                    <div class="ba-card mt-4">
                                        <div class="ba-card-content d-flex">
                                            <!-- Hình ảnh -->
                                            <div class="ba-card-logo-wrapper mr-3">
                                                <img src="assets/images/bidv_card_image.jfif" alt="Logo"
                                                     class="img-fluid">
                                            </div>
                                            <!-- Thông tin chi tiết, gồm 3 dòng bên phải -->
                                            <div class="ba-card-info d-flex flex-column">
                                                <div class="ba-card-brief mb-2">
                                                    <div class="ba-card-name-wrapper d-flex">
                                                        <span class="ba-card-name">${payment.provider}</span>
                                                    </div>
                                                </div>
                                                <div class="ba-card-username">
                                                    <span>Họ Và Tên: ${payment.accountName}</span>
                                                </div>
                                                <div class="ba-card-branch">
                                                    <label class="ba-card-branch-label">STK:</label>
                                                    <span>${payment.accountNumber}</span>
                                                </div>
                                            </div>
                                            <div class="ba-card-buttons ml-auto">
                                                <button class="ba-btn-delete align-items-center"
                                                        onclick="confirmDelete('${payment.pmid}')">Xóa
                                                </button>
                                            </div>

                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Modal: Add Credit/Debit Card -->
                    <div class="modal fade" id="addCreditCardModal" tabindex="-1" role="dialog"
                         aria-labelledby="addCreditCardModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addCreditCardModalLabel">Thêm Thẻ Tín dụng/Ghi nợ</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="AddCreditCard" method="POST">
                                        <div class="form-group">
                                            <label for="cardNumber">Số thẻ</label>
                                            <input type="text" id="cardNumber" name="cardNumber" class="form-control"
                                                   placeholder="Nhập số thẻ" required>
                                        </div>
                                        <div class="form-row">
                                            <div class="form-group col-md-6">
                                                <label for="cardExpiryDate">Ngày hết hạn</label>
                                                <input type="date" id="cardExpiryDate" name="cardExpiryDate"
                                                       class="form-control" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="cvc">Mã CVV</label>
                                                <input type="text" id="cvc" name="cvc" class="form-control"
                                                       placeholder="CVC" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="provider">Tên ngân hàng</label>
                                                <input type="text" id="provider" name="provider" class="form-control"
                                                       placeholder="Tên ngân hàng" required>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="cardName">Họ và tên chủ thẻ</label>
                                            <input type="text" id="cardName" name="cardName" class="form-control"
                                                   placeholder="Nhập họ và tên" required>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Trở Lại
                                            </button>
                                            <button type="submit" class="btn btn-primary">Hoàn thành</button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Modal: Add Bank Account -->
                    <div class="modal fade" id="addBankAccountModal" tabindex="-1" role="dialog"
                         aria-labelledby="addBankAccountModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addBankAccountModalLabel">Thêm Tài Khoản Ngân Hàng</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="AddBank" method="POST">
                                        <div class="form-group">
                                            <label for="bankName">Tên ngân hàng</label>
                                            <select id="bankName" name="bankName" class="form-control" required>
                                                <option value="">Chọn ngân hàng</option>
                                                <option value="vietcombank">Vietcombank</option>
                                                <option value="bidv">BIDV</option>
                                                <option value="agribank">Agribank</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="accountNumber">Số tài khoản</label>
                                            <input type="text" id="accountNumber" name="accountNumber"
                                                   class="form-control" placeholder="Nhập số tài khoản" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="accountHolder">Tên đầy đủ (viết in hoa, không dấu)</label>
                                            <input type="text" id="accountHolder" name="accountHolder"
                                                   class="form-control" placeholder="Nhập tên đầy đủ" required>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="accountExpiryDate">Ngày hết hạn</label>
                                            <input type="date" id="accountExpiryDate" name="accountExpiryDate"
                                                   class="form-control" required>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Trở Lại
                                            </button>
                                            <button type="submit" class="btn btn-primary">Hoàn Thành</button>
                                        </div>
                                    </form>

                                </div>

                            </div>
                        </div>
                    </div>


                    <div id="confirmDeleteModal" class="modal">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Xác nhận xóa</h5>
                                    <button type="button" class="close" onclick="closeModal()" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có chắc chắn muốn xóa phương thức thanh toán này không?</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" id="confirmDeleteButton"
                                            onclick="proceedDelete()">Xác nhận
                                    </button>
                                    <button type="button" class="btn btn-secondary" onclick="closeModal()">Hủy</button>
                                </div>
                            </div>
                        </div>
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

<script src="assets/js/navbar.js"></script>
<%--<script src="assets/js/editprofile.js"></script>--%>
<script src="assets/js/homeuser.js"></script>
<script src="assets/js/delete-payment-method.js"></script>

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
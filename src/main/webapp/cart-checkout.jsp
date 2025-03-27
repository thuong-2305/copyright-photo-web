<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!doctype html>
<html lang="en">

<head>
    <title>Thanh toán</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="assets/css/homepage.css">
    <link rel="stylesheet" href="assets/css/navbar-footer.css">
    <link rel="stylesheet" href="assets/css/homeuser.css">
    <link rel="stylesheet" href="assets/css/checkout.css">
    <link rel="stylesheet" href="assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Thêm Flatpickr CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!-- Thêm Flatpickr JS -->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <jsp:include page="include/head.jsp"/>



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

<div id="checkout" style="padding-top:60px;">
    <div class="container-fluid">
        <div class="checkout-container">
            <div class="row checkout-content">
                <div class="col-7">
                    <div class="billing-container mt-3">
                        <div class="container p-0">
                            <div class="card shadow">
                                <div class="card-body">
                                    <!-- Radio Button chọn phương thức thanh toán -->
                                    <div class="form-group mb-4">
                                        <h3 class="mb-4">Phương thức thanh toán</h3>
                                        <div class="d-flex flex-column mb-3">
                                            <!-- Phương thức thanh toán: Thẻ đã lưu hoặc Thanh toán mới -->
                                            <div class="form-check mb-3">
                                                <input class="form-check-input" type="radio" name="payment-method"
                                                       id="saved-cards-radio" value="saved-cards" checked
                                                       onclick="togglePaymentMethod('saved-cards')">
                                                <label class="form-check-label" for="saved-cards-radio">
                                                    Sử dụng thẻ đã lưu
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="payment-method"
                                                       id="new-payment-radio" value="new-payment"
                                                       onclick="togglePaymentMethod('new-payment')">
                                                <label class="form-check-label" for="new-payment-radio">
                                                    Thanh toán bằng phương thức khác
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Phần thẻ đã lưu -->
                                    <div id="saved-cards-section" class="payment-method-content">
                                        <h4 class="mb-3">Thẻ đã lưu</h4>
                                        <div class="list-group">
                                            <c:forEach var="payment" items="${paymentMethods}">
                                                <label class="list-group-item d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <input type="radio" name="paymentMethod" value="${payment.pmid}"
                                                               class="mr-2"
                                                               onclick="document.getElementById('paymentMethodId').value = '${payment.pmid}'; document.getElementById('paymentTypeId').value = '';">
                                                        <i class="fas fa-credit-card"></i> ${payment.provider} ${payment.accountNumber}
                                                    </div>
                                                    <span class="badge badge-primary">Dùng thẻ này</span>
                                                </label>
                                            </c:forEach>
                                        </div>
                                    </div>

                                    <!-- Phần thẻ mới -->
                                    <div id="new-payment-section" class="payment-method-content d-none">
                                        <!-- Tabs -->
                                        <div class="card-header p-0">
                                            <div class="btn-group w-100" role="group">
                                                <button id="credit-card-tab" class="btn btn-light text-dark active"
                                                        onclick="showTab('credit-card')">
                                                    THẺ TÍN DỤNG/GHI NỢ
                                                </button>
                                                <button id="bank-account-tab" class="btn btn-light text-dark"
                                                        onclick="showTab('bank-account')">
                                                    TÀI KHOẢN NGÂN HÀNG
                                                </button>
                                                <button id="vnpay-tab" class="btn btn-light text-dark"
                                                        onclick="showTab('vnpay')">
                                                    VNPay
                                                </button>
                                            </div>
                                        </div>

                                        <div class="card-body">
                                            <!-- Tab: Credit Card -->
                                            <div id="credit-card" class="payment-tab" name="credit-card">
                                                <div class="alert alert-info text-center" role="alert">
                                                    <i class="fas fa-lock"></i> Mọi thông tin đều được mã hóa, bảo mật và bảo vệ toàn diện.
                                                    <a href="#">Tìm hiểu thêm</a>
                                                </div>
                                                <form id="new-card-form">
                                                    <h4 class="mb-4">Nhập thẻ mới</h4>
                                                    <div class="form-group">
                                                        <label for="card-name">Tên trên thẻ *</label>
                                                        <input type="text" class="form-control" id="card-name" placeholder="Tên trên thẻ" name="cardName">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="card-number">Số thẻ tín dụng/ghi nợ *</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="card-number" placeholder="1234 5678 9012 3456" name="cardNumber">
                                                            <div class="input-group-append">
                                                                <span class="input-group-text"><i class="fas fa-credit-card"></i></span>
                                                            </div>
                                                        </div>
                                                        <small class="text-danger d-none" id="card-number-error">Vui lòng nhập đúng số thẻ (16 chữ số).</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="card-bank">Ngân hàng *</label>
                                                        <input type="text" class="form-control" id="card-bank" placeholder="Ngân hàng phát hành thẻ" name="cardBank">
                                                    </div>
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                            <label for="card-expiry">Ngày hết hạn *</label>
                                                            <input type="text" class="form-control" id="card-expiry" placeholder="YYYY-MM-DD" name="cardExpiry">
                                                            <small class="text-danger d-none" id="card-expiry-error">Vui lòng chọn ngày hết hạn.</small>
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                            <label for="card-cvc">CVC *</label>
                                                            <div class="input-group">
                                                                <input type="text" class="form-control" id="card-cvc" placeholder="3 hoặc 4 chữ số" name="cardCVC">
                                                                <div class="input-group-append">
                                                                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                                                </div>
                                                            </div>
                                                            <small class="text-danger d-none" id="card-cvc-error">Vui lòng nhập mã CVC hợp lệ.</small>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>

                                            <!-- Tab: Bank Account -->
                                            <div id="bank-account" class="payment-tab d-none" name="bank-account">
                                                <div class="alert alert-info text-center" role="alert">
                                                    <i class="fas fa-lock"></i> Mọi thông tin đều được mã hóa, bảo mật và bảo vệ toàn diện.
                                                    <a href="#">Tìm hiểu thêm</a>
                                                </div>
                                                <form id="bank-account-form">
                                                    <h4 class="mb-4">Nhập thông tin tài khoản ngân hàng</h4>
                                                    <div class="form-group">
                                                        <label for="bank-account-holder">Chủ tài khoản *</label>
                                                        <input type="text" class="form-control" id="bank-account-holder"
                                                               placeholder="Tên chủ tài khoản" name="bankAccountHolder">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="bank-account-number">Số tài khoản ngân hàng *</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="bank-account-number"
                                                                   placeholder="1234567890" name="bankAccountNumber">
                                                            <div class="input-group-append">
                                                                <span class="input-group-text"><i class="fas fa-university"></i></span>
                                                            </div>
                                                        </div>
                                                        <small class="text-danger d-none" id="bank-account-number-error">Vui lòng nhập số tài khoản hợp lệ.</small>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="bank-name">Tên ngân hàng *</label>
                                                        <input type="text" class="form-control" id="bank-name"
                                                               placeholder="Tên ngân hàng" name="bankName">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="bank-expiry">Ngày hết hạn *</label>
                                                        <input type="text" class="form-control" id="bank-expiry"
                                                               placeholder="YYYY-MM-DD" name="bankExpiry">
                                                        <small class="text-danger d-none" id="bank-expiry-error">Vui lòng chọn ngày hết hạn.</small>
                                                    </div>
                                                </form>
                                            </div>

                                            <!-- Tab: VNPay -->
                                            <form id="vnPayOrder" action="vnpayCartOrder" method="POST">
                                                <div id="vnpay" class="payment-tab d-none text-center" name="vnpay">
                                                    <div class="alert alert-info text-center" role="alert">
                                                        <i class="fas fa-lock"></i> Mọi thông tin đều được mã hóa, bảo mật
                                                        và bảo vệ toàn diện.
                                                        <a href="#">Tìm hiểu thêm</a>
                                                    </div>
                                                    <button type="submit" class="btn btn-danger btn-lg text-light">
                                                        <i class="fas fa-credit-card"></i> Thanh toán với VNPay
                                                    </button>
                                                    <p class="mt-3">Phương thức thanh toán nhanh chóng và tiện lợi</p>
                                                </div>
                                                <input type="hidden" name="promotionId" value="${promotionId}">
                                                <input type="hidden" name="totalAfterDiscount" value="${totalAfterDiscount}">
                                                <input type="hidden" name="totalBeforeDiscount" value="${totalBeforeDiscount}">
                                                <input type="hidden" name="licenseIds" value="${licenseIds}">
                                                <input type="hidden" name="products" value="${products}">

                                                <c:forEach var="licenseId" items="${licenseIds}">
                                                    <input type="hidden" name="licenseIds" value="${licenseId}">
                                                </c:forEach>

                                                <c:forEach var="product" items="${products}">
                                                    <input type="hidden" name="productIds" value="${product.id}">
                                                    <input type="hidden" name="productNames" value="${product.name}">
                                                    <input type="hidden" name="productPrices" value="${product.price}">
                                                </c:forEach>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="order-totals">
                        <ul class="order-totals-content style-none">
                            <li>Tổng cộng</li>
                            <li class="total-amount"><fmt:formatNumber value="${totalAfterDiscount}" pattern="#,##0"/></li>
                        </ul>
                        <div class="content-license-agreement">
                            <ul class="style-none">
                                <li class="email-preference mb-3">
                                    <input class="cs-pointer" type="checkbox">
                                    <span>Có, tôi muốn nhận những thông tin mới nhất và những ưu đãi đặc biệt - tôi
                                            hiểu rằng có thể hủy thông báo bất kì lúc nào.</span>
                                </li>
                                <li id="accept-term">
                                    Bằng cách đăng ký với PocoPhoto, bạn chấp nhận các
                                    <a href=""> Thỏa thuận cấp phép</a>,
                                    <a href=""> Chính sách quyền riêng tư </a> và
                                    <a href=""> Điều khoản sử dụng</a>.
                                </li>
                            </ul>
                        </div>
                        <form id="paymentForm" action="CartOrderController" method="POST">
                            <input type="hidden" name="promotionId" value="${promotionId}">
                            <input type="hidden" name="totalAfterDiscount" value="${totalAfterDiscount}">
                            <input type="hidden" name="totalBeforeDiscount" value="${totalBeforeDiscount}">
                            <input type="hidden" name="licenseIds" value="${licenseIds}">
                            <input type="hidden" name="products" value="${products}">
                            <input type="hidden" name="numChecked" value="${numChecked}">

                            <c:forEach var="licenseId" items="${licenseIds}">
                                <input type="hidden" name="licenseIds" value="${licenseId}">
                            </c:forEach>

                            <c:forEach var="product" items="${products}">
                                <input type="hidden" name="productIds" value="${product.id}">
                                <input type="hidden" name="productNames" value="${product.name}">
                                <input type="hidden" name="productPrices" value="${product.price}">
                            </c:forEach>

                            <input type="hidden" name="pmid" id="pmid">

                            <!-- Nút thanh toán -->
                            <button type="button" class="btn btn-success mt-4 p-3 w-100 checkout-btn"
                                    onclick="submitPaymentForm()">
                                <i class="fas fa-check-circle me-2"></i>Thanh toán ngay
                            </button>
                        </form>

                        <!-- Modal Thanh toán thành công -->
                        <div class="modal fade" id="paymentSuccessModal" tabindex="-1" role="dialog"
                             aria-labelledby="paymentSuccessModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-success text-white">
                                        <h5 class="modal-title" id="paymentSuccessModalLabel">Thanh toán thành công</h5>
                                    </div>
                                    <div class="modal-body text-center">
                                        <i class="fas fa-check-circle fa-3x text-success mb-3"></i>
                                        <h4>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</h4>
                                        <p>Đơn hàng của bạn đã được thanh toán thành công. Vui lòng kiểm tra email để
                                            nhận thông tin chi tiết về đơn hàng.</p>
                                    </div>
                                    <div class="modal-footer justify-content-center">
                                        <button type="button" class="btn btn-primary" data-dismiss="modal"
                                                onclick="submitFormAfterModal()">
                                            Hoàn tất
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-5 mt-2" style="padding-top:24px;">
                    <div class="purchase-details-container">
                        <div class="purchase-details">
                            <div class="purchase-details-header d-flex mb-3">
                                <span class="heading-title mr-2">Chi tiết hóa đơn</span>
                                <span class="select-items">(${numChecked} sản phẩm)</span>
                                <a class="edit-cart txt-deco-none ml-auto" href="cart">Chỉnh sửa giỏ hàng</a>
                            </div>
                            <div class="purchase-details-body">
                                <div id="cart-summary-content" class="cart-items-container">
                                    <c:forEach var="product" items="${products}" varStatus="status">
                                        <section class="pb-4 rounded item mb-2">
                                            <figure>
                                                <img class="maxh-100 rounded" style="max-height: 100px"
                                                     src="${product.url}" alt="">
                                            </figure>
                                            <ul class="lst-property list-unstyled flex-grow-1">
                                                <li class="text-right">Ảnh: ${product.name}</li>
                                                <li class="text-right">${licenseNames[status.index]}</li>
                                                <li class="text-right">
                                                    Giá:
                                                    <c:choose>
                                                        <c:when test="${licenseIds[status.index] == 2}">
                                                            <fmt:formatNumber value="${product.price * 2}"
                                                                              pattern="#,##0"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <fmt:formatNumber value="${product.price}" pattern="#,##0"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </li>
                                            </ul>
                                        </section>
                                    </c:forEach>
                                </div>

                                <div class="payment-details mt-4">
                                    <span class="heading-payment-details">Chi tiết thanh toán</span>
                                    <div class="d-flex justify-content-between mt-3">
                                        <span>Tổng tiền hàng</span>
                                        <span><fmt:formatNumber value="${totalBeforeDiscount}" pattern="#,##0"/></span>
                                    </div>
                                    <div class="d-flex justify-content-between mt-2 pb-2"
                                         style="border-bottom: 1px solid #e3e3e3;">
                                        <span>Tổng cộng giảm giá</span>
                                        <span class="text-danger">-<fmt:formatNumber value="${discountAmount}"
                                                                                     pattern="#,##0"/></span>
                                    </div>
                                    <div class="d-flex justify-content-between mt-2">
                                        <span class="fw-bold">Tổng cộng</span>
                                        <span class="fw-bold total-amount"><fmt:formatNumber
                                                value="${totalAfterDiscount}" pattern="#,##0"/></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/homepage.js"></script>
<script src="assets/js/navbar.js"></script>
<script src="assets/js/homeuser.js"></script>
<script src="assets/js/checkout.js"></script>
<script src="assets/js/checkout-order.js"></script>

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
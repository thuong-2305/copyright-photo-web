<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.CartDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.LicenseService" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.UserService" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <title>Cart</title>
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" href="./assets/css/cart.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        #nav {
            position: relative;
        }
        .modal {
            z-index: 9999;
        }
    </style>
</head>

<body>

<jsp:include page="include/navbar.jsp"/>

<div id="cart">
    <div class="container d-flex flex-column">
        <!-- Header Cart -->
        <div class="cart-header w-100">
            <h1 class="mt-3 fw-semibold fs-2">Giỏ hàng</h1>
            <!-- Cart info -->
            <div class="cart-info mb-4">
                <div class="mt-2 d-flex justify-content-between align-items-center">
                    <div class="selected-count fw-bold">
                        <span>Số lượng sản phẩm đang chọn: <span class="badge text-bg-success ng-binding">${ numChecked }</span></span>
                    </div>
                    <div class="subtotal text-right fw-bold">
                        <!-- Hiển thị giá gốc và giá sau khi giảm -->
                        <label class="d-block">
                            <!-- Giá gốc -->
                            <span class="fw-semibold me-2" id="originalPrice">
                                <fmt:formatNumber value="${total}"/>đ
                            </span>

                            <!-- Giá sau giảm -->
                            <span class="total_final fw-semibold" id="totalFinal">
                                ${ gift }
                            </span>

                            <!-- Thông tin tổng cộng -->
                            <small class="text-danger d-block mt-1" id="gift">
                                <c:if test="${totalFinal != 0}">${totalFinal}</c:if>
                            </small>
                        </label>
                    </div>
                </div>
                <div class="continue-with-purchase text-right mt-2">
                    <a href="checkout.html" class="btn btn-success shadow-sm">Tiếp tục thanh toán</a>
                </div>
            </div>


            <!-- List control -->
            <div class="list-control">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="select-all d-flex align-items-center mr-3">
                            <input type="checkbox" class="mr-2">
                            <label class="mb-0">Chọn Tất Cả</label>
                        </div>
                    </div>
                    <div class=" continue-buy align-items-center">
                        <a href="/">Tiếp tục mua sắm</a>
                    </div>
                </div>
            </div>

        </div>
        <div id="cart-item-list">
            <% List<CartDetail> items = (List<CartDetail>) request.getAttribute("cartItems"); %>
            <% List<Product> products = (List<Product>) request.getAttribute("products"); %>
            <% for(int i = 0; i < items.size(); i++) { %>
            <div class="cart-item">
                <div class="purchaseable">
                    <div class="cart-item-container d-flex" style="margin-bottom: 15px">
                        <figure class="thumbnail d-flex justify-content-center align-items-center">
                            <img class="img-fluid" src="<%= products.get(i).getUrl() %>" alt="" style="height: 100%;">
                        </figure>
                        <div class="product flex-grow-1 mt-2 ">
                            <section class="details">
                                <dl class="mb-3">
                                    <div class="d-flex align-items-start">
                                        <dt class="font-weight-normal">Loại hình ảnh:</dt>
                                        <dd>
                                            <%
                                                CategoryService categoryService = new CategoryService();
                                                int cid = products.get(i).getCid();
                                                String name = categoryService.getById(cid).getName();
                                            %>
                                            <%= name %>
                                            <span class="separator"> | </span>
                                            <a href="">#<%= products.get(i).getId() %></a>
                                        </dd>
                                    </div>
                                    <div class="d-flex align-items-start">
                                        <dt class="font-weight-normal">Kích thước:</dt>
                                        <dd class="size-content">
                                            <ul class="style-none pl-0">
                                                <li><%= products.get(i).getDimension() %></li>
                                                <li>Kích cỡ tệp <%= products.get(i).getSize() %></li>
                                            </ul>
                                        </dd>
                                    </div>

                                    <div class="d-flex align-items-start">
                                        <dt class="font-weight-normal">Loại giấy phép:</dt>
                                        <dd>
                                            <div class="d-flex align-items-center">
                                                <%= new LicenseService().getLicenseName(items.get(i).getLicenseId()) %>
                                            </div>
                                        </dd>
                                    </div>
                                    <div class="d-flex align-items-start">
                                        <dt class="font-weight-normal">Tác giả:</dt>
                                        <dd><a href=""><%= new UserService().getFullName( products.get(i).getUid()) %></a></dd>
                                    </div>
                                </dl>
                            </section>
                        </div>
                        <div class="price">
                            <div class="select-for-checkout d-flex align-items-center" style="height: 35px;">
                                <div class="select-for-checkout-content ml-auto">
                                    <input id="selected-for-checkout"
                                           type="checkbox"
                                           class="selectBuy"
                                           data-cart-id="<%= items.get(i).getCartId() %>"
                                           data-product-id="<%= products.get(i).getId() %>"
                                            <% if(items.get(i).getChecked() == 1) { %> checked <% } %> />
                                    <label for="selected-for-checkout">Chọn</label>
                                </div>
                                <button type="submit"
                                        class="btn btn-danger deleteCart remove-from-cart" style="margin-left: 10px"
                                        data-product-id="<%= products.get(i).getId() %>">Xóa
                                </button>
                            </div>
                            <ul style="margin-top: 20px">
                                <li class="final-price fw-semibold"><fmt:formatNumber value="<%= items.get(i).getPrice() %>" />đ</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
            <div class="clear"></div>
        </div>
    </div>
</div>

<%--Notification--%>
<div class="alert alert-success d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0%"
>
    <i class="bi bi-check2-circle"></i><span></span>
</div>
<%--Notification--%>

<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/scripts.jsp"/>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/numeral.js/2.0.6/numeral.min.js"></script>

<script>
    $(document).ready(function () {
        $(".remove-from-cart").click(function () {
            let productId = $(this).data("product-id");
            let parentElement = $(this).closest(".cart-item");
            $.ajax({
                url: "deleteFromCart?pid=" + productId,
                method: "POST",
                contentType: "application/json",
                success: function (response) {
                    $(".alert-success span").text("Xóa thành công!");
                    $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                        $(this).addClass("d-none");
                    });

                    var formattedTotal = numeral(response.total).format('0,0');
                    $('#originalPrice').text(formattedTotal + 'đ');

                    parentElement.fadeOut(function () {
                        $(this).remove();
                    });

                    $("#nav .container a.cart span").text(response.cartLen);

                    $('.ng-binding').text(response.numChecked);
                },
                error: function () {
                    alert("Có lỗi xảy ra, vui lòng thử lại sau.");
                }
            });
        });
    });
</script>

<script>
    $(document).ready(function () {
        $(".selectBuy").on("change", function () {
            // Lấy trạng thái của checkbox
            let isChecked = $(this).is(":checked");

            // Lấy dữ liệu từ thuộc tính data-*
            let cartId = $(this).data("cart-id");

            let pid = $(this).data("product-id");

            // Gửi dữ liệu qua AJAX
            $.ajax({
                url: "updatePrice",
                method: "POST",
                contentType: "application/json",
                data: JSON.stringify({
                    cartId: cartId,
                    checked: isChecked,
                    pid: pid
                }),
                success: function (response) {
                    var formattedTotal = numeral(response.total).format('0,0');
                    var formattedTotalFinal = numeral(response.totalFinal).format('0,0');

                    if(response.gift !== "") {
                        $('#totalFinal').text(formattedTotalFinal + 'đ');
                        $('#gift').text(response.gift);
                        $('#originalPrice').addClass('text-decoration-line-through small')
                    } else {
                        $('#originalPrice').removeClass('text-decoration-line-through small').text(formattedTotal + 'đ');
                        $('#totalFinal').text('');
                        $('#gift').text('');
                    }

                    $('.ng-binding').text(response.numChecked);
                },
                error: function () {
                    alert("Có lỗi xảy ra, vui lòng thử lại sau.");
                }
            });
        });
    });
</script>

</body>

</html>

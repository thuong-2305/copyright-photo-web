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

<jsp:include page="include/navbar.jsp"/>

<div id="cart">
    <div class="container d-flex flex-column">
        <!-- Header Cart -->
        <div class="cart-header w-100">
            <h1 class="mt-3 fw-semibold fs-2">Giỏ hàng</h1>
            <% String noProduct = (String) session.getAttribute("noProduct");
                if (noProduct != null) { %>
            <div class="alert alert-warning"><%= noProduct %></div>
            <% session.removeAttribute("noProduct"); } %>
            <!-- Cart info -->
            <div class="cart-info mb-4">
                <div class="mt-2 d-flex justify-content-between align-items-center">
                    <div class="selected-count fw-bold">
                        <span>Số lượng sản phẩm đang chọn: <span class="badge text-bg-success ng-binding" id="numChecked">${numChecked}</span></span>
                    </div>
                    <div class="subtotal text-right fw-bold">
                        <label class="d-block">
                            <c:if test="${totalFinal > 0}">
                                <small><span class="fw-semibold me-2 text-decoration-line-through" id="originalPrice"><fmt:formatNumber value="${total}"/> đ</span></small>
                            </c:if>
                            <c:if test="${totalFinal < 1}">
                                <span class="fw-semibold me-2" id="originalPrice"><fmt:formatNumber value="${total}"/> đ</span>
                            </c:if>
                                <span class="total_final fw-semibold" id="totalFinal">
                                <c:if test="${totalFinal > 0}">
                                    <fmt:formatNumber value="${totalFinal}" pattern="#,### đ" />
                                </c:if>
                            </span>
                            <small class="text-danger d-block mt-1" id="gift">
                                ${gift}
                            </small>
                        </label>
                    </div>
                </div>

                <!-- Các trường ẩn sẽ được dùng để lưu trữ các giá trị cần thiết -->
                <input type="hidden" id="hiddenNumChecked" name="numChecked" value="${numChecked}">
                <input type="hidden" id="hiddenTotal" name="total" value="${total}">
                <input type="hidden" id="hiddenGift" name="gift" value="${gift}">
                <input type="hidden" id="hiddenTotalFinal" name="totalFinal" value="${totalFinal}">


                <div class="continue-with-purchase text-right mt-2">
                    <button class="btn btn-success shadow-sm" id="checkoutButton">Tiếp tục thanh toán</button>
                </div>
            </div>
        </div>
        <div id="cart-item-list">
            <% List<CartDetail> items = (List<CartDetail>) request.getAttribute("cartItems"); %>
            <% List<Product> products = (List<Product>) request.getAttribute("products"); %>
            <% for (int i = items.size() - 1; i >= 0; i--) { %>
            <div class="cart-item" data-item-index="<%= i %>" style="cursor:pointer;">
                <div class="purchaseable">
                    <div class="cart-item-container d-flex" style="margin-bottom: 15px;">
                        <figure class="thumbnail d-flex justify-content-center align-items-center">
                            <img class="img-fluid" src="<%= products.get(i).getUrl() %>" alt="" style="height: 100%;">
                        </figure>
                        <div class="product flex-grow-1 mt-2">
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
                                                <li>Kích cỡ tệp: <%= products.get(i).getSize() %></li>
                                            </ul>
                                        </dd>
                                    </div>
                                    <div class="d-flex align-items-start">
                                        <dt class="font-weight-normal">Loại giấy phép:</dt>
                                        <dd>
                                            <div class="license-field d-flex align-items-center">
                                                <%= new LicenseService().getLicenseName(items.get(i).getLicenseId()) %>
                                            </div>
                                        </dd>
                                    </div>
                                    <div class="d-flex align-items-start">
                                        <dt class="font-weight-normal">Tác giả:</dt>
                                        <dd>
                                            <a href=""><%= new UserService().getFullName(products.get(i).getUid()) %></a>
                                        </dd>
                                    </div>
                                </dl>
                            </section>
                        </div>
                        <div class="price">
                            <div class="select-for-checkout d-flex align-items-center" style="height: 35px;">
                                <div class="select-for-checkout-content ml-auto">
                                    <input id="selected-for-checkout-<%= i %>"
                                           type="checkbox"
                                           class="selectBuy"
                                           data-cart-id="<%= items.get(i).getCartId() %>"
                                           data-product-id="<%= products.get(i).getId() %>"
                                           data-license-id="<%= items.get(i).getLicenseId() %>"
                                            <% if (items.get(i).getChecked() == 1) { %> checked <% } %> />
                                    <label for="selected-for-checkout-<%= i %>">Chọn</label>
                                </div>
                                <button type="submit"
                                        class="btn btn-danger deleteCart remove-from-cart"
                                        style="margin-left: 10px;"
                                        data-product-id="<%= products.get(i).getId() %>">Xóa</button>
                            </div>
                            <ul style="margin-top: 20px;">
                                <li class="final-price fw-semibold">
                                    <fmt:formatNumber value="<%= items.get(i).getPrice() %>" />đ
                                </li>
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
    document.addEventListener('DOMContentLoaded', () => {
        const cartItems = document.querySelectorAll('.cart-item');
        cartItems.forEach(item => {
            item.addEventListener('click', event => {
                if (event.target.tagName === 'INPUT' || event.target.tagName === 'BUTTON') return;

                const checkbox = item.querySelector('.selectBuy');
                if (checkbox) {
                    checkbox.checked = !checkbox.checked;
                    $(checkbox).trigger('change');
                }
            });
        });
    });
</script>

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
            let isChecked = $(this).is(":checked");
            let cartId = $(this).data("cart-id");
            let pid = $(this).data("product-id");

            // Gửi dữ liệu qua AJAX để cập nhật giá trị
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

                    // Cập nhật các phần tử UI
                    $('#originalPrice').text(formattedTotal + ' đ');
                    if(response.gift !== "") {
                        $('#totalFinal').text(formattedTotalFinal + ' đ');
                        $('#gift').text(response.gift);
                        $('#originalPrice').addClass('text-decoration-line-through small');
                    } else {
                        $('#originalPrice').removeClass('text-decoration-line-through small').text(formattedTotal + ' đ');
                        $('#totalFinal').text('');
                        $('#gift').text('');
                    }

                    // Cập nhật số lượng sản phẩm đã chọn
                    $('.ng-binding').text(response.numChecked);

                    // Cập nhật các trường ẩn
                    $('#hiddenNumChecked').val(response.numChecked);
                    $('#hiddenTotal').val(response.total);
                    $('#hiddenTotalFinal').val(response.totalFinal);

                },
                error: function () {
                    alert("Có lỗi xảy ra, vui lòng thử lại sau.");
                }
            });
        });
    });

</script>


<script src="assets/js/redirect-cart-to-checkout.js"></script>


</body>

</html>

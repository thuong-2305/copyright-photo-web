<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.CartDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.CategoryService" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.LisenseService" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.service.UserService" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
                        <span>Số lượng sản phẩm đang chọn: <span class="ng-binding">0</span></span>
                    </div>
                    <div class="subtotal text-right fw-bold">
                        <!-- Hiển thị giá gốc và giá sau khi giảm -->
                        <label class="d-block">
                            <!-- Giá gốc -->
                            <span class="text-decoration-line-through me-2"><fmt:formatNumber value="${total}"/>đ</span>

                            <!-- Giá sau giảm -->
                            <span>1.350.000đ</span>

                            <!-- Thông tin tổng cộng -->
                            <small class="text-danger d-block mt-1">
                                (Giảm giá: 150.000đ)
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
                    <div class="cart-item-container d-flex">
                        <figure class="thumbnail">
                            <a href="">
                                <div class="asset-wrapper">
                                    <img class="img-fluid" src="<%= products.get(i).getUrl() %>" alt="">
                                </div>
                            </a>
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
                                                <%= new LisenseService().getLisenseName(items.get(i).getLisenseId()) %>
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
                            <div class="select-for-checkout d-flex">
                                <div class="select-for-checkout-content ml-auto">
                                    <input id="selected-for-checkout" type="checkbox">
                                    <label for="selected-for-checkout">Chọn</label>
                                </div>
                            </div>
                            <ul>
                                <li class="final-price"><fmt:formatNumber value="<%= products.get(i).getPrice() %>" />đ</li>
                                <a href="" class="remove-from-cart" data-testid="remove-from-cart"
                                   gi-track="removeFromCart"
                                   ng-click="removeFromCart($index)" title="Remove from cart">Xóa</a>
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
</body>

</html>

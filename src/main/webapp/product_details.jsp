<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Product Detail</title>
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" href="./assets/css/product-details.css">
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<!--search -->
<section class="search" style="margin-top: 80px;">
    <div class="search-container">
        <div class="dropdown">
            <button class="text-secondary" id="type-search"><i class="fa-solid fa-image px-2"></i><span>Tất cả
                        ảnh</span><i class="fa-solid fa-caret-down px-2"></i></button>
            <div class="dropdown-content">
                <a href="#" class="active" data-icon="fa-image"><i class="fa-solid fa-image pe-3"></i>Tất cả
                    ảnh</a>
                <a href="#" data-icon="fa-camera"><i class="fa-solid fa-camera px-3"></i>Ảnh chụp</a>
                <a href="#" data-icon="fa-vector-square"><i class="fa-solid fa-vector-square px-3"></i>Vectors</a>
                <a href="#" data-icon="fa-pen-fancy"><i class="fa-solid fa-pen-fancy px-3"></i>AI</a>
            </div>
        </div>
        <div class="search-bar">
            <input type="text" id="search-input" placeholder="Tìm kiếm tất cả nguồn">
            <span class="clear-btn">&#10005;</span>
        </div>
        <button class="search-button"><i class="fa-solid fa-magnifying-glass"></i><span class="ps-2">Tìm
                    kiếm</span></button>
    </div>
</section>
<!--search -->

<!-- Modal enlarge image -->
<div id="modal-image">
    <div class="modal-container">
        <button class="btn-close"><i class="fa-solid fa-xmark"></i></button>
        <div class="image-container">
            <img src="${ product.getUrl() }" alt="" class="overlay-img">
        </div>
    </div>
</div>
<!-- Begin: Product detail -->
<div class="product-container">
    <div>
        <h1 class="product-name">${ product.getName() }</h1>
        <p class="product-desc">${ product.getDescription() }</p>
    </div>
    <div class="row">
        <div class="product-left col col-half">
            <div class="product">
                <div class="div-img">
                    <img src="${ product.getUrl() }" alt="" class="product-img">
                    <button class="btn-enlarge">Phóng to<i class="fa-solid fa-search-plus"></i></button>
                </div>
                <div class="product-nav">
                    <ul class="product-button">
                        <li class="btn-left">
                            <button class="btn-preview">Xem trước<i
                                    class="fa-solid fa-download"></i></button>
                        </li>
                        <li class="btn-left">
                            <button class="btn-save">Lưu<i
                                    class="fa-solid fa-floppy-disk"></i></button>
                        </li>
                        <li class="btn-left">
                            <button class="btn-share">Chia sẻ<i
                                    class="fa-solid fa-share"></i></button>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="product-details mt-16">
                <h2>Chi tiết ảnh</h2>
                <div class="row">
                    <div class="col col-full">
                        <ul>
                            <li>
                                <strong>ID - Hình ảnh: </strong>
                                <p>#${ product.getId() }</p>
                            </li>
                            <li>
                                <strong>Ngươi đăng ảnh: </strong>
                                <p>${ product.getUid() }</p>
                            </li>
                            <li>
                                <strong>Kích thước tập tin: </strong>
                                <p>${ product.getSize() }</p>
                            </li>
                            <li>
                                <strong>Kích thước ảnh: </strong>
                                <p>${ product.getDimension() }</p>
                            </li>
                            <li>
                                <strong>Ngày đăng ảnh: </strong>
                                <p>${ product.getDateUpload() }</p>
                            </li>
                    </div>
                </div>

                </ul>
            </div>
        </div>

            <div class="product-right col col-half">
                <h2 class="liscense mt-8 mb-4">1. Chọn giấy phép của bạn <a href="basic.html"><i
                        class="fa-solid fa-circle-info"></i></a></h2>
                <ul class="product-conditions mt-8">
                    <li class="condition">
                        <div>
                            <div>
                                    <span>
                                        <input type="radio" name="condition" id="condition1" value="standard" checked>
                                    </span>
                            </div>
                            <div>
                                <label for="condition1">Giấy phép tiêu chuẩn</label>
                                <p>Sử dụng không giới hạn trong in ấn, quảng cáo và đóng gói. Phân phối web không giới
                                    hạn.</p>
                            </div>
                        </div>
                    </li>
                    <li class="condition">
                        <div>
                            <div>
                                    <span>
                                        <input type="radio" name="condition" id="condition2" value="advance">
                                    </span>
                            </div>
                            <div>
                                <label for="condition2">Giấy phép nâng cao</label>
                                <p>Sử dụng không giới hạn trong in ấn, quảng cáo, đóng gói và trưng bày hàng hóa. Phân
                                    phối web không giới hạn.</p>
                            </div>
                        </div>
                    </li>
                </ul>

            <div class="promotion">
                <div class="title">
                    <p>2. </p>
                    <p>Hãy thêm ảnh vào giỏ hàng để nhận ưu đãi. Khi bạn chọn mua nhiều hình ảnh trong giỏ hàng để thanh
                        toán chúng tôi sẽ giảm giá cho bạn. </p>
                </div>
                <div class="grid-btn">
                    <button class="btn--packageimg active" data-label="Hình ảnh đơn" data-discount="1">
                        <span>Hình ảnh đơn</span><span></span>
                    </button>
                    <button class="btn--packageimg " data-label="Gói 5" data-discount="0.9">
                        <span>Mua >= 5 ảnh</span><span style="color: green; font-size: 12px;">(-10%)</span>
                    </button>
                    <button class="btn--packageimg " data-label="Gói 10" data-discount="0.8">
                        <span>Mua >= 10 ảnh</span><span style="color: green; font-size: 12px;">(-20%)</span>
                    </button>
                    <button class="btn--packageimg " data-label="Gói 25" data-discount="0.7">
                        <span>Mua >= 25 ảnh</span><span style="color: green; font-size: 12px;">(-30%)</span>
                    </button>
                </div>
            </div>
            <div class="product-price mt-16">
                <p><fmt:formatNumber value="${ product.getPrice() }"/> VND</p>
            </div>
            <button onclick="redirectToCheckout()" class="btn-right btn-buy mt-16">Mua ngay</button>
            <button onclick="window.location.href='cart.html'" class="btn-right btn-add-cart mt-16">Thêm
                vào giỏ hàng
            </button>
        </div>
    </div>
</div>
<!-- End: Product detail -->
<!-- Tag -->
<div class="tag-container">
    <div class="container-title">
        <p>Tags</p>
    </div>
    <div class="tag-image">
        <a class="tag" href="#">
            <i class="fa fa-search"></i>
            <div>Mèo</div>
        </a>
        <a class="tag" href="#">
            <i class="fa fa-search"></i>
            <div>Mèo nheo mắt</div>
        </a>
        <a class="tag" href="#">
            <i class="fa fa-search"></i>
            <div>Mèo cute</div>
        </a>
        <a class="tag" href="#">
            <i class="fa fa-search"></i>
            <div>Mèo xinh</div>
        </a>
        <a class="tag" href="#">
            <i class="fa fa-search"></i>
            <div>Mèo đáng yêu</div>
        </a>
    </div>
</div>
<!-- Begin: Categories image -->
<% List<Product> products = (List<Product>) request.getAttribute("products"); %>
<%--<c:if test="${ products.size() > 9}">--%>
<div class="categories-container">
    <div class="container-title">
        <p>Hình ảnh tương tự</p>
        <p><a href="products?cid=${ product.getCid() }">Xem tất cả</a></p>
    </div>
    <div class="categories-image">
        <%
            for(int i = 0; i < 5; i++) {
                Product item = products.get(i);
        %>
        <a href="product-detail?pid=<%= item.getId() %>">
            <div class="image">
                <img src="<%= item.getUrl() %>" alt=""/>
                <div class="btn-in-image">
                    <button><i class="fa-regular fa-heart"></i></button>
                    <button><i class="fa-solid fa-cart-plus"></i></button>
                </div>
            </div>
        </a>
        <% } %>
    </div>
    <div class="categories-image">
        <%
            for(int i = 5; i < 10; i++) {
                Product item = products.get(i);
        %>
        <a href="product-detail?pid=<%= item.getId() %>">
            <div class="image">
                <img src="<%= item.getUrl() %>" alt=""/>
                <div class="btn-in-image">
                    <button><i class="fa-regular fa-heart"></i></button>
                    <button><i class="fa-solid fa-cart-plus"></i></button>
                </div>
            </div>
        </a>
        <% } %>
    </div>
</div>
<%--</c:if>--%>
<!-- End: Categories image -->
<script src="assets/js/redirect-to-checkout-on-product-detail.js"></script>


<jsp:include page="include/footer.jsp"/>

<jsp:include page="include/scripts.jsp"/>

</body>

</html>

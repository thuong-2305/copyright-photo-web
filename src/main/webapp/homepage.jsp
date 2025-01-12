<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to CoriPhoto</title>
    <jsp:include page="include/head.jsp"/>
</head>
<body>
<jsp:include page="include/navbar.jsp"/>
<!--section banner -->
<section class="banner">
    <div class="banner-home d-flex justify-content-center align-items-center flex-column">
        <div class="main-title d-flex justify-content-center flex-column align-items-center">
            <h1 class="fw-900 m-2">CoRiPhoTo</h1>
            <p>Thêm điều kỳ diệu vào câu chuyện của bạn với hơn 1 ngàn ảnh, vectơ
                , hình minh họa và hình ảnh biên tập.</p>
        </div>
        <div class="search-container">
            <div class="dropdown">
                <button class="fw-medium" id="type-search">
                    <i class="fa-solid fa-image px-2"></i>
                    <span>Tất cả ảnh</span>
                    <i class="fa-solid fa-caret-down px-2"></i>
                </button>
                <div class="dropdown-content">
                    <a href="#" class="active" data-icon="fa-image"><i class="fa-solid fa-image pe-3"></i>Tất cả ảnh</a>
                    <a href="#" data-icon="fa-camera"><i class="fa-solid fa-camera px-3"></i>Ảnh chụp</a>
                    <a href="#" data-icon="fa-vector-square"><i class="fa-solid fa-vector-square px-3"></i>Vectors</a>
                    <a href="#" data-icon="fa-pen-fancy"><i class="fa-solid fa-pen-fancy px-3"></i>AI</a>
                </div>
            </div>
            <div class="search-bar">
                <input type="text" id="search-input" placeholder="Tìm kiếm tất cả ảnh">
                <span class="clear-btn">&#10005;</span>
            </div>
            <button class="search-button"><i class="fa-solid fa-magnifying-glass"></i><span class="ps-2 fw-bold">Tìm kiếm</span></button>
        </div>
    </div>
</section>
<!--section banner -->

<!--section type-images -->
<section class="type-images">
    <div class="container d-flex justify-content-between detail">
        <jsp:useBean id="categoriesParent" scope="request" type="java.util.List"/>
        <c:forEach var="item" items="${ categoriesParent }">
        <a href="pages/type-images.html" class="text-decoration-none text-dark">
            <div class="category-item">
                <img src="assets/images/TypeImages/${ item.getName() }.jpg" alt="">
                <p>${ item.getName() }</p>
            </div>
        </a>
        </c:forEach>
    </div>
</section>
<!--section type-images -->

<!--section category -->
<section class="category-home">
    <div class="container title align-items-center">
        <p>Các danh mục phổ biến</p>
        <a href="pages/category-details.html" class="btn btn-outline-success rounded-pill fs-5">Xem nhiều hơn</a>
    </div>

    <!-- photos -->
    <div class="swiper-container category-home">
        <div class="swiper-wrapper container photos">
            <jsp:useBean id="trendsCategories" scope="request" type="java.util.List"/>
            <c:forEach var="item" items="${ trendsCategories }">
            <div class="swiper-slide">
                <a href="products?cid=${ item.getCid() }">
                    <div class="category">
                        <img src="${ item.getUrl() }" alt="">
                        <span>${ item.getName() }</span>
                    </div>
                </a>
            </div>
            </c:forEach>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>
    <a href="pages/category-details.html" class="btn btn-outline-success rounded-pill fs-5 d-none see-more">Xem nhiều hơn</a>
</section>
<!--section category -->

<!-- section raw images -->
<section class="container raw-images">
    <div class="heading mb-2">
        <h3>Những gì đang có <span>xu hướng</span> trong tuần</h3>
        <div class="button-container">
            <button class="custom-button"><i class="fa fa-search"></i> Tự nhiên</button>
            <button class="custom-button"><i class="fa fa-search"></i> Athlete</button>
            <button class="custom-button"><i class="fa fa-search"></i> Gia đình</button>
            <button class="custom-button"><i class="fa fa-search"></i> Thác nước</button>
            <button class="custom-button"><i class="fa fa-search"></i> Sự sống</button>
            <button class="custom-button"><i class="fa fa-search"></i> Portrait</button>
            <button class="custom-button"><i class="fa fa-search"></i> Thành phố</button>
            <button class="custom-button"><i class="fa fa-search"></i> Du lịch</button>
        </div>
    </div>
    <div class="new-events mt-5">
        <div class="box">
            <% List<TrendProducts> trendsProducts = (List<TrendProducts>) request.getAttribute("trendsProducts"); %>
            <div class="dream">
                <%
                    for (int i = 0; i < 5; i++) {
                        TrendProducts product = trendsProducts.get(i);
                %>
                <a href="product-detail?pid=<%= product.getId() %>">
                    <div class="pic">
                        <img src="<%= product.getUrl() %>" alt="">
                        <div class="hover-options">
                            <button class="option-button"><i class="fa-regular fa-heart"></i></button>
                            <button class="option-button"><i class="fa-solid fa-down-long"></i></button>
                            <button class="option-button addCart" data-product-id=<%= product.getId() %>><i class="fa-solid fa-cart-shopping"></i></button>
                        </div>
                        <div class="image-text">
                            <p><%= product.getName() %></p>
                        </div>
                    </div>
                </a>
                <% } %>
            </div>

            <div class="dream">
                <%
                    for (int i = 5; i < 10; i++) {
                        TrendProducts product = trendsProducts.get(i);
                %>
                <a href="product-detail?pid=<%= product.getId() %>">
                    <div class="pic">
                        <img src="<%= product.getUrl() %>">
                        <div class="hover-options">
                            <button class="option-button"><i class="fa-regular fa-heart"></i></button>
                            <button class="option-button"><i class="fa-solid fa-down-long"></i></button>
                            <button class="option-button addCart" data-product-id=<%= product.getId() %>><i class="fa-solid fa-cart-shopping"></i></button>
                        </div>
                        <div class="image-text">
                            <p><%= product.getName() %></p>
                        </div>
                    </div>
                </a>
                <% } %>
            </div>

            <div class="dream">
                <%
                    for (int i = 10; i < 15; i++) {
                        TrendProducts product = trendsProducts.get(i);
                %>
                <a href="product-detail?pid=<%= product.getId() %>">
                    <div class="pic">
                        <img src="<%= product.getUrl() %>">
                        <div class="hover-options">
                            <button class="option-button"><i class="fa-regular fa-heart"></i></button>
                            <button class="option-button"><i class="fa-solid fa-down-long"></i></button>
                            <button class="option-button addCart" data-product-id=<%= product.getId() %>><i class="fa-solid fa-cart-shopping"></i></button>
                        </div>
                        <div class="image-text">
                            <p><%= product.getName() %></p>
                        </div>
                    </div>
                </a>
                <% } %>
            </div>
        </div>
    </div>
    <div class="see-more">
        <button class="see-more-button">
            <a href="#" class="text-success text-decoration-none">Xem nhiều hơn</a>
        </button>
    </div>
    </div>
</section>

<%-- notification --%>
<div class="alert alert-primary d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0%"
>
    <i class="bi bi-exclamation-triangle"></i><span></span>
</div>
<div class="alert alert-success d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0%"
>
    <i class="bi bi-check2-circle"></i><span></span>
</div>
<%-- notification --%>

<!-- section raw images -->

<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/scripts.jsp"/>

<script>
    $(document).ready(function () {
        $(".addCart").click(function (event) {
            let productId = $(this).data("product-id");
            event.preventDefault();
            $.ajax({
                url: "addToCart?pid=" + productId,
                method: "POST",
                contentType: "application/json",
                success: function (response) {
                    if (response.addSuccess) {
                        $(".alert-success span").text("Thêm thành công!");
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                            $(this).addClass("d-none");
                        });
                        $("#nav .container a.cart span").text(response.cartLen);
                    } else {
                        $(".alert-primary span").text("Sản phẩm đã có trong giỏ hàng!");
                        $(".alert-primary").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                            $(this).addClass("d-none");
                        });
                    }
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
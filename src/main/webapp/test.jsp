<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.TrendProducts" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to CoriPhoto</title>
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" href="./assets/css/categories-list-home.css">
</head>
<body>
<!-- Day la file test.html -->
<jsp:include page="include/navbar.jsp"/>

<% if (request.getAttribute("noProduct") != null) { %>
<div class="alert alert-danger">
    <%= request.getAttribute("noProduct") %>
</div>
<% } %>

<!--section banner -->
<section class="banner">
    <div class="banner-home d-flex justify-content-center align-items-center flex-column">
        <video autoplay muted loop class="background-video">
            <source src="./assets/audio/video-banner.mp4" type="video/mp4">
        </video>
        <!-- Fallback image for mobile -->
        <img src="./assets/images/banner-category.jpg"
             alt="Banner"
             class="background-video-fallback d-none"
             style="display: none;">

        <div class="overlay-banner"></div>
        <div class="main-title d-flex justify-content-center flex-column align-items-center">
            <h1 class="fw-900 m-2">CoRiPhoTo, Kho ảnh bản quyền đẹp dành cho bạn</h1>
            <p style="color: #ceced2">Thêm điều kỳ diệu vào câu chuyện của bạn với hơn 1 ngàn ảnh, vector
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
                <label for="search-input"></label>
                <input type="text" id="search-input" placeholder="Tìm kiếm tất cả ảnh">
                <span class="clear-btn">&#10005;</span>
            </div>
            <button class="search-button" onclick="submitSearch()"><i class="fa-solid fa-magnifying-glass"></i><span class="ps-2 fw-bold">Tìm kiếm</span></button>
        </div>
    </div>
</section>
<!--section banner -->

<!--section type-images -->
<section class="type-images">
    <div class="container d-flex justify-content-between detail">
        <jsp:useBean id="categoriesParent" scope="request" type="java.util.List"/>
        <c:forEach var="item" items="${ categoriesParent }">
            <a href="type-images" class="text-decoration-none text-dark">
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
    <div class="container title align-items-center section-title" style="margin: 0 auto; padding: 0 15px">
        <p><span><i class="fas fa-fire-alt halim-trending-icon"></i> Danh mục thịnh hành</span></p>
    </div>
    <div class="halim-trending-slider">
        <div class="halim-trending-container">
            <div class="halim-trending-track"
                 style="transform: translateZ(0px); backface-visibility: hidden; scroll-behavior: smooth;">
                <jsp:useBean id="trendsCategories" scope="request" type="java.util.List" />
                <c:forEach var="item" items="${trendsCategories}" varStatus="status">
                    <c:set var="clipClass" value="${(status.index % 2 == 0) ? 'halim-trending-clip-path-even' : 'halim-trending-clip-path-odd'}" />
                    <div class="halim-trending-card">
                        <a href="products?cid=${item.getCid()}" class="halim-trending-link">
                            <div class="halim-trending-poster-container ${clipClass}">
                                <div class="halim-trending-poster-mask ${clipClass}"></div>
                                <img src="${item.getUrl()}" alt="${item.getName()}" class="halim-trending-poster-image">
                            </div>
                            <div class="halim-trending-info">
                                <div class="halim-trending-number">${status.index + 1}</div>
                                <div class="halim-trending-details">
                                    <h3 class="halim-trending-title-text text-black">${item.getName()}</h3>
                                    <p class="halim-trending-original-title">${item.getName()}</p>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <a href="categories" class="btn btn-outline-success rounded-pill fs-5 d-none see-more">Xem nhiều hơn</a>
</section>


<!--section category -->

<!-- section raw images -->
<section class="container raw-images">
    <div class="heading mb-2">
        <h3>Những gì đang có <span>xu hướng</span> trong tuần</h3>
    </div>
    <div class="new-events mt-5">
        <div class="box">
            <%
                @SuppressWarnings("unchecked")
                List<TrendProducts> trendsProducts = (List<TrendProducts>) request.getAttribute("trendsProducts");
            %>
            <div class="dream">
                <%
                    for (int i = 0; i < 5; i++) {
                        TrendProducts product = trendsProducts.get(i);
                %>
                <a href="product-detail?pid=<%= product.getId() %>">
                    <div class="pic">
                        <img src="${pageContext.request.contextPath}/watermarkedImage?url=<%= product.getUrl() %>" alt="<%= product.getName() %>">                        <div class="hover-options">
                            <button class="favorite-btn option-button" data-product-id="<%= product.getId() %>">
                                <i class="fa-regular fa-heart"></i>
                                <span class="text-click-hover">Thích</span>
                            </button>
                            <button class="option-button">
                                <i class="fa-solid fa-down-long"></i>
                                <span class="text-click-hover">Tải về</span>
                            </button>
                            <button class="option-button addCart" data-product-id=<%= product.getId() %>>
                                <i class="fa-solid fa-cart-shopping"></i>
                                <span class="text-click-hover">Thêm giỏ hàng</span>
                            </button>
                        </div>
<%--                        <div class="image-text">--%>
<%--                            <p><%= product.getName() %></p>--%>
<%--                        </div>--%>
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
                        <img src="${pageContext.request.contextPath}/watermarkedImage?url=<%= product.getUrl() %>" alt="<%= product.getName() %>">                        <div class="hover-options">
                            <button class="favorite-btn option-button" data-product-id="<%= product.getId() %>">
                                <i class="fa-regular fa-heart"></i>
                                <span class="text-click-hover">Thích</span>
                            </button>
                            <button class="option-button">
                                <i class="fa-solid fa-down-long"></i>
                                <span class="text-click-hover">Tải về</span>
                            </button>
                            <button class="option-button addCart" data-product-id=<%= product.getId() %>>
                                <i class="fa-solid fa-cart-shopping"></i>
                                <span class="text-click-hover">Thêm giỏ hàng</span>
                            </button>
                        </div>
<%--                        <div class="image-text">--%>
<%--                            <p><%= product.getName() %></p>--%>
<%--                        </div>--%>
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
                        <img src="${pageContext.request.contextPath}/watermarkedImage?url=<%= product.getUrl() %>" alt="<%= product.getName() %>">                        <div class="hover-options">
                            <button class="favorite-btn option-button" data-product-id="<%= product.getId() %>">
                                <i class="fa-regular fa-heart"></i>
                                <span class="text-click-hover">Thích</span>
                            </button>
                            <button class="option-button">
                                <i class="fa-solid fa-down-long"></i>
                                <span class="text-click-hover">Tải về</span>
                            </button>
                            <button class="option-button addCart" data-product-id=<%= product.getId() %>>
                                <i class="fa-solid fa-cart-shopping"></i>
                                <span class="text-click-hover">Thêm giỏ hàng</span>
                            </button>
                        </div>
<%--                        <div class="image-text">--%>
<%--                            <p><%= product.getName() %></p>--%>
<%--                        </div>--%>
                    </div>
                </a>
                <% } %>
            </div>

            <div class="dream">
                <%
                    for (int i = 15; i < 20; i++) {
                        TrendProducts product = trendsProducts.get(i);
                %>
                <a href="product-detail?pid=<%= product.getId() %>">
                    <div class="pic">
                        <img src="${pageContext.request.contextPath}/watermarkedImage?url=<%= product.getUrl() %>" alt="<%= product.getName() %>">                        <div class="hover-options">
                            <button class="favorite-btn option-button" data-product-id="<%= product.getId() %>">
                                <i class="fa-regular fa-heart"></i>
                                <span class="text-click-hover">Thích</span>
                            </button>
                            <button class="option-button">
                                <i class="fa-solid fa-down-long"></i>
                                <span class="text-click-hover">Tải về</span>
                            </button>
                            <button class="option-button addCart" data-product-id=<%= product.getId() %>>
                                <i class="fa-solid fa-cart-shopping"></i>
                                <span class="text-click-hover">Thêm giỏ hàng</span>
                            </button>
                        </div>
<%--                        <div class="image-text">--%>
<%--                            <p><%= product.getName() %></p>--%>
<%--                        </div>--%>
                    </div>
                </a>
                <% } %>
            </div>
        </div>
    </div>
    <div class="fade-out">
        <div class="see-more">
            <button class="see-more-button">
                <a href="categories" class="text-decoration-none fw-semibold">Xem nhiều hơn</a>
            </button>
        </div>
    </div>
</section>
<!-- section raw images -->

<%-- text final --%>
<div class="info-box">
    <div class="icon">
        <i class="fa fa-heart-circle-check"></i>
    </div>
    <div class="content">
        <h3>Bản quyền hình ảnh an toàn và hợp pháp</h3>
        <p>
            Chúng tôi cung cấp kho ảnh chất lượng cao với bản quyền đầy đủ, giúp bạn sử dụng cho các dự án cá nhân hoặc thương mại một cách an toàn.
            Tất cả các hình ảnh đều được cấp phép, đảm bảo tính pháp lý và không cần lo lắng về vi phạm bản quyền.
        </p>
        <a href="/license" class="learn-more">Xem nhiều hơn về chính sách của chúng tôi</a>
    </div>
</div>
<%-- text final --%>


<%-- notification --%>
<div class="alert alert-primary d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0"
>
    <i class="bi bi-exclamation-triangle me-2"></i><span></span>
</div>
<div class="alert alert-success d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0"
>
    <i class="bi bi-check2-circle me-2"></i><span></span>
</div>

<c:if test="${ notification != null }">
    <div id="alertMessage" class="alert alert-danger align-items-center position-fixed"
         role="alert"
         style="display: none; width: 25%; top: 15%; right: 0;">
        <i class="bi bi-exclamation-triangle me-2"></i>
        <span>${ notification }</span>
    </div>
</c:if>
<%-- notification --%>

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
    document.addEventListener("DOMContentLoaded", function () {
        const alertMessage = document.getElementById("alertMessage");
        if (alertMessage) {
            alertMessage.style.display = "block";
            setTimeout(() => {
                alertMessage.style.display = "none";
            }, 2000);
        }
    });
</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const favoriteButtons = document.querySelectorAll('.favorite-btn');

        favoriteButtons.forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault();

                const productId = this.getAttribute('data-product-id');
                // Kiểm tra nếu productId bị rỗng
                if (!productId || productId === '') {
                    alert("Không thể thêm vào danh sách yêu thích. ID sản phẩm không hợp lệ." + productId);
                    return;
                }

                // Gửi yêu cầu AJAX đến Servlet
                fetch('AddFavourite', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: `action=add&productId=`+productId
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            this.querySelector('i').classList.remove('fa-regular');
                            this.querySelector('i').classList.add('fa-solid');
                            $(".alert-success span").text(data.message);
                            $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                                $(this).addClass("d-none");
                            });
                        } else {
                            $(".alert-success span").text(data.message);
                            $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                                $(this).addClass("d-none");
                            });
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('Có lỗi xảy ra khi thêm vào danh sách yêu thích.');
                    });
            });
        });
    });
</script>
</body>
</html>
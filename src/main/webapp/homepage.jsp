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
            <a href="pages/type-images.html" class="text-decoration-none text-dark">
                <div class="category-item">
                    <img src="assets/images/Photos/children/4.jpg" alt="">
                    <p>Ảnh chụp</p>
                </div>
            </a>
            <a href="pages/type-images.html" class="text-decoration-none text-dark">
                <div class="category-item">
                    <img src="assets/images/vector/bg/3.avif" alt="">
                    <p>Ảnh Vector</p>
                </div>
            </a>
            <a href="pages/type-images.html" class="text-decoration-none text-dark">
                <div class="category-item">
                    <img src="assets/images/ai/Animal/023.jpg" alt="">
                    <p>Ảnh AI</p>
                </div>
            </a>
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
                    <a href="pages/products.html">
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
                    <div class="pic">
                        <img src="<%= product.getUrl() %>" alt="">
                        <div class="hover-options">
                            <button class="option-button"><i class="fa-regular fa-heart"></i></button>
                            <button class="option-button"><i class="fa-solid fa-down-long"></i></button>
                            <button class="option-button"><i class="fa-solid fa-cart-shopping"></i></button>
                        </div>
                        <div class="image-text">
                            <p><%= product.getName() %></p>
                        </div>
                    </div>
                    <% } %>
                </div>

                <div class="dream">
                    <%
                        for (int i = 5; i < 10; i++) {
                            TrendProducts product = trendsProducts.get(i);
                    %>
                    <div class="pic">
                        <img src="<%= product.getUrl() %>">
                        <div class="hover-options">
                            <button class="option-button"><i class="fa-regular fa-heart"></i></button>
                            <button class="option-button"><i class="fa-solid fa-down-long"></i></button>
                            <button class="option-button"><i class="fa-solid fa-cart-shopping"></i></button>
                        </div>
                        <div class="image-text">
                            <p><%= product.getName() %></p>
                        </div>
                    </div>
                    <% } %>
                </div>

                <div class="dream">
                    <%
                        for (int i = 10; i < 15; i++) {
                            TrendProducts product = trendsProducts.get(i);
                    %>
                    <div class="pic">
                        <img src="<%= product.getUrl() %>">
                        <div class="hover-options">
                            <button class="option-button"><i class="fa-regular fa-heart"></i></button>
                            <button class="option-button"><i class="fa-solid fa-down-long"></i></button>
                            <button class="option-button"><i class="fa-solid fa-cart-shopping"></i></button>
                        </div>
                        <div class="image-text">
                            <p><%= product.getName() %></p>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
        <div class="see-more">
            <button class="see-more-button">
                <a href="pages/category-details.html" class="text-success text-decoration-none">Xem nhiều hơn</a>
            </button>
        </div>
        </div>
    </section>
    <!-- section raw images -->

    <jsp:include page="include/footer.jsp"/>
    <jsp:include page="include/scripts.jsp"/>
</body>
</html>
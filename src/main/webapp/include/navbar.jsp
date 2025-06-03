<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="cartLength" scope="request" type="java.lang.Integer"/>

<section id="nav">
    <div class="container">
        <nav class="navbar navbar-expand-md w-100">
            <div class="container-fluid">
                <!-- Logo -->
                <a class="navbar-brand me-auto" href="${ pageContext.request.contextPath }/">
                    <span class="title-logo fw-bold">CoRiPhoto</span>
                </a>

                <!-- Mobile Right Section (Login/User) -->
                <div class="d-flex align-items-center d-md-none order-1">
                    <c:if test="${auth == null}">
                        <a href="login" class="login-button fw-semibold">Đăng nhập</a>
                    </c:if>
                    <c:if test="${auth != null}">
                        <div class="d-flex align-items-center user-icon me-2" id="user-mobile">
                            <img class="avatar position-relative" src="../assets/images/avart-default.png" alt=""/>
                        </div>
                    </c:if>

                    <!-- Hamburger Button -->
                    <button class="navbar-toggler ms-2" type="button" data-bs-toggle="offcanvas"
                            data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                </div>

                <!-- Offcanvas Menu -->
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasDarkNavbar"
                     aria-labelledby="offcanvasDarkNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title title-logo fw-bold" id="offcanvasDarkNavbarLabel">CoRiPhoto</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-center flex-grow-1">
                            <!-- Ảnh Dropdown -->
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle mx-lg-3" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fw-semibold title-item">Ảnh</span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#">Ảnh chụp</a></li>
                                    <li><a class="dropdown-item" href="#">Ảnh vectors</a></li>
                                    <li><a class="dropdown-item" href="#">Ảnh AI</a></li>
                                </ul>
                            </li>

                            <!-- Danh mục Dropdown -->
                            <%
                                @SuppressWarnings("unchecked")
                                List<Category> categories = (List<Category>) request.getAttribute("categories");
                            %>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle mx-lg-3" href="#" role="button"
                                   data-bs-toggle="dropdown" aria-expanded="false">
                                    <span class="fw-semibold title-item">Danh mục</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-categories">
                                    <% if(categories != null) {
                                        for(int i = 0; i < Math.min(categories.size(), 10); i++) {
                                            Category item = categories.get(i);
                                    %>
                                    <li><a class="dropdown-item" href="products?cid=<%= item.getCid() %>">
                                        <%= item.getName() %>
                                    </a></li>
                                    <% }} %>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="categories">Tất cả danh mục</a></li>
                                </ul>
                            </li>

                            <!-- Giấy phép -->
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" href="${pageContext.request.contextPath}/license">
                                    <span class="fw-semibold title-item">
                                        <i class="bi bi-x-diamond me-2 title-item"></i>Giấy phép
                                    </span>
                                </a>
                            </li>

                            <!-- Mobile Only Items -->
                            <li class="nav-item d-md-none">
                                <hr class="dropdown-divider">
                            </li>

                            <!-- Sell/Contributor - Mobile -->
                            <li class="nav-item d-md-none">
                                <% boolean isSignupSell = (Boolean) request.getSession().getAttribute("isSignupSell"); %>
                                <% if (isSignupSell) { %>
                                <a class="nav-link" href="ShowStatistic">
                                    <i class="bi bi-hexagon-half me-2"></i>
                                    Quản lý phân phối
                                </a>
                                <% } else { %>
                                <a class="nav-link" href="register-contributor">
                                    <i class="bi bi-hexagon-half me-2"></i>
                                    Đăng ký thành người phân phối
                                </a>
                                <% } %>
                            </li>

                            <!-- Wishlist - Mobile -->
                            <li class="nav-item d-md-none">
                                <a class="nav-link" href="Favourite">
                                    <i class="fa-regular fa-heart me-2"></i>
                                    Yêu thích
                                </a>
                            </li>

                            <!-- Cart - Mobile -->
                            <li class="nav-item d-md-none">
                                <a class="nav-link" href="cart">
                                    <i class="fa-solid fa-cart-shopping me-2"></i>
                                    Giỏ hàng
                                    <span class="badge bg-primary ms-2">${ cartLength }</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Desktop Items -->
                <div class="d-none d-md-flex align-items-center pt-1">
                    <!-- Sell/Contributor -->
                    <div class="sell">
                        <% boolean isSignupSellDesktop = (Boolean) request.getSession().getAttribute("isSignupSell"); %>
                        <% if (isSignupSellDesktop) { %>
                        <a href="ShowStatistic" class="sell mx-lg-2 fw-semibold title-item">
                            <i class="bi bi-hexagon-half title-item"></i>
                            Quản lý phân phối
                        </a>
                        <% } else { %>
                        <a href="register-contributor" class="sell mx-lg-2 fw-semibold title-item">
                            <i class="bi bi-hexagon-half title-item"></i>
                            Đăng ký thành người phân phối
                        </a>
                        <% } %>
                    </div>

                    <div class="line-separate mx-lg-1"></div>

                    <!-- Wishlist -->
                    <a href="Favourite" class="love">
                        <i class="fa-regular fa-heart title-item"></i>
                    </a>

                    <!-- Cart -->
                    <a href="cart" class="cart">
                        <i class="fa-solid fa-cart-shopping title-item"></i>
                        <span>${ cartLength }</span>
                    </a>
                </div>

                <!-- Desktop Login/User -->
                <div class="d-none d-md-block">
                    <c:if test="${auth == null}">
                        <a href="login" class="login-button fw-semibold">Đăng nhập</a>
                    </c:if>
                    <c:if test="${auth != null}">
                        <div class="d-flex align-items-center user-icon me-2" id="user">
                            <img class="avatar position-relative" src="../assets/images/avart-default.png" alt=""/>
                            <i class="fa fa-caret-down ms-2"></i>
                        </div>

                        <c:if test="${ auth.role == 0 }">
                            <a href="ShowDashBoard" class="text-decoration-none feature-admin">
                                <div class="d-flex align-items-center user-icon btn btn-outline-success">
                                    <i class="bi bi-person-lock me-2"></i>Admin
                                    <i class="fa fa-caret-down ms-2"></i>
                                </div>
                            </a>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </nav>
    </div>
</section>

<!-- section user account -->
<section class="user-account bg-white">
    <div class="container">
        <div class="top d-flex mt-5 align-items-center">
            <div class="info">
                <div class="name">
                    <span class="fw-bold text-success text-decoration-underline">Hi, ${ auth.username }</span>
                    <p class="mt-1">${ auth.email }</p>
                </div>
            </div>
        </div>
        <div class="line-seperate"></div>
        <div class="option">
            <ul class="">
                <li class="item">
                    <a href="ShowProfileInformation">
                        <i class="fas fa-user-cog me-2"></i>
                        <p>Chi tiết tài khoản</p>
                    </a>
                </li>
                <li class="item">
                    <a href="Favourite">
                        <i class="fas fa-heart me-2"></i>
                        <p>Yêu thích</p>
                    </a>
                </li>
                <li class="item">
                    <a href="cart">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <p>Giỏ hàng</p>
                    </a>
                </li>
                <li class="item">
                    <a href="OrderHistory">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <p>Lịch sử mua hàng</p>
                    </a>
                </li>
                <hr>
                <li class="item">
                    <a href="logout">
                        <i class="fa-solid fa-arrow-right-from-bracket"></i>
                        <p class="mb-0">Đăng xuất</p>
                    </a>
                </li>
            </ul>
        </div>
        <div class="icon-greeting">
            <img src="../assets/images/icons-greeting.png" alt=""/>
        </div>
        <div class="title-logo-user fw-bold">
            <span class="text-success">C</span>o<span class="text-success">R</span>iPhoto
        </div>
        <button class="btn-close btn-close-black close-user"></button>
    </div>
</section>
<div class="overlay"></div>
<!-- section user account -->

<script>
    const navbar = document.getElementById("nav");

    window.addEventListener("scroll", function () {
        console.log("Scrolled");
        if (window.scrollY > 50) {
            navbar.classList.add("scrolled");
        } else {
            navbar.classList.remove("scrolled");
        }
    });
</script>
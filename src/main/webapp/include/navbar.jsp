<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<jsp:useBean id="cartLength" scope="request" type="java.lang.Integer"/>

<section id="nav">
    <div class="container">
        <nav class="navbar navbar-expand-lg w-100">
            <div class="container-fluid">
                <a class="navbar-brand me-auto" href="${ pageContext.request.contextPath }/">
                    <span class="title-logo fw-bold">
                        CoRiPhoto
                    </span>
                </a>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-center flex-grow-1">
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" aria-current="page" href="#">
                                    <span class="fw-semibold title-item">Ảnh</span>
                                    <i class="fa-solid fa-angle-down px-2  title-item"></i>
                                </a>
                                <div class="link-hover">
                                    <div class="dropdown-arrow"></div>
                                    <a href="#" class="d-flex justify-content-between">
                                        <span>Ảnh chụp</span>
                                        <i class="bi bi-arrow-right d-none"></i>
                                    </a>
                                    <a href="#" class="d-flex justify-content-between">
                                        <span>Ảnh vectors</span>
                                        <i class="bi bi-arrow-right d-none"></i>
                                    </a>
                                    <a href="#" class="d-flex justify-content-between">
                                        <span>Ảnh AI</span>
                                        <i class="bi bi-arrow-right d-none"></i>
                                    </a>
                                </div>
                            </li>
                            <%
                                @SuppressWarnings("unchecked")
                                List<Category> categories = (List<Category>) request.getAttribute("categories");
                            %>
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" href="categories">
                                    <span class="fw-semibold title-item">Danh mục</span>
                                    <i class="fa-solid fa-angle-down px-2 title-item"></i>
                                </a>
                                <div class="link-hover">
                                    <div class="dropdown-arrow"></div>
                                    <div class="dropdown">
                                        <% for(int i = 0; i < 5; i++) {
                                            Category item = categories.get(i);
                                        %>
                                        <a href="products?cid=<%= item.getCid() %>" class="d-flex justify-content-between">
                                            <span><%= item.getName() %></span>
                                            <i class="bi bi-arrow-right d-none"></i>
                                        </a>
                                        <% } %>
                                    </div>
                                    <div class="dropdown">
                                        <% for(int i = 5; i < 10; i++) {
                                                Category item = categories.get(i);
                                        %>
                                        <a href="products?cid=<%= item.getCid() %>" class="d-flex justify-content-between">
                                            <span><%= item.getName() %></span>
                                            <i class="bi bi-arrow-right d-none"></i>
                                        </a>
                                        <% } %>
                                    </div>
                                    <div class="dropdown">
                                        <% for(int i = 10; i < 14; i++) {
                                                Category item = categories.get(i);
                                        %>
                                        <a href="products?cid=<%= item.getCid() %>" class="d-flex justify-content-between">
                                            <span><%= item.getName() %></span>
                                            <i class="bi bi-arrow-right d-none"></i>
                                        </a>
                                        <% } %>
                                        <a href="categories" class="d-flex justify-content-between">
                                            <span>Tất cả</span>
                                            <i class="bi bi-arrow-right d-none"></i>
                                        </a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" href="${pageContext.request.contextPath}/license">
                                    <span class="fw-semibold title-item">
                                        <i class="bi bi-x-diamond me-2 title-item"></i>Giấy phép
                                    </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="d-flex align-items-center pt-1">
                    <div class="sell">
                        <% boolean isSignupSell = (Boolean) request.getSession().getAttribute("isSignupSell"); %>
                        <% if (isSignupSell) { %>
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
                    <%-- Wishlist --%>
                    <a href="#" class="love">
                        <i class="fa-regular fa-heart title-item"></i>
                    </a>
                    <%-- Cart --%>
                    <a href="cart" class="cart">
                        <i class="fa-solid fa-cart-shopping  title-item"></i>
                        <span>${ cartLength }</span>
                    </a>
                </div>

                <c:if test="${auth == null}">
                    <a href="login" class="login-button fw-semibold">Đăng nhập</a>
                </c:if>
                <c:if test="${auth != null}">
                    <div class="d-flex align-items-center user-icon me-2" id="user">
                        <img class="avatar position-relative" src="../assets/images/avart-default.png"  alt=""/>
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
                    <a href="#">
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
                    <a href="#">
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
<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Category" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<section id="nav">
    <div class="container">
        <nav class="navbar navbar-expand-lg w-100">
            <div class="container-fluid">
                <a class="navbar-brand me-auto" href="${ pageContext.request.contextPath }/">
                    <span class="title-logo fw-bold"><span class="text-success">C</span>o<span class="text-success">R</span>iPhoto</span>
                </a>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasDarkNavbar"
                     aria-labelledby="offcanvasDarkNavbarLabel">
                    <div class="offcanvas-header">
                        <h5 class="offcanvas-title fw-bold" id="offcanvasDarkNavbarLabel">
                            <span class="text-success">C</span>o<span class="text-success">R</span>iPhoto
                        </h5>
                        <button type="button" class="btn-close btn-close-black" data-bs-dismiss="offcanvas"
                                aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body">
                        <ul class="navbar-nav justify-content-center flex-grow-1">
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" aria-current="page" href="homepage.html">
                                    <span class="fw-semibold">Ảnh</span>
                                    <i class="fa-solid fa-angle-down px-2"></i>
                                </a>
                                <div class="link-hover">
                                    <a href="pages/type-images.html">Ảnh chụp</a>
                                    <a href="pages/type-images.html">Ảnh vectors</a>
                                    <a href="pages/type-images.html">Ảnh AI</a>
                                </div>
                            </li>
                            <% List<Category> categories = (List<Category>) request.getAttribute("categories"); %>
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" href="pages/category-details.html">
                                    <span class="fw-semibold">Danh mục</span>
                                    <i class="fa-solid fa-angle-down px-2"></i>
                                </a>
                                <div class="link-hover">
                                    <div class="dropdown">
                                        <% for(int i = 0; i < 5; i++) {
                                            Category item = categories.get(i);
                                        %>
                                        <a href="products?cid=<%= item.getCid() %>"> <%= item.getName() %></a>
                                        <% } %>
                                    </div>
                                    <div class="dropdown">
                                        <% for(int i = 5; i < 10; i++) {
                                                Category item = categories.get(i);
                                        %>
                                        <a href="products?cid=<%= item.getCid() %>"> <%= item.getName() %></a>
                                        <% } %>
                                    </div>
                                    <div class="dropdown">
                                        <% for(int i = 10; i < 15; i++) {
                                                Category item = categories.get(i);
                                        %>
                                        <a href="products?cid=<%= item.getCid() %>"> <%= item.getName() %></a>
                                        <% } %>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" href="#">
                                    <span class="fw-semibold">Giấy phép</span>
                                    <i class="fa-solid fa-angle-down px-2"></i>
                                </a>
                                <div class="link-hover">
                                    <a href="pages/license-basic.html">Giấy phép ảnh tiêu chuẩn</a>
                                    <a href="pages/license-basic.html">Giấy phép miễn phí bản quyền</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="d-flex align-items-center pt-1">
                    <div class="sell">
                        <a href="#" class="sell mx-lg-2 fw-semibold">Người phân phối<i class="fa-solid fa-angle-down px-2"></i></a>
                        <div class="link-hover">
                            <a href="pages/register-contributor.html">Đăng ký thành người phân phối</a>
                        </div>
                    </div>
                    <div class="line-separate mx-lg-1"></div>
                    <a href="pages/like.html" class="love"><i class="fa-regular fa-heart"></i></a>
                    <a href="pages/cart.html" class="cart"><i class="fa-solid fa-cart-shopping"></i></a>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar"
                        aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <a href="pages/login-signup/login.html" class="login-button fw-semibold">Đăng nhập</a>
            </div>
        </nav>
    </div>
</section>

<!-- section user account -->
<section class="user-account bg-white">
    <div class="container">
        <div class="top d-flex mt-5 align-items-center">
            <img class="avatar position-relative" src="../assets/images/avart-default.png" />
            <div class="info">
                <div class="name">
                    <span>Hi, Test</span>
                    <p>test@gmail.com</p>
                </div>
                <a href="editprofile.html" class="text-decoration-none">Chỉnh sửa hồ sơ</a>
            </div>
        </div>
        <div class="line-seperate"></div>
        <div class="option">
            <ul class="">
                <li class="item">
                    <a href="homeprofile.html">
                        <i class="fas fa-user-cog me-2"></i>
                        <p>Chi tiết tài khoản</p>
                    </a>
                </li>
                <li class="item">
                    <a href="like.html">
                        <i class="fas fa-heart me-2"></i>
                        <p>Yêu thích</p>
                    </a>
                </li>
                <li class="item">
                    <a href="cart.html">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <p>Giỏ hàng</p>
                    </a>
                </li>
                <li class="item">
                    <a href="history-order.html">
                        <i class="fa-solid fa-clock-rotate-left"></i>
                        <p>Lịch sử mua hàng</p>
                    </a>
                </li>
                <li class="item">
                    <a href="../homepage.html">
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

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<section id="nav">
    <div class="container">
        <nav class="navbar navbar-expand-lg w-100">
            <div class="container-fluid">
                <a class="navbar-brand me-auto" href="homepage.html">
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
                            <li class="nav-item">
                                <a class="nav-link mx-lg-3" href="pages/category-details.html">
                                    <span class="fw-semibold">Danh mục</span>
                                    <i class="fa-solid fa-angle-down px-2"></i>
                                </a>
                                <div class="link-hover">
                                    <div class="dropdown">
                                        <a href="pages/products.html"> Trừu tượng</a>
                                        <a href="pages/products.html"> Công nghệ</a>
                                        <a href="pages/products.html"> Tự nhiên</a>
                                        <a href="pages/products.html"> Cuộc sống</a>
                                        <a href="pages/products.html"> Động vật</a>
                                    </div>
                                    <div class="dropdown">
                                        <a href="pages/products.html"> Các mùa</a>
                                        <a href="pages/products.html"> Trên không</a>
                                        <a href="pages/products.html"> Ban đêm</a>
                                        <a href="pages/products.html"> Thành phố</a>
                                        <a href="pages/products.html"> Quê hương</a>
                                    </div>
                                    <div class="dropdown">
                                        <a href="pages/products.html"> Con người</a>
                                        <a href="pages/products.html"> Du lịch</a>
                                        <a href="pages/products.html"> Nghệ thuật</a>
                                        <a href="pages/products.html"> Cuộc sống</a>
                                        <a href="pages/category-details.html"> Tất cả Danh mục</a>
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
                            <!-- <li class="nav-item">
                                <a class="nav-link mx-lg-3 fw-semibold" href="#">Giới thiệu</a>
                            </li> -->
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

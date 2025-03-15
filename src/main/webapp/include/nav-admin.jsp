<%@ page contentType="text/html;charset=UTF-8" %>
<div class="nav-blur-overlay"></div>
<nav class="navbar navbar-expand-lg bg-body-white fixed-top">
    <div class="container-fluid">
        <i class="fa-solid fa-bars ms-3" id="toggleSidebar" style="font-size: 22px"></i>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Tìm kiếm -->
            <form class="d-flex me-auto ms-4 position-relative" role="search">
                <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                <button class="btn" type="submit"><i class="bi bi-search"></i></button>
            </form>
            <!-- Chức năng -->
            <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="bi bi-fullscreen" id="fullscreenBtn" style="font-size: 20px"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" id="darkModeToggle"><i class="bi bi-brightness-high" id="darkModeIcon" style="font-size: 20px"></i></a>
                </li>
                <!-- Bảng thao tác cho user admin -->
                <li class="nav-item" onclick="togglePopup()">
                    <a class="nav-link dropdown-toggle user-icon" href="#">
                        <img class="rounded-circle" src="../assets/images/avart-default.png" alt="avatar" style="width: 30px; height: 30px">
                        <span class="ms-1 text-secondary name-admin"><%= request.getAttribute("username") %></span>
                    </a>
                    <div id="userPopup" class="popup">
                        <div class="popup-content">
                            <div class="popup-header">
                                <p>Welcome!</p>
                            </div>
                            <div class="popup-body">
                                <ul>
                                    <li><a href="#"><i class="bi bi-person-gear me-1"></i>Tài khoản</a></li>
                                    <li><a href="#"><i class="bi bi-gear me-1"></i>Cài đặt</a></li>
                                    <li><a href="#"><i class="bi bi-lock me-1"></i>Khóa màn hình</a></li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/homepage">
                                            <i class="bi bi-box-arrow-right me-1"></i>Đăng xuất
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
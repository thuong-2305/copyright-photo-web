<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/admin-homepage.css">
    <link rel="stylesheet" href="assets/css/admin-1.css">
    <link rel="stylesheet" href="assets/css/admin-nav.css">
    <link rel="stylesheet" href="assets/css/admin-dashboard.css">
    <jsp:include page="include/head-libraries.jsp" />
    <title>Admin</title>
</head>
<body>
<!-- MAIN -->
<section class="container-main">
    <!-- LEFT MAIN -->
    <jsp:include page="include/sidebar.jsp" />
    <!-- LEFT MAIN -->

    <!-- RIGHT MAIN -->
    <section class="right-category">
        <!-- navbar admin -->
        <jsp:include page="include/nav-admin.jsp"/>

        <!-- Content main -->
        <div id="admin-dashboard-graph">
            <div class="mt-4 content-view">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold">Trang chủ</h5>
                </div>

                <!-- Banner dashboard -->
                <div class="account-status">
                    <div class="status-text">
                        <h2>Kiểm tra trạng thái tài khoản</h2>
                        <p>Trạng thái và hoạt động tài khoản của bạn.</p>

                        <div class="status-content">
                            <div class="status-card balance">
                                <img src="assets/images/money-box.png" alt="money-box">
                                <a href="#"><i class="bi bi-box-arrow-up-right"></i></a>
                            </div>

                            <div class="status-card spending">
                                <img src="assets/images/payment-history.png" alt="money-box">
                                <a href="#"><i class="bi bi-box-arrow-up-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="status-image">
                        <img src="assets/images/hero-dashboard-1915640c.png" alt="admin">
                    </div>
                </div>

                <!-- Stat Cards -->
                <div class="row stats-section mx-auto px-2">
                    <div class="col-md-3 ps-0">
                        <div class="card stats-card rounded" id="visitors-card">
                            <div class="card-body text-center py-3">
                                <i class="fas fa-users fa-2x text-primary mb-3"></i>
                                <h3 class="text-primary">13,294</h3>
                                <p class="card-title">Lượt truy cập</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card stats-card rounded" id="subscribers-card">
                            <div class="card-body text-center py-3">
                                <i class="fas fa-user-friends fa-2x text-info mb-3"></i>
                                <h3 class="text-info">${totalUsers}</h3>
                                <p class="card-title">Người dùng</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card stats-card rounded" id="sales-card">
                            <div class="card-body text-center py-3">
                                <i class="fas fa-dollar-sign fa-2x text-success mb-3"></i>
                                <h3 class="text-success">
                                    <fmt:formatNumber value="${totalIncome}" pattern="#,##0" />
                                    <span> VNĐ</span></h3>
                                <p class="card-title">Tổng doanh thu</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 pe-0">
                        <div class="card stats-card rounded" id="orders-card">
                            <div class="card-body text-center py-3">
                                <i class="fas fa-box fa-2x text-warning mb-3"></i>
                                <h3 class="text-warning">${totalOrder}</h3>
                                <p class="card-title">Đơn hàng</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Thống kê người dùng + Doanh thu hàng ngày + Người dùng trực tuyến -->
                <div class="d-flex flex-row mt-4 stats-overview px-2">
                    <!-- Thống kê người dùng -->
                    <div class="col-8 user-statistics-section pl-0">
                        <div class="card rounded" id="user-statistics-card">
                            <div class="card-header text-white fw-semibold">
                                <h5>Thống kê người dùng</h5>
                            </div>
                            <div class="card-body">
                                <!-- Canvas for Chart -->
                                <canvas id="userStatisticsChart" width="400" height="200"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Doanh thu theo tháng + Người dùng trực tuyến -->
                    <div class="col-4 d-flex flex-column sales-and-online-section ps-4">
                        <!-- Doanh thu theo tháng -->
                        <div class="card mb-3 rounded" id="monthly-sales-card">
                            <div class="card-body text-center py-3">
                                <h4>Doanh thu theo tháng</h4>
                                <div class="d-flex justify-content-center align-items-center my-3">
                                    <button class="btn btn-outline-primary btn-sm me-2" id="prev-month">
                                        <i class="fas fa-chevron-left"></i>
                                    </button>
                                    <span id="current-month" class="text-secondary fw-bold">Tháng 1</span>
                                    <button class="btn btn-outline-primary btn-sm ms-2" id="next-month">
                                        <i class="fas fa-chevron-right"></i>
                                    </button>
                                </div>
                                <div class="my-2">
                                    <select id="year-selector" class="form-select form-select-sm w-auto mx-auto">
                                        <option value="2024">2024</option>
                                        <option value="2025">2025</option>
                                    </select>
                                </div>
                                <h3 class="text-primary" id="monthly-income-placeholder">--- VNĐ</h3>
                            </div>
                        </div>

                        <!-- Người dùng trực tuyến -->
                        <div class="card stats-card rounded d-flex flex-column justify-content-center align-items-center"
                             id="users-online-card" style="min-height: 200px;">
                            <div class="text-center">
                                <i class="fas fa-users fa-2x mb-3"></i>
                                <h3>17</h3>
                                <p class="card-title">Người dùng trực tuyến</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- footer-admin -->
        <jsp:include page="include/admin-footer.jsp" />
    </section>
    <!-- RIGHT MAIN -->
</section>
<!-- MAIN -->

<jsp:include page="include/admin-libraries.jsp" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="assets/js/admin-dashboard-chart.js"></script>

</body>
</html>
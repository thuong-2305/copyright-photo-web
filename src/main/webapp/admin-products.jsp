<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/13/2025
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="./assets/css/admin-1.css" />
    <link rel="stylesheet" href="././assets/css/admin-dashboard.css" />
    <link rel="stylesheet" href="./assets/css/admin-homepage.css" />
    <link rel="stylesheet" href="./assets/css/admin-products.css" />
    <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css" />
    <link rel="stylesheet" href="./assets/libraries/bootstrap-icons/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <title>Admin</title>
</head>

<body>
<!-- MAIN -->
<section class="container-main">
    <!-- LEFT MAIN -->
    <section class="left d-flex flex-column justify-content-between">
        <div class="top-left">
            <p class="fs-5 fw-semibold m-0 text-center mt-2">
                <span class="text-logo fw-bold">CoRiPhoto</span> Admin
            </p>
            <ul class="list-unstyled">
                <li>
                    <a href="${pageContext.request.contextPath}/ShowDashBoard"><i class="fa-solid fa-house"></i>Trang chủ</a>
                </li>
                <li class="active">
                    <a href="./admin-products"><i class="bi bi-grid-fill"></i>Sản phẩm</a>
                </li>
                <li>
                    <a href="admin-category.html"><i class="bi bi-list-task"></i>Danh mục</a>
                </li>
                <li>
                    <a href="admin-order.html"><i class="bi bi-wallet-fill"></i>Đơn hàng</a>
                </li>
                <li>
                    <a href="admin-customer.html"><i class="fa-solid fa-user"></i>Khách hàng</a>
                </li>
                <li>
                    <a href="admin-contributor.html"><i class="bi bi-coin"></i>Người phân phối</a>
                </li>
                <hr>
                <li>
                    <a href="admin-aproved.html"><i class="fa-solid fa-bell"></i>Ảnh đang chờ</a>
                </li>
                <li>
                    <a href="./homepage.html"><i class="bi bi-box-arrow-right"></i>Đăng xuất</a>
                </li>
            </ul>
        </div>
        <div class="avatar bottom-left d-flex justify-content-between align-items-center mx-2 mb-4">
            <div class="d-flex justify-content-center align-items-center">
                <img src="./assets/images/avart-default.png" alt="" />
                <p class="ms-2 m-0">Thanh Thương</p>
            </div>
            <i class="bi bi-three-dots"></i>
        </div>
    </section>
    <!-- LEFT MAIN -->

    <!-- RIGHT MAIN -->
    <section class="right-category">
        <div class="frame">
            <div class="frame__container">
                <h2 class="frame__title">Doanh số bán hàng hôm nay</h2>
                <p class="frame__desc">Tóm tắt doanh số bán hàng</p>
                <div class="frame__content">
                    <!-- 1. Thong ke so luong ban hang -->
                    <div class="statistic statistic--increase">
                        <div class="statistic__container">
                            <i class="fa-solid fa-chart-simple"></i>
                            <div class="statistic-bot">
                                <h2 class="statistic-bot__price">5.000.000 VND</h2>
                                <p class="statistic-bot__name">Tổng doanh thu bán hàng</p>
                                <p class="statistic-bot__compare">+10% so với hôm qua</p>
                            </div>
                        </div>
                    </div>
                    <!-- 2. Thong ke so luong san pham -->
                    <div class="statistic statistic--increase">
                        <div class="statistic__container">
                            <i class="fa-solid fa-bag-shopping"></i>
                            <div class="statistic-bot">
                                <h2 class="statistic-bot__price">425</h2>
                                <p class="statistic-bot__name">Sản phẩm đã bán</p>
                                <p class="statistic-bot__compare">+30% so với hôm qua</p>
                            </div>
                        </div>
                    </div>
                    <!-- 3. Thong ke so luong san pham -->
                    <div class="statistic statistic--increase">
                        <div class="statistic__container">
                            <i class="fa-solid fa-user-plus"></i>
                            <div class="statistic-bot">
                                <h2 class="statistic-bot__price">30</h2>
                                <p class="statistic-bot__name">Sản phẩm mới</p>
                                <p class="statistic-bot__compare">+10% so với hôm qua</p>
                            </div>
                        </div>
                    </div>

                    <!-- 4. Thong ke so luong san pham -->
                    <div class="statistic statistic--decrease">
                        <div class="statistic__container">
                            <i class="fa-regular fa-eye"></i>
                            <div class="statistic-bot">
                                <h2 class="statistic-bot__price">3000</h2>
                                <p class="statistic-bot__name">Lượt xem sản phẩm</p>
                                <p class="statistic-bot__compare">-15% so với hôm qua</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <main>
            <div class="frame">
                <div class="frame__container">
                    <div class="mt-4">
                        <div class="frame_manager header d-flex justify-content-between align-items-center mb-3">
                            <h2>Quản lý sản phẩm</h2>
                        </div>
                        <div class="d-flex mb-3 align-items-center justify-content-between search px-3 py-2">


                            <div class="add-category d-flex align-items-center">
                                <i class="fa-solid fa-print"></i>
                                <i class="bi bi-arrow-bar-down mx-3"></i>
                                <button class="btn btn-primary"
                                        onclick="document.getElementById('khungThemSanPham').style.transform = 'scale(1)'; autoMaSanPham()">
                                    <i class="fa fa-plus-square"></i>
                                    Thêm sản phẩm
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="sanpham w-100">
                        <table id="productsTable" class="display table table-bordered table-striped">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>User ID</th>
<%--                                <th>Category ID</th>--%>
                                <th>Tên</th>
                                <th>Mô tả</th>
<%--                                <th>Kích thước</th>--%>
<%--                                <th>Kích thước (Dài x Rộng)</th>--%>
<%--                                <th>Ngày tải lên</th>--%>
<%--                                <th>URL</th>--%>
                                <th>Giá</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th> <!-- Cột Hành động -->
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Vòng lặp hiển thị danh sách sản phẩm -->
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <td>${product.id}</td>
                                    <td>${product.uid}</td>
<%--                                    <td>${product.cid}</td>--%>
                                    <td>${product.name}</td>
                                    <td>${product.description}</td>
<%--                                    <td>${product.size}</td>--%>
<%--                                    <td>${product.dimension}</td>--%>
<%--                                    <td>${product.dateUpload}</td>--%>
<%--                                    <td>${product.url}</td>--%>
                                    <td>${product.price}</td>
                                    <td>${product.status}</td>
                                    <td>
                                        <button class="btn edit-btn btn-warning" data-id="${product.id}">Sửa</button>
                                        <button class="btn delete-btn btn-danger" data-id="${product.id}">Xóa</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                        <div id="khungThemSanPham" class="overlay">
                            <span class="close" onclick="this.parentElement.style.transform = 'scale(0)';">&times;</span>
                            <table class="overlayTable table-outline table-content table-header">
                                <tr>
                                    <th colspan="2">Thêm hình ảnh</th>
                                </tr>
                                <tr>
                                    <td>Hình:</td>
                                    <td>
                                        <img class="hinhDaiDien" id="anhDaiDienSanPhamThem" src=""  alt=""/>
                                        <input type="file" accept="image/*"
                                               onchange="capNhatAnhSanPham(this.files, 'anhDaiDienSanPhamThem')" />
                                    </td>
                                </tr>
                                <tr>
                                    <th colspan="2">Thông số kĩ thuật</th>
                                </tr>
                                <tr>
                                    <td>Tên hình ảnh:</td>
                                    <td><input type="text" /></td>
                                </tr>
                                <tr>
                                    <td>Mô tả:</td>
                                    <td><input type="text" /></td>
                                </tr>

                                <tr>
                                    <td>Loại hình ảnh:</td>
                                    <td><input type="text" /></td>
                                </tr>
                                <tr>
                                    <td>Giá</td>
                                    <td><input type="text" /></td>
                                </tr>
                                <tr>
                                    <td>Ngươi đóng góp:</td>
                                    <td><input type="text" /></td>
                                </tr>
                                <tr>
                                    <td>Dung lượng ảnh:</td>
                                    <td><input type="text" placeholder="" /></td>
                                </tr>

                                <tr>
                                    <td>Ngày chụp:</td>
                                    <td><input type="text" /></td>
                                </tr>
                                <tr>
                                    <td>Giá:</td>
                                    <td><input type="text" /></td>
                                </tr>

                                <tr>
                                    <td colspan="2" class="table-footer">
                                        <button onclick="themSanPham()">THÊM</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="khungSuaSanPham" class="overlay"></div>
                    </div>
                </div>
            </div>
            <!-- End: Table SAN PHAM -->
        </main>
    </section>
    <!-- RIGHT MAIN -->
</section>
<!-- MAIN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="./assets/js/admin.js"></script>
<script src="./assets/js/admin-dashboard.js"></script>
<script src="./assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function () {
        $('#productsTable').DataTable({
            language: {
                search: "Nhập từ khóa:",
                lengthMenu: "Hiển thị _MENU_ mục",
                info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục", // Tùy chỉnh "Showing 1 to 10 of 53 entries"
                infoEmpty: "Không có dữ liệu để hiển thị",          // Khi không có bản ghi
                infoFiltered: "(lọc từ _MAX_ mục)",                // Thông báo khi có lọc dữ liệu
                paginate: {
                    previous: "Trước", // Tùy chỉnh "Previous"
                    next: "Tiếp"       // Tùy chỉnh "Next"
                }
            },
            scrollX: true // Kích hoạt cuộn ngang nếu tổng độ rộng vượt khung
        });
        var table = $('#productsTable').DataTable();
        // Thay đổi placeholder của khung tìm kiếm
        var search=$('.dataTables_filter input');
        search.attr('text', 'Tìm kiếm');
        search.attr('placeholder', 'Tìm kiếm sản phẩm ...');
    });
</script>
</body>
</html>

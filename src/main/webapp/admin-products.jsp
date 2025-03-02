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
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="./assets/css/admin-1.css"/>
    <link rel="stylesheet" href="././assets/css/admin-dashboard.css"/>
    <link rel="stylesheet" href="./assets/css/admin-homepage.css"/>
    <link rel="stylesheet" href="./assets/css/admin-products.css"/>
    <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css"/>
    <link rel="stylesheet" href="./assets/libraries/bootstrap-icons/font/bootstrap-icons.min.css"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="./assets/js/admin-products.js"></script>
    <title>Admin</title>

    <style>
        .table-dark {
            background-color: #343a40;
            color: #fff;
        }
        .edit-btn {
            margin-right: 5px;
        }
        .dashboard-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .dashboard-info .info-box {
            flex: 1;
            margin: 0 10px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            text-align: center;
            background-color: #f8f9fa;
        }
        .dashboard-info .info-box h3 {
            margin: 10px 0;
            font-size: 24px;
        }
    </style>
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
                    <a href="${pageContext.request.contextPath}/ShowDashBoard"><i class="fa-solid fa-house"></i>Trang
                        chủ</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin-products"><i class="bi bi-grid-fill"></i>Sản phẩm</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin-category"><i class="bi bi-list-task"></i>Danh mục</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin-order"><i class="bi bi-wallet-fill"></i>Đơn hàng</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin-customer"><i class="fa-solid fa-user"></i>Khách
                        hàng</a>
                </li>
                <hr>
                <li>
                    <a href="${pageContext.request.contextPath}/admin-notification"><i class="bi bi-bell-fill"></i>Thông báo</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/homepage"><i class="bi bi-box-arrow-right"></i>Đăng xuất</a>
                </li>
            </ul>
        </div>
        <div class="avatar bottom-left d-flex justify-content-between align-items-center mx-2 mb-4">
            <div class="d-flex justify-content-center align-items-center">
                <img src="./assets/images/avart-default.png" alt=""/>
                <p class="ms-2 m-0">Thanh Thương</p>
            </div>
            <i class="bi bi-three-dots"></i>
        </div>
    </section>
    <!-- LEFT MAIN -->

    <!-- RIGHT MAIN -->
    <section class="right-category">
        <main>
            <div class="frame">
                <div class="frame__container">
                    <div class="mt-4">
                        <div class="frame_manager header d-flex justify-content-between align-items-center mb-3">
                            <h2>Quản lý sản phẩm</h2>
                        </div>
                        <div class="d-flex mb-3 align-items-center justify-content-between search px-3 py-2">
                            <div class="add-category d-flex align-items-center">
                                <button class="btn btn-primary"
                                        onclick="document.getElementById('khungThemSanPham').style.transform = 'scale(1)';">
                                    <i class="fa fa-plus-square"></i>
                                    Thêm sản phẩm
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <table id="productsTable" class="table table-bordered table-striped">
                                <colgroup>
                                    <col style="width: 5%;">
                                    <col style="width: 15%;">
                                    <col style="width: 30%;">
                                    <col style="width: 20%;">
                                    <col style="width: 15%;">
                                    <col style="width: 20%;">
                                </colgroup>
                                <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>User ID</th>
                                    <th>Tên</th>
                                    <th>Giá</th>
                                    <th>Trạng thái</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Ví dụ -->
                                <c:forEach var="product" items="${products}">
                                    <tr>
                                        <td>${product.id}</td>
                                        <td>${product.uid}</td>
                                        <td>${product.name}</td>
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
                        </div>
                    </div>
                        <div id="khungThemSanPham" class="overlay">
                            <span class="close"
                                  onclick="this.parentElement.style.transform = 'scale(0)';">&times;</span>
                            <form action="${pageContext.request.contextPath}/admin-products" method="POST">
                                <table id="khungThemSanPhamTable" class="overlayTable table-outline table-content table-header">
                                    <tr>
                                        <th colspan="2">Thêm hình ảnh</th>
                                    </tr>
                                    <tr>
                                        <td>Hình:</td>
                                        <td>
                                            <input type="file" name="image" accept="image/*" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="2">Thông tin hình ảnh</th>
                                    </tr>
                                    <tr style="display: none">
                                        <td><label>
                                            <input type="text" name="loi"/>
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td>Tên hình ảnh:</td>
                                        <td><label>
                                            <input type="text" name="nameProduct" required />
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td>Mô tả:</td>
                                        <td><input type="text" name="description" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Loại hình ảnh:</td>
                                        <td><input type="text" name="category" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Giá:</td>
                                        <td><input type="number" name="price" step="1000" required /></td>
                                    </tr>
                                    <tr>
                                        <td>ID người đăng:</td>
                                        <td><input type="text" name="contributor" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Trạng thái:</td>
                                        <td><label>
                                            <select name="status">
                                                <option value="accepted">
                                                    Đã chấp nhận
                                                </option>
                                                <option value="waiting">Chờ đợi</option>
                                                <option value="rejected">Từ chối</option>
                                            </select>
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="table-footer">
                                            <button type="submit">THÊM</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                        <div id="khungSuaSanPham" class="overlay">
                            <span class="close"
                                  onclick="this.parentElement.style.transform = 'scale(0)';">&times;</span>
                            <form action="${pageContext.request.contextPath}/admin-products" method="POST">
                                <table id="khungSuaSanPhamTable" class="overlayTable table-outline table-content table-header">
                                    <tr>
                                        <th colspan="2">Thêm hình ảnh</th>
                                    </tr>
                                    <tr>
                                        <td>Hình:</td>
                                        <td>
                                            <input type="file" name="image" accept="image/*" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <th colspan="2">Thông số kĩ thuật</th>
                                    </tr>
                                    <tr style="display: none">
                                        <td><label>
                                            <input type="text" name="defineForm" value="formEdit"/>
                                        </label></td>
                                    </tr>
                                    <tr style="display: none">
                                        <td><label>
                                            <input type="text" name="idProduct"/>
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td>Tên hình ảnh:</td>
                                        <td><label>
                                            <input type="text" name="nameProduct" required />
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td>Mô tả:</td>
                                        <td><input type="text" name="description" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Loại hình ảnh:</td>
                                        <td><input type="text" name="category" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Giá:</td>
                                        <td><input type="number" name="price" step="1000" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Người đóng góp:</td>
                                        <td><input type="text" name="contributor" required /></td>
                                    </tr>
                                    <tr>
                                        <td>Trạng thái:</td>
                                        <td><label>
                                            <select name="status">
                                                <option value="accepted">
                                                    Đã chấp nhận
                                                </option>
                                                <option value="waiting">Chờ đợi</option>
                                                <option value="rejected">Từ chối</option>
                                            </select>
                                        </label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="table-footer">
                                            <button type="submit">Cập nhật</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                </div>

            <!-- End: Table SAN PHAM -->
            <!-- Begin: Modal xóa sản phẩm -->
            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteModalLabel">Xác nhận xóa</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa sản phẩm này?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="button" id="confirmDelete" class="btn btn-danger">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End: Modal xóa sản phẩm -->
            <!-- Toast message xóa sản phẩm -->

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
        var table = $('#productsTable').DataTable({
            buttons:['copy', 'excel', 'print', 'excel', 'csv'],
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
            // scrollY: true, // Kích hoạt cuộn ngang nếu tổng độ rộng vượt khung
            // columnDefs: [
            //     { width: "200px", targets: 3 }// Tên: 100px
            // ]

        });
        table.buttons().container().appendTo('#productsTable_wapper .col-md-6:eq(0)');
        // Thay đổi placeholder của khung tìm kiếm
        var search = $('.dataTables_filter input');
        search.attr('text', 'Tìm kiếm');
        search.attr('placeholder', 'Tìm kiếm sản phẩm ...');
    });
</script>
<script>
    let productIdToDelete = null;

    $('.delete-btn').on('click', function () {
        productIdToDelete = $(this).data('id');
        $('#deleteModal').modal('show');
    });

    $('#confirmDelete').on('click', function () {
        if (productIdToDelete) {
            $.ajax({
                url: '/admin-products',
                type: 'POST',
                headers: {
                    'X-Requested-By': 'AJAX'
                },
                data: {
                    action: 'delete',
                    product_id: productIdToDelete
                },
                success: function (response) {
                    if (response.success) {
                        alert('Xóa thành công');
                        // showSuccessToast();
                        location.reload();
                    } else {
                        alert('Xóa thất bại!');
                        // showErrorToast();
                    }
                },
                error: function () {
                    alert('Đã xảy ra lỗi!');
                }
            });
        }
        $('#deleteModal').modal('hide');
    });

    $('.edit-btn').on('click', function () {
        const productId = $(this).data('id');
        fetch(`/admin-products?id=`+productId)
            .then(response =>{
                console.log('Response received:', response);  // In ra response để kiểm tra
                return response.json()})
            .then(product => {
                // Hiển thị dữ liệu sản phẩm lên form
                if (product) {
                    document.querySelector('#khungSuaSanPhamTable input[name="idProduct"]').value = productId || '';
                    document.querySelector('#khungSuaSanPhamTable input[name="nameProduct"]').value = product.name || '';
                    document.querySelector('#khungSuaSanPhamTable input[name="description"]').value = product.description || '';
                    document.querySelector('#khungSuaSanPhamTable input[name="category"]').value = product.cid || '';
                    document.querySelector('#khungSuaSanPhamTable input[name="price"]').value = product.price || '';
                    document.querySelector('#khungSuaSanPhamTable input[name="contributor"]').value = product.uid || '';
                    document.querySelector('#khungSuaSanPhamTable select[name="status"]').value = product.status || '';
                } else {
                    alert('Không tìm thấy thông tin sản phẩm!');
                }

                // Hiển thị form sửa
                document.getElementById('khungSuaSanPham').style.transform = 'scale(1)';
            })
            .catch(error => {
                console.error('Lỗi khi lấy thông tin sản phẩm:', error);
                alert('Không thể lấy thông tin sản phẩm!');
            });
    });

</script>

</body>
</html>

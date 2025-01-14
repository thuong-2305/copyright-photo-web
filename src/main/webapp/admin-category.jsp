<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/admin-1.css">
    <link rel="stylesheet" href="assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css">
    <link rel="stylesheet" href="assets/libraries/bootstrap-icons/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <title>Admin</title>
</head>
<body>
    <!-- MAIN -->
    <section class="container-main">
        <!-- LEFT MAIN -->
        <section class="left d-flex flex-column justify-content-between">
            <div class="top-left">
            <p class="fs-5 fw-semibold m-0 text-center mt-2"><span class="text-logo fw-bold">CoRiPhoto</span> Admin</p>
            <ul class="list-unstyled">
                <li>
                    <a href="${pageContext.request.contextPath}/ShowDashBoard"><i class="fa-solid fa-house"></i>Trang chủ</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin-products"><i class="bi bi-grid-fill"></i>Sản phẩm</a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath}/admin-category"><i class="bi bi-list-task"></i>Danh mục</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin-order"><i class="bi bi-wallet-fill"></i>Đơn hàng</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/admin-products"><i class="fa-solid fa-user"></i>Khách hàng</a>
                </li>
                <hr>
                <li>
                    <a href="${pageContext.request.contextPath}/homepage"><i class="bi bi-box-arrow-right"></i>Đăng xuất</a>
                </li>
            </ul>
            </div>
            <div class="avatar bottom-left d-flex justify-content-between align-items-center mx-2 mb-4">
                <div class="d-flex justify-content-center align-items-center">
                    <img src="../assets/images/avart-default.png" alt="">
                    <p class="ms-2 m-0">Thanh Thương</p>
                </div>
                <i class="bi bi-three-dots"></i>
            </div>
        </section>
        <!-- LEFT MAIN -->
         
        <!-- RIGHT MAIN -->
        <section class="right-category">
            <div class="mt-4">
                <div class="container header d-flex justify-content-between align-items-center mb-3 py-2">
                    <h3>Các danh mục</h3>
                    <div class="add-category">
                        <i class="fa-solid fa-print"></i>
                        <i class="bi bi-arrow-bar-down mx-2"></i>
                        <button class="btn btn-primary" id="addCategoryBtn">+ Thêm danh mục mới</button>
                    </div>
                </div>

                <table id="categoryTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Mã danh mục</th>
                            <th >Tên danh mục</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="category" items="${categories}">
                        <tr>
                            <td>${category.cid}</td>
                            <td>${category.name}</td>
                            <td>
                                <button class="btn edit-btn btn-warning" onclick="updateCategory(${category.cid})">Sửa</button>
                                <button class="btn delete-btn btn-danger" onclick="deleteCategory(${category.cid})">Xóa</button>
                            </td>
                        </tr>

                    </c:forEach>

                    </tbody>
                </table>
            </div>

            <div class="modal fade" id="editCategoryModal" tabindex="-1" role="dialog" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editCategoryModalLabel">Chỉnh sửa danh mục</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <!-- Form chỉnh sửa -->
                            <form id="editCategoryForm" action="/updateCategory" method="POST">
                                <div class="form-group">
                                    <label for="categoryName">Tên danh mục:</label>
                                    <input type="text" class="form-control" id="categoryName" name="categoryName" required>
                                    <input type="hidden" id="categoryId" name="categoryId">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary" form="editCategoryForm">Lưu thay đổi</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="categoryModal" tabindex="-1" aria-labelledby="categoryModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="categoryModalLabel">Thêm danh mục mới</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form id="categoryForm">
                                <div class="mb-3">
                                    <label for="categoryName" class="form-label">Tên danh mục</label>
                                    <input type="text" class="form-control" id="categoryName1" required>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-primary" id="saveCategoryBtn">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- RIGHT MAIN -->
    </section>
    <!-- MAIN -->

    <script>
        // Hiển thị modal khi nhấn nút "Thêm danh mục mới"
        document.getElementById("addCategoryBtn").addEventListener("click", function() {
            // Mở modal
            $('#categoryModal').modal('show');
        });

        // Lưu danh mục mới khi nhấn "Save"
        document.getElementById("saveCategoryBtn").addEventListener("click", function() {
            const categoryName = document.getElementById("categoryName1").value;

            if (!categoryName) {
                alert("Vui lòng nhập tên danh mục");
                return;
            }

            // Gửi yêu cầu AJAX để thêm danh mục mới
            fetch('/addCategory', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ categoryName })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        alert('Danh mục đã được thêm thành công!');
                        $('#categoryModal').modal('hide'); // Đóng modal

                        // Cập nhật lại bảng với dữ liệu mới (có thể cần bổ sung dòng mới vào bảng)
                        $('#categoryTable').DataTable().ajax.reload();  // Đảm bảo bảng tải lại dữ liệu

                        // Nếu muốn thêm một dòng mới vào bảng ngay lập tức
                        $('#categoryTable').DataTable().row.add([
                            data.categoryId,
                            data.categoryName
                        ]).draw();
                    } else {
                        alert('Lỗi khi thêm danh mục! Chi tiết: ' + data.message);  // Thêm thông báo chi tiết lỗi
                    }
                })
                .catch(error => {
                    console.error('Có lỗi xảy ra:', error);
                    alert('Có lỗi xảy ra. Vui lòng thử lại!');
                });
        });
    </script>


    <script>
        function updateCategory(cid) {
            // Tắt bộ lọc tìm kiếm khi mở modal
            var table = $('#categoryTable').DataTable();
            table.search('').draw(); // Xóa bộ lọc

            fetch("/getCategory?cid=" + cid)
                .then(response => response.json())
                .then(category => {
                    // Điền dữ liệu vào form trong modal
                    document.getElementById("categoryId").value = category.cid;
                    document.getElementById("categoryName").value = category.name;

                    // Hiển thị modal
                    $('#editCategoryModal').modal('show');
                })
                .catch(error => {
                    console.error("Lỗi khi tải dữ liệu:", error);
                });
        }

        // Ngăn không cho ô nhập liệu trong modal ảnh hưởng đến DataTable
        $('#editCategoryModal').on('shown.bs.modal', function () {
            var table = $('#categoryTable').DataTable();
            // Tạm thời vô hiệu hóa tìm kiếm của DataTable khi modal mở
            table.search('').draw();
        });

        // Sau khi đóng modal, cho phép tìm kiếm lại
        $('#editCategoryModal').on('hidden.bs.modal', function () {
            var table = $('#categoryTable').DataTable();
            // Bật lại tìm kiếm nếu cần
            table.search('').draw();
        });

    </script>

    <script>
        function deleteCategory(categoryId) {
            if (confirm("Bạn có chắc chắn muốn xóa danh mục này?")) {
                window.location.href = "/deleteCategory?cid=" + categoryId;
            }
        }
    </script>
    <script>
        $(document).ready(function () {
            $('#categoryTable').DataTable({
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

            });
            var table = $('#categoryTable').DataTable();
            // Thay đổi placeholder của khung tìm kiếm
            var search = $('.dataTables_filter input');
            search.attr('text', 'Tìm kiếm');
            search.attr('placeholder', 'Tìm kiếm danh mục ...');
        });
    </script>
    <script src="assets/js/admin.js"></script>
    <script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>


    <script>
        document.querySelector(".btn.btn-primary").addEventListener("click", () => {
            new bootstrap.Modal(document.getElementById("categoryModal")).show();
        });
    </script>
</body>
</html>
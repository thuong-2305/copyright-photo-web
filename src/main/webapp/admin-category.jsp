<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/admin-1.css">
    <link rel="stylesheet" href="assets/css/admin-nav.css">
    <link rel="stylesheet" href="assets/css/admin-dashboard.css"/>
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
            <div id="admin-dashboard-graph" class="view-products-main">
                <div class="mt-4 content-view">
                    <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                        <h5 class="fw-semibold">Các danh mục</h5>
                        <div id="exportButtons">
                            <button class="btn button-add fw-semibold"><i class="bi bi-plus-circle me-2"></i>Thêm danh mục</button>
                        </div>
                    </div>

                    <div class="frame__container px-2">
                        <div class="card-body">
                            <table id="productsTable" class="table table-bordered">
                                <colgroup>
                                    <col style="width: 15%;">
                                    <col style="width: 50%;">
                                    <col style="width: 20%;">
                                    <col style="width: 15%;">
                                </colgroup>
                                <thead class="table-dark">
                                    <tr>
                                        <th>Mã danh mục</th>
                                        <th >Tên danh mục</th>
                                        <th >Số lượng sản phẩm</th>
                                        <th>Hành động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="category" items="${categories}">
                                    <tr>
                                        <td>${category.cid}</td>
                                        <td>${category.name}</td>
                                        <td>${category.numberOfType}</td>
                                        <td>
                                            <div class="d-flex justify-content-start">
                                                <button class="btn edit-btn" data-id="${category.cid}"><i class="bi bi-pencil-square"></i></button>
                                                <button class="btn delete-btn" data-id="${category.cid}"><i class="fa-solid fa-trash"></i></button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>

                        <!-- Xác nhận xóa sản phẩm -->
                        <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title user-select-none" id="deleteModalLabel">
                                            <i class="bi bi-exclamation-triangle-fill" style="color: #fa2e2e;"></i>
                                            Xóa sản phẩm
                                        </h5>
                                    </div>
                                    <div class="modal-body">
                                        Bạn có chắc chắn muốn xóa sản phẩm này?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary rounded-pill fw-semibold" data-dismiss="modal">Hủy</button>
                                        <button type="button" id="confirmDelete" class="btn btn-danger rounded-pill fw-semibold">Xóa</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Thêm danh mục -->
                        <div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title user-select-none" id="addCategoryModalLabel">
                                            <i class="bi bi-plus-circle-fill" style="color: #28a745;"></i>
                                            Thêm danh mục mới
                                        </h5>
                                    </div>
                                    <div class="modal-body">
                                        <label for="categoryName" class="form-label">Tên danh mục</label>
                                        <input type="text" id="categoryName" class="form-control" placeholder="Nhập tên danh mục..." required>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" id="confirmCancel" class="btn btn-secondary rounded-pill fw-semibold" data-dismiss="modal">Hủy</button>
                                        <button type="button" id="confirmAddCategory" class="btn btn-success rounded-pill fw-semibold">Thêm</button>
                                    </div>
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

    <!-- Notification -->
    <div class="alert alert-danger d-none align-items-center position-fixed"
         role="alert"
         style="display: none; width: 25%; top: 15%; right: 0"
    >
        <i class="bi bi-exclamation-triangle me-2"></i><span></span>
    </div>
    <div class="alert alert-success d-none align-items-center position-fixed"
         role="alert"
         style="display: none; width: 25%; top: 15%; right: 0"
    >
        <i class="bi bi-check2-circle me-2"></i><span></span>
    </div>
    <!-- Notification -->

    <!-- DataTables -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <!-- DataTables Buttons JS -->
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.3.6/js/buttons.print.min.js"></script>

    <!-- JS -->
    <jsp:include page="include/admin-libraries.jsp" />

    <!-- Chức năng của dataTable -->
    <script>
        $(document).ready(function () {
            const table = $('#productsTable').DataTable({
                deferRender: true,
                buttons:[
                    {
                        extend: 'copy',
                        text: 'Sao chép'
                    },
                    {
                        extend: 'excel',
                        text: 'Xuất Excel'
                    },
                    {
                        extend: 'print',
                        text: 'In'
                    }
                ],
                language: {
                    search: "Nhập từ khóa:",
                    lengthMenu: "Hiển thị _MENU_ mục",
                    info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                    infoEmpty: "Không có dữ liệu để hiển thị",
                    infoFiltered: "(lọc từ _MAX_ mục)",
                    paginate: { previous: "←", next: "→" }
                },
                scrollX: false
            });
            table.buttons().container().appendTo('#exportButtons');

            $(".buttons-copy span").html("<i class=\"bi bi-copy\"></i> Copy");
            $(".buttons-excel span").html("<i class=\"bi bi-file-earmark-excel\"></i> Excel");
            $(".buttons-print span").html("<i class=\"bi bi-printer\"></i> Print");

            $('.dataTables_filter input').attr('placeholder', 'Tìm kiếm sản phẩm ...');
        });

        $(document).ready(function () {
            const controlsWrapper = $("<div class='dataTables-controls'></div>");
            $("#productsTable_filter, #productsTable_length").wrapAll(controlsWrapper);
        });
    </script>

    <script>
        // Hiển thị modal khi nhấn nút "Thêm danh mục mới"
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
                    console.log(data); // Kiểm tra dữ liệu nhận được

                    if (data.success) {
                        alert('Danh mục đã được thêm thành công!');
                        $('#categoryModal').modal('hide'); // Đóng modal

                        // Cập nhật lại bảng với dữ liệu mới (thêm dòng mới vào bảng)
                        var table = $('#categoryTable').DataTable();
                        table.row.add([
                            data.categoryId,       // Cột 1: Mã danh mục (ID)
                            data.categoryName,     // Cột 2: Tên danh mục
                            '<button class="btn edit-btn btn-warning" onclick="updateCategory(' + data.categoryId + ')">Sửa</button>' +
                            '<button class="btn delete-btn btn-danger" onclick="deleteCategory(' + data.categoryId + ')">Xóa</button>'  // Cột 3: Hành động
                        ]).draw();
                    } else {
                        alert('Lỗi khi thêm danh mục! Chi tiết: ' + data.message);
                    }
                })
                .catch(error => {
                    console.error('Có lỗi xảy ra:', error);
                    alert('Có lỗi xảy ra. Vui lòng thử lại!');
                });
        });



    </script>


    <!-- Chức năng ẩn hiện thêm danh mục -->
    <script>
        $('.button-add').on("click", function() {
            $('#addCategoryModal').modal('show');
        });

        $('#confirmCancel').on("click", function() {
            $('#addCategoryModal').modal('hide');
        })

        let categoryNameAdd = null;

        // Xử lý sau khi nhấn xóa
        $('#confirmAddCategory').on('click', function () {
            categoryNameAdd = $('#categoryName').val();

            $.ajax({
                url: '/admin-category',
                type: 'POST',
                headers: {
                    'X-Requested-By': 'AJAX'
                },
                data: {
                    action: 'add',
                    category_name: categoryNameAdd
                },
                success: function (response) {
                    if (response.success) {
                        $(".alert-success span").text("Thêm thành công!");
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                            $(this).addClass("d-none");
                        });

                        location.reload();

                    } else {
                        $(".alert-danger span").text("Thêm thất bại!");
                        $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                            $(this).addClass("d-none");
                        });
                    }
                },
                error: function () {
                    alert('Đã xảy ra lỗi!');
                }
            });
        });


    </script>

    <!-- Xử lý xóa danh mục -->
    <script>
        let categoryIdToDelete = null;
        let parentElement = null;

        $('.delete-btn').on('click', function () {
            categoryIdToDelete = $(this).data('id');
            parentElement = $(this).closest("tr");
            // Lây nội dung ảnh hiển thị
            var categoryName = parentElement.find("td").eq(1).text().trim();
            $('#deleteModal .modal-body').html("Bạn có chắc chắn muốn xóa <strong>" + categoryName + "</strong>.");
            $('#deleteModal').modal('show');
        });

        // Xử lý sau khi nhấn xóa
        $('#confirmDelete').on('click', function () {
            if (categoryIdToDelete) {
                $.ajax({
                    url: '/admin-category',
                    type: 'POST',
                    headers: {
                        'X-Requested-By': 'AJAX'
                    },
                    data: {
                        action: 'delete',
                        category_id: categoryIdToDelete
                    },
                    success: function (response) {
                        if (response.success) {
                            $(".alert-success span").text("Xóa thành công!");
                            $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                                $(this).addClass("d-none");
                            });
                            parentElement.fadeOut(function () {
                                $(this).remove();
                            });
                        } else {
                            $(".alert-danger span").text("Xóa thất bại!");
                            $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                                $(this).addClass("d-none");
                            });
                        }
                    },
                    error: function () {
                        alert('Đã xảy ra lỗi!');
                    }
                });
            }
            $('#deleteModal').modal('hide');
        });
    </script>


</body>
</html>
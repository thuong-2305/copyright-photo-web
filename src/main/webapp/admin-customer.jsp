<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/admin-1.css">
    <link rel="stylesheet" href="assets/css/admin-nav.css">
    <link rel="stylesheet" href="assets/css/admin-dashboard.css"/>
    <jsp:include page="include/head-libraries.jsp"/>
    <!-- Bootstrap DateTimePicker CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css"/>
    <title>Admin</title>
</head>
<body>
<!-- MAIN -->
<section class="container-main">
    <!-- LEFT MAIN -->
    <jsp:include page="include/sidebar.jsp"/>
    <!-- LEFT MAIN -->

    <!-- RIGHT MAIN -->
    <section class="right-category">
        <!-- navbar admin -->
        <jsp:include page="include/nav-admin.jsp"/>

        <!-- Content main -->
        <div id="admin-dashboard-graph" class="view-products-main">
            <div class="mt-4 content-view">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold">Tài khoản người dùng</h5>
                    <div id="exportButtons">
                        <button class="btn add-btn btn-outline-primary fw-semibold ms-2"><i class="bi bi-person-plus">Thêm người dùng</i></button>
                        <button class="btn button-add fw-semibold"><i class="bi bi-plus-circle me-2"></i>Phân quyền người dùng</button>
                    </div>
                </div>

                <!-- Bảng user -->
                <div class="frame__container px-2">
                    <div class="card-body">
                        <table id="productsTable" class="table table-bordered">
                            <thead class="table-dark">
                            <tr>
                                <th>Mã user</th>
                                <th>Họ và tên</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Ngày tạo</th>
                                <th>Quyền hạn</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr>
                                    <td>${user.uid}</td>
                                    <td>${user.fullName}</td>
                                    <td>${user.username}</td>
                                    <td>${user.email}</td>
                                    <td>${user.createDate}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${user.role == 2}">Cấp 1</c:when>
                                            <c:when test="${user.role == 1}">Cấp 2</c:when>
                                            <c:when test="${user.role == 0}">Cấp 3</c:when>
                                            <c:otherwise>Không xác định</c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <div class="d-flex justify-content-start">
                                            <button class="btn edit-btn" data-id="${user.uid}"><i class="bi bi-pencil-square"></i></button>
                                            <button class="btn delete-btn" data-id="${user.uid}"><i class="fa-solid fa-trash"></i></button>
                                            <button class="btn lock-btn" data-id="${user.uid}"><i class="bi bi-lock"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Xác nhận xóa tài khoản -->
                    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title user-select-none" id="deleteModalLabel">
                                        <i class="bi bi-exclamation-triangle-fill" style="color: #fa2e2e;"></i>
                                        Xóa tài khoản
                                        </hisms5>
                                </div>
                                <div class="modal-body">
                                    Bạn có chắc chắn muốn xóa tài khoản này?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary rounded-pill fw-semibold" data-dismiss="modal">Hủy</button>
                                    <button type="button" id="confirmDelete" class="btn btn-danger rounded-pill fw-semibold">Xóa</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Khóa tài khoản -->
                    <div class="modal fade" id="lockModal" tabindex="-1" role="dialog" aria-labelledby="lockModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title user-select-none" id="lockModalLabel">
                                        <i class="bi bi-lock-fill" style="color: #fa2e2e;"></i>
                                        Khóa tài khoản
                                    </h5>
                                </div>
                                <div class="modal-body">
                                    <p>Bạn có muốn khóa tài khoản <strong id="lockUsername"></strong>?</p>
                                    <div class="form-group">
                                        <label for="lockUntil">Thời gian mở khóa:</label>
                                        <input type="text" class="form-control" id="lockUntil" name="lockUntil">
                                    </div>
                                    <div class="form-group">
                                        <label for="lockReason">Lý do khóa (tùy chọn):</label>
                                        <textarea class="form-control" id="lockReason" name="lockReason" rows="3"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary rounded-pill fw-semibold" data-dismiss="modal">Hủy</button>
                                    <button type="button" id="confirmLock" class="btn btn-danger rounded-pill fw-semibold">Khóa</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Chỉnh sửa thông tin user -->
                    <div class="overlay" id="overlay"></div>
                    <div class="view-modal d-none" id="userItem">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="fs-3 fw-semibold title-category-view">Chỉnh sửa thông tin:</h5>
                            <button class="btn-close" onclick="toggleUserDetail()"></button>
                        </div>
                        <hr>
                        <div class="product-info mt-2">
                            <h5 class="fw-semibold"><i class="bi bi-list-nested me-2"></i>Chi tiết tài khoản</h5>
                            <div class="show-content">
                                <p class="id-user"><span class="title-info fw-semibold">Mã tài khoản:</span> </p>
                                <p class="full-name"><span class="title-info fw-semibold">Họ và tên:</span> </p>
                                <p class="username"><span class="title-info fw-semibold">Username:</span> </p>
                                <p class="password"><span class="title-info fw-semibold">Mật khẩu:</span> </p>
                                <p class="email"><span class="title-info fw-semibold">Email:</span> </p>
                                <p class="date-create"><span class="title-info fw-semibold">Ngày tạo:</span> </p>
                                <p class="role"><span class="title-info fw-semibold">Quyền hạn:</span> </p>
                            </div>
                            <button id="update-user-btn" class="btn btn-outline-dark d-none">Cật nhật</button>
                            <button id="add-user-btn" class="btn btn-outline-success d-none">Thêm tài khoản</button>
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
<!-- Bootstrap DateTimePicker JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

<!-- JS -->
<jsp:include page="include/admin-libraries.jsp" />

<!-- Chức năng của dataTable -->
<script>
    $(document).ready(function () {
        const table = $('#productsTable').DataTable({
            deferRender: true,
            buttons: [
                { extend: 'copy', text: 'Sao chép' },
                { extend: 'excel', text: 'Xuất Excel' },
                { extend: 'print', text: 'In' }
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

        $('.dataTables_filter input').attr('placeholder', 'Tìm kiếm ...');
    });

    $(document).ready(function () {
        const controlsWrapper = $("<div class='dataTables-controls'></div>");
        $("#productsTable_filter, #productsTable_length").wrapAll(controlsWrapper);
    });
</script>

<!-- Khởi tạo DateTimePicker -->
<script>
    $(document).ready(function () {
        $('#lockUntil').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            minDate: moment(),
            useCurrent: false
        });
    });
</script>

<!-- Chức năng ẩn hiển xóa user -->
<script>
    $("#deleteModal .btn-secondary").on("click", function () {
        $("#deleteModal").modal("hide");
    });
</script>

<!-- Chức năng khóa user -->
<script>
    let userIdToLock = null;
    let lockParentElement = null;

    $('.lock-btn').on('click', function () {
        userIdToLock = $(this).data('id');
        lockParentElement = $(this).closest("tr");
        var username = lockParentElement.find("td").eq(2).text().trim();
        $('#lockModal #lockUsername').text(username);
        $('#lockModal').modal('show');
    });

    $('#confirmLock').on('click', function () {
        if (userIdToLock) {
            const lockUntil = $('#lockUntil').val();
            const lockReason = $('#lockReason').val();

            $.ajax({
                url: '/admin-customer',
                type: 'POST',
                headers: {
                    'X-Requested-By': 'AJAX'
                },
                data: {
                    action: 'lock',
                    user_id: userIdToLock,
                    lockUntil: lockUntil,
                    lockReason: lockReason
                },
                success: function (response) {
                    if (response.success) {
                        $(".alert-success span").text("Khóa tài khoản thành công!");
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                            $(this).addClass("d-none");
                        });
                    } else {
                        $(".alert-danger span").text("Khóa tài khoản thất bại!");
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
        $('#lockModal').modal('hide');
        $('#lockUntil').val('');
        $('#lockReason').val('');
    });
</script>

<!-- Xử lý xóa user -->
<script>
    let userIdToDelete = null;
    let parentElement = null;

    $('.delete-btn').on('click', function () {
        userIdToDelete = $(this).data('id');
        parentElement = $(this).closest("tr");
        var imageName = parentElement.find("td").eq(1).text().trim();
        $('#deleteModal .modal-body').html("Bạn có chắc chắn muốn xóa <strong>" + imageName + "</strong>.");
        $('#deleteModal').modal('show');
    });

    $('#confirmDelete').on('click', function () {
        if (userIdToDelete) {
            $.ajax({
                url: '/admin-customer',
                type: 'POST',
                headers: {
                    'X-Requested-By': 'AJAX'
                },
                data: {
                    action: 'delete',
                    user_id: userIdToDelete
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

<!-- Chỉnh sửa thông tin user -->
<script>
    $(document).on("click", ".edit-btn", function() {
        const userIdToEdit = $(this).data('id');
        parentElement = $(this).closest("tr");
        $('#userItem #add-user-btn').addClass("d-none");
        $('#userItem #update-user-btn').removeClass("d-none");
        $.ajax({
            url: '/admin-customer',
            type: 'POST',
            headers: {
                'X-Requested-By': 'AJAX'
            },
            data: {
                action: 'view',
                user_id: userIdToEdit
            },
            success: function (response) {
                const user = response.user;
                if (user) {
                    $('#userItem .id-user').html(
                        "<span class=\"title-info fw-semibold\">Mã tài khoản:</span>" +
                        "<br><input class=\"form-control\" name=\"uid\" value=\"" + user.uid + "\" disabled>"
                    );
                    $('#userItem .full-name').html(
                        "<span class=\"title-info fw-semibold\">Họ và tên:</span><br>" +
                        "<input class=\"form-control\" name=\"fullName\" value=\"" + user.fullName + "\">"
                    );
                    $('#userItem .username').html(
                        "<span class=\"title-info fw-semibold\">Username:</span><br>" +
                        "<input class=\"form-control\" name=\"username\" value=\"" + user.username + "\">"
                    );

                    $('#userItem .email').html(
                        "<span class=\"title-info fw-semibold\">Email:</span><br>" +
                        "<input class=\"form-control\" name=\"email\" type=\"email\" value=\"" + user.email + "\" disabled>"
                    );

                    $('#userItem .password').html(
                        "<span class=\"title-info fw-semibold\">Password:</span><br>" +
                        "<input class=\"form-control\" name=\"password\" type=\"password\" value=\"" + user.password + "\" disabled>"
                    );

                    $('#userItem .date-create').html(
                        "<span class=\"title-info fw-semibold\">Ngày tạo:</span><br>" +
                        "<input class=\"form-control\" name=\"createDate\" type=\"date\" value=\"" + user.createDate + "\" disabled>"
                    );

                    $('#userItem .role').html("");
                    toggleUserDetail();
                } else {
                    alert('Lỗi tài khoản!');
                }
            },
            error: function () {
                alert('Đã xảy ra lỗi!');
            }
        })
    })

    function toggleUserDetail() {
        const userItem = document.getElementById('userItem');
        userItem.classList.toggle('d-none');
        const overlay = document.getElementById("overlay");
        overlay.classList.toggle('show');
        document.body.classList.toggle('no-scroll');
    }

    $(document).on("click", "#update-user-btn", function () {
        const uid = $('input[name="uid"]').val();
        const fullName = $('input[name="fullName"]').val();
        const username = $('input[name="username"]').val();
        console.log(uid);
        $.ajax({
            url: '/admin-customer',
            type: 'POST',
            headers: {
                'X-Requested-By': 'AJAX'
            },
            data: {
                action: 'update',
                user_id: uid,
                fullName: fullName,
                username: username
            },
            success: function (response) {
                if (response.success) {
                    $(".alert-success span").text("Cập nhật thành công!");
                    $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                        $(this).addClass("d-none");
                    });

                    parentElement.find("td").eq(1).text(fullName);
                    parentElement.find("td").eq(2).text(username);
                } else {
                    $(".alert-danger span").text("Cập nhật thất bại!");
                    $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                        $(this).addClass("d-none");
                    });
                }
                toggleUserDetail();
            },
            error: function () {
                alert("Đã xảy ra lỗi!");
            }
        });
    });
</script>

<!-- Thêm thông tin user -->
<script>
    $(document).on("click", ".add-btn", function() {
        $('#userItem .id-user').html("");
        $('#userItem .full-name').html(
            "<span class=\"title-info fw-semibold\">Họ và tên:</span><br>" +
            "<input class=\"form-control\" name=\"fullName\">"
        );
        $('#userItem .username').html(
            "<span class=\"title-info fw-semibold\">Username:</span><br>" +
            "<input class=\"form-control\" name=\"username\" >"
        );

        $('#userItem .email').html(
            "<span class=\"title-info fw-semibold\">Email:</span><br>" +
            "<input class=\"form-control\" name=\"email\" type=\"email\">"
        );

        $('#userItem .password').html(
            "<span class=\"title-info fw-semibold\">Password:</span><br>" +
            "<input class=\"form-control\" name=\"password\" type=\"password\">"
        );

        $('#userItem .date-create').html("");

        $('#userItem .role').html(
            "<span class=\"title-info fw-semibold\">Quyen han:</span><br>" +
            "<select class=\"form-control\" name=\"role\" required>" +
            "<option value=\"\" disabled selected>-- Chọn vai trò --</option>" +
            "<option value=\"2\">Cấp 1 (Khách hàng)</option>" +
            "<option value=\"1\">Cấp 2 (Nhà cung cấp)</option>" +
            "<option value=\"0\">Cấp 3 (Quản trị viên)</option>");

        $('#userItem #add-user-btn').removeClass("d-none");
        $('#userItem #update-user-btn').addClass("d-none");
        toggleUserDetail();
    })

    $(document).on("click", "#add-user-btn", function () {
        const fullName = $('input[name="fullName"]').val();
        const username = $('input[name="username"]').val();
        const email = $('input[name="email"]').val();
        const pass = $('input[name="password"]').val();
        const role = $('select[name="role"]').val();

        $.ajax({
            url: '/admin-customer',
            type: 'POST',
            headers: {
                'X-Requested-By': 'AJAX'
            },
            data: {
                action: "add",
                fullName: fullName,
                username: username,
                email: email,
                pass: pass,
                role: role
            },
            success: function (response) {
                if (response.success) {
                    $(".alert-success span").text("Thêm user thành công!");
                    $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                        $(this).addClass("d-none");
                    });
                    location.reload();
                } else {
                    $(".alert-danger span").text("Cập nhật thất bại!");
                    $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                        $(this).addClass("d-none");
                    });
                }
                toggleUserDetail();
            },
            error: function () {
                alert("Đã xảy ra lỗi!");
            }
        });
    });
</script>
</body>
</html>
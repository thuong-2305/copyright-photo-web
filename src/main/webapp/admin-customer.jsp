<%@ page import="java.util.List" %>
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
    <title>Admin</title>

    <style>
        .view-product-add .card-body {
            background-color: #ffffff !important; /* Background trắng */
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* Bóng nhẹ */
        }

        .view-product-add .input-group {
            width: 50% !important;
        }

        .view-product-add .input-group input {
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .view-product-add .input-group input:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .view-product-add .form-select {
            transition: border-color 0.3s ease;
        }

        .view-product-add .form-select:focus {
            border-color: #007bff;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .view-product-add .btn-outline-primary {
            transition: background-color 0.3s ease, color 0.3s ease;
        }

        .view-product-add .btn-outline-primary:hover {
            background-color: #007bff;
            color: #ffffff;
        }

        .view-product-add .label-search {
            min-width: 150px;
        }

        .view-product-add .permission-group {
            margin-bottom: 15px;
        }

        .view-product-add .permission-group h6 {
            color: #333;
            border-bottom: 1px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 10px;
        }

        .view-product-add .permission-group .form-check {
            margin-bottom: 5px;
        }
    </style>
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
        <%
            List<Integer> permissions = (List<Integer>) request.getSession().getAttribute("permissions");
            boolean canEdit = permissions != null && permissions.contains(5);
            boolean canDelete = permissions != null && permissions.contains(6);
            boolean canCreate = permissions != null && permissions.contains(4);
            boolean canCreateUser = permissions != null && permissions.contains(9);
        %>
        <div id="admin-dashboard-graph" class="view-products-main">
            <div class="mt-4 content-view">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold">Tài khoản người dùng</h5>
                    <div id="exportButtons">
                        <% if(canCreate) {%>
                        <button class="btn add-btn btn-outline-primary fw-semibold ms-2"><i class="bi bi-person-plus">Thêm
                            người dùng</i></button>
                        <% } else { %>
                        <button class="btn add-btn-permission btn-outline-primary fw-semibold ms-2"><i class="bi bi-person-plus">Thêm
                            người dùng</i></button>
                        <% }%>

                        <% if(canCreateUser) {%>
                        <button class="btn button-add fw-semibold btn-permission"><i class="bi bi-plus-circle me-2"></i>Phân
                            quyền người dùng
                        </button>
                        <% } else { %>
                        <button class="btn button-add-permission fw-semibold btn-permission"><i class="bi bi-plus-circle me-2"></i>Phân
                            quyền người dùng
                        </button>
                        <% }%>
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
                                            <% if(canEdit) {%>
                                            <button class="btn edit-btn" data-id="${user.uid}"><i
                                                    class="bi bi-pencil-square"></i></button>
                                            <% } else { %>
                                            <button class="btn edit-btn-permission" data-id="${user.uid}"><i
                                                    class="bi bi-pencil-square"></i></button>
                                            <% } if(canDelete) {%>
                                            <button class="btn delete-btn" data-id="${user.uid}"><i
                                                    class="fa-solid fa-trash"></i></button>
                                            <% } else { %>
                                            <button class="btn delete-btn-permission" data-id="${user.uid}"><i
                                                    class="fa-solid fa-trash"></i></button>
                                            <% } %>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Xác nhận xóa tài khoản -->
                    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
                         aria-labelledby="deleteModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title user-select-none" id="deleteModalLabel">
                                        <i class="bi bi-exclamation-triangle-fill" style="color: #fa2e2e;"></i>
                                        Xóa tài khoản
                                    </h5>
                                </div>
                                <div class="modal-body">
                                    Bạn có chắc chắn muốn xóa tài khoản này này?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary rounded-pill fw-semibold"
                                            data-dismiss="modal">Hủy
                                    </button>
                                    <button type="button" id="confirmDelete"
                                            class="btn btn-danger rounded-pill fw-semibold">Xóa
                                    </button>
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
                                <p class="id-user"><span class="title-info fw-semibold">Mã tài khoản:</span></p>
                                <p class="full-name"><span class="title-info fw-semibold">Họ và tên:</span></p>
                                <p class="username"><span class="title-info fw-semibold">Username:</span></p>
                                <p class="password"><span class="title-info fw-semibold">Mật khẩu:</span></p>
                                <p class="email"><span class="title-info fw-semibold">Email:</span></p>
                                <p class="date-create"><span class="title-info fw-semibold">Ngày tạo:</span></p>
                                <p class="role"><span class="title-info fw-semibold">Quyền hạn:</span></p>
                            </div>
                            <button id="update-user-btn" class="btn btn-outline-dark d-none">Cật nhật</button>
                            <button id="add-user-btn" class="btn btn-outline-success d-none">Thêm tài khoản</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Phân quyền người dùng -->
        <div id="admin-dashboard-graph" class="view-product-add d-none" style="height: calc(100vh - 100px - 104px);">
            <div class="mt-4 content-view" style="max-height: calc(100vh - 100px - 104px); overflow-y: auto;">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold name-function">Phân quyền người dùng</h5>
                    <div id="returnButton">
                        <button class="btn button-back fw-semibold">
                            <i class="bi bi-arrow-return-left me-2"></i>Trở lại
                        </button>
                    </div>
                </div>
                <div class="frame__container px-2">
                    <div class="card-body p-4">
                        <!-- Tìm kiếm và chọn người dùng -->
                        <div class="mb-4">
                            <div class="d-flex align-items-center mb-2">
                                <label for="userSearch" class="secondary-color form-label me-3 label-search">Tìm kiếm người dùng</label>
                                <div class="input-group flex-grow-1">
                                    <input
                                            id="userSearch"
                                            type="text"
                                            class="form-control"
                                            placeholder="Nhập username hoặc email..."
                                    >
                                    <span class="input-group-text">
                                        <i class="bi bi-search"></i>
                                    </span>
                                </div>
                            </div>
                            <label for="userSelect" class="form-label fw-semibold me-3">Chọn người dùng muốn phân quyền</label>
                            <select id="userSelect" class="form-select">
                                <option value="">Chọn một người dùng</option>
                                <c:forEach var="user" items="${users}">
                                    <option value="${user.uid}" data-email="${user.email}">${user.username}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Thông tin user và quyền hạn hiện tại -->
                        <div id="roleUser" class="mb-4 d-none">
                            <h6 class="fw-semibold mb-3">Cấp độ quyền hạn</h6>
                            <div class="d-flex justify-content-start align-items-center">
                                <p class="fs-5 mb-0">Quyền hạn: <strong class="role"></strong></p>
                                <i class="bi bi-repeat ms-3 change-role" style="cursor: pointer;"></i>
                                <!-- Dropdown để thay đổi role -->
                                <select id="changeRoleSelect" class="form-select ms-3 d-none" style="width: 150px;">
                                    <option value="2">Cấp 1 (User)</option>
                                    <option value="1">Cấp 2 (Seller)</option>
                                    <option value="0">Cấp 3 (Admin)</option>
                                </select>
                            </div>
                        </div>

                        <!-- Danh sách quyền hiện tại -->
                        <div id="permissionList" class="mb-4 d-none">
                            <h6 class="fw-semibold mb-3">Danh sách quyền hiện tại</h6>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover">
                                    <thead class="table-dark">
                                    <tr>
                                        <th scope="col">Quyền</th>
                                        <th scope="col">Hành động</th>
                                    </tr>
                                    </thead>
                                    <tbody id="permissionTableBody"></tbody>
                                </table>
                            </div>
                        </div>

                        <!-- Thêm quyền mới -->
                        <div id="addPermissionSection" class="d-none">
                            <h6 class="fw-semibold mb-3">Thêm quyền mới</h6>
                            <!-- Nhóm quyền cho User -->
                            <div class="permission-group">
                                <h6>User</h6>
                                <c:forEach var="permission" items="${permissions}">
                                    <c:if test="${permission.idPermission == 1}">
                                        <div class="form-check">
                                            <input
                                                    type="checkbox"
                                                    class="form-check-input"
                                                    id="permission_${permission.idPermission}"
                                                    value="${permission.idPermission}"
                                                    name="permissions"
                                            >
                                            <label class="form-check-label" for="permission_${permission.idPermission}">
                                                    ${permission.description}
                                            </label>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>

                            <!-- Nhóm quyền cho Seller -->
                            <div class="permission-group">
                                <h6>Seller</h6>
                                <c:forEach var="permission" items="${permissions}">
                                    <c:if test="${permission.idPermission == 2 || permission.idPermission == 3}">
                                        <div class="form-check">
                                            <input
                                                    type="checkbox"
                                                    class="form-check-input"
                                                    id="permission_${permission.idPermission}"
                                                    value="${permission.idPermission}"
                                                    name="permissions"
                                            >
                                            <label class="form-check-label" for="permission_${permission.idPermission}">
                                                    ${permission.description}
                                            </label>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>

                            <!-- Nhóm quyền cho Admin -->
                            <div class="permission-group">
                                <h6>Admin</h6>
                                <c:forEach var="permission" items="${permissions}">
                                    <c:if test="${permission.idPermission >= 4 && permission.idPermission <= 9}">
                                        <div class="form-check">
                                            <input
                                                    type="checkbox"
                                                    class="form-check-input"
                                                    id="permission_${permission.idPermission}"
                                                    value="${permission.idPermission}"
                                                    name="permissions"
                                            >
                                            <label class="form-check-label" for="permission_${permission.idPermission}">
                                                    ${permission.description}
                                            </label>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>

                            <button
                                    id="addPermissionBtn"
                                    class="btn btn-outline-primary fw-semibold mt-2"
                            >
                                Thêm quyền
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- footer-admin -->
        <jsp:include page="include/admin-footer.jsp"/>
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
<jsp:include page="include/admin-libraries.jsp"/>

<!-- Chức năng của dataTable -->
<script>
    let table;

    $(document).ready(function () {
        table = $('#productsTable').DataTable({
            deferRender: true,
            buttons: [
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
                paginate: {previous: "←", next: "→"}
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

<!-- Chức năng ẩn hiện thêm phân quyền -->
<script>
    $('.button-add-permission').on("click", function () {
        $(".alert-danger span").text("Bạn không có quyền thực hiện chức năng này!");
        $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
            $(this).addClass("d-none");
        });
    });
    $('.button-add').on("click", function () {
        $('.view-products-main').toggleClass("d-none");
        $('.view-product-add').toggleClass("d-none");
    });

    $('.button-back').on("click", function () {
        location.reload()
    });

    document.addEventListener('DOMContentLoaded', function() {
        const userSearch = document.getElementById('userSearch');
        const userSelect = document.getElementById('userSelect');
        const options = userSelect.getElementsByTagName('option');

        userSearch.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            for (let option of options) {
                if (option.value === '') continue;
                const username = option.text.toLowerCase();
                const email = option.getAttribute('data-email').toLowerCase();
                option.style.display = (username.includes(searchTerm) || email.includes(searchTerm)) ? '' : 'none';
            }
        });
    });
</script>

<!-- Phân quyền usẻr -->
<script>
    let assignedPermissionIds = [];

    function togglePermissionView() {
        const userView = document.getElementById('admin-dashboard-graph');
        const permissionView = document.getElementById('admin-dashboard-permission');
        userView.classList.toggle('d-none');
        permissionView.classList.toggle('d-none');
    }


    // Xử lý khi chọn người dùng
    $(document).ready(function () {
        $('#userSelect').change(function () {
            const uid = $(this).val();
            if (uid) {
                $('#permissionList').removeClass('d-none');
                $('#addPermissionSection').removeClass('d-none');
                getRoleUser(uid);
                loadPermissions(uid);
            } else {
                $('#permissionList').addClass('d-none');
                $('#addPermissionSection').addClass('d-none');
                $('#roleUser').addClass('d-none');
            }
        });

        function getRoleUser(uid) {
            $.ajax({
                url: '/admin-customer',
                type: 'POST',
                headers: {
                    'X-Requested-By': 'AJAX'
                },
                data: {
                    action: 'view',
                    user_id: uid
                },
                success: function(response) {
                    $('#roleUser').removeClass('d-none');
                    if (response.success && response.user) {
                        console.log(response)
                        const roleValue = response.user.role;
                        console.log(roleValue)
                        switch (roleValue) {
                            case 2:
                                roleText = 'User (Cấp 1)';
                                break;
                            case 1:
                                roleText = 'Seller (Cấp 2)';
                                break;
                            case 0:
                                roleText = 'Admin (Cấp 3)';
                                break;
                            default:
                                roleText = 'Không xác định';
                        }
                        $('#roleUser .role').text(roleText);
                    } else {
                        $('#roleUser .role').text('Lỗi khi lấy dữ liệu');
                    }
                },
                error: function() {
                    $('#roleUser .role').text('Lỗi kết nối server');
                }
            });
        }

        $('.change-role').click(function () {
            $('#changeRoleSelect').toggleClass('d-none'); // Toggle dropdown
        });

        $('#changeRoleSelect').change(function () {
            const uid = $('#userSelect').val();
            const newRole = parseInt($(this).val());

            if (!uid) {
                showErrorNotification('Vui lòng chọn người dùng!');
                return;
            }

            // Gửi AJAX để cập nhật role
            $.ajax({
                url: '/admin-customer',
                method: 'POST',
                headers: {
                    'X-Requested-By': 'AJAX'
                },
                data: {
                    action: 'updateRole',
                    user_id: uid,
                    role: newRole
                },
                success: function (response) {
                    try {
                        if (response.success) {
                            showSuccessNotification('Cập nhật quyền hạn thành công!');
                            getRoleUser(uid); // Tải lại thông tin role
                            loadPermissions(uid); // Tải lại danh sách quyền
                            $('#changeRoleSelect').addClass('d-none'); // Ẩn dropdown sau khi cập nhật
                        } else {
                            showErrorNotification('Cập nhật quyền hạn thất bại!');
                        }
                    } catch (e) {
                        showErrorNotification('Lỗi phân tích dữ liệu!');
                    }
                },
                error: function () {
                    showErrorNotification('Lỗi kết nối server!');
                }
            });
        });

        // Xử lý thêm quyền
        $('#addPermissionBtn').click(function () {
            const uid = $('#userSelect').val();
            const userRole = parseInt($('#userSelect option:selected').data('role'));
            const selectedPermissions = [];

            // Lấy danh sách quyền được chọn từ checkbox
            $('.permission-group .form-check-input:checked').each(function () {
                selectedPermissions.push(parseInt($(this).val()));
            });

            if (!uid) {
                showErrorNotification('Vui lòng chọn người dùng!');
                return;
            }

            if (selectedPermissions.length === 0) {
                showErrorNotification('Vui lòng chọn ít nhất một quyền!');
                return;
            }

            // Kiểm tra quyền có vượt quá cấp quyền hạn của user không
            let canAdd = true;
            let errorMessage = '';

            selectedPermissions.forEach(function (idPermission) {
                if (userRole === 2) { // User (cấp 1)
                    if (idPermission !== 1) {
                        canAdd = false;
                        errorMessage = 'User chỉ có thể được cấp quyền "Đăng ký bán"!';
                    }
                } else if (userRole === 1) { // Seller (cấp 2)
                    if (idPermission > 3) {
                        canAdd = false;
                        errorMessage = 'Seller chỉ có thể được cấp quyền từ "Đăng ký bán" đến "Xóa sản phẩm đã upload"!';
                    }
                }
                // Admin (role = 0) có thể cấp tất cả quyền, không cần kiểm tra
            });

            if (!canAdd) {
                showErrorNotification(errorMessage);
                return;
            }

            // Gửi từng quyền được chọn qua AJAX
            selectedPermissions.forEach(function (idPermission) {
                $.ajax({
                    url: '/permissions',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ uid: parseInt(uid), idPermission: idPermission }),
                    success: function (response) {
                        showSuccessNotification('Thêm quyền thành công!');
                        loadPermissions(uid);
                    },
                    error: function () {
                        showErrorNotification('Thêm quyền thất bại!');
                    }
                });
            });
        });
    });

    // Tải danh sách quyền của người dùng
    function loadPermissions(uid) {
        if (!uid) {
            showErrorNotification('UID không hợp lệ!');
            return;
        }

        $.ajax({
            url: '/permissions/' + uid, // Sửa URL thành /permissions/{uid}
            method: 'GET',
            success: function (permissions) {
                const tbody = $('#permissionTableBody');
                tbody.empty();
                console.log(permissions)
                assignedPermissionIds = [];
                permissions.forEach(function (perm) {
                    assignedPermissionIds.push(perm.idPermission);
                    tbody.append(
                        '<tr>' +
                        '<td class="text-start">' + perm.name + '</td>' +
                        '<td>' +
                        '<button class="btn btn-outline-danger remove-permission-btn" data-id="' + perm.idPR + '">' +
                        '<i class="fa-solid fa-trash"></i>' +
                        '</button>' +
                        '</td>' +
                        '</tr>'
                    );
                });

                // Gọi hàm đồng bộ checkbox
                syncCheckboxPermissions();

                console.log(assignedPermissionIds)
            },
            error: function (xhr, status, error) {
                console.log('Error loading permissions:', xhr.responseText, status, error); // Log chi tiết lỗi
                showErrorNotification('Tải danh sách quyền thất bại: ' + (xhr.responseText || 'Lỗi không xác định'));
            }
        });
    }

    $('#permissionTableBody').on('click', '.remove-permission-btn', function () {
        const idPR = $(this).data('id');
        const uid = $('#userSelect').val(); // Lấy lại UID đã chọn

        $.ajax({
            url: '/admin/permissions/remove',
            method: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify({ uid: parseInt(uid), idPR: parseInt(idPR) }),
            success: function () {
                showSuccessNotification('Xóa quyền thành công!');
                loadPermissions(uid);
            },
            error: function () {
                showErrorNotification('Xóa quyền thất bại!');
            }
        });
    });

    function syncCheckboxPermissions() {
        const userRole = parseInt($('#userSelect option:selected').data('role'));

        $('.permission-group .form-check-input').each(function () {
            const checkbox = $(this);
            const idPermission = parseInt(checkbox.val());

            const isAssigned = assignedPermissionIds.includes(idPermission);
            let isAllowed = true;

            // Kiểm tra nếu quyền vượt quá cấp người dùng thì không cho tick/disabled
            if (userRole === 2 && idPermission !== 1) {
                isAllowed = false;
            } else if (userRole === 1 && idPermission > 3) {
                isAllowed = false;
            }

            if (isAssigned) {
                checkbox.prop('checked', true);
                checkbox.prop('disabled', true); // Đã được cấp -> không cho hủy
            } else if (!isAllowed) {
                checkbox.prop('checked', false);
                checkbox.prop('disabled', true); // Không đủ cấp để chọn quyền này
            } else {
                checkbox.prop('checked', false);
                checkbox.prop('disabled', false); // Có thể chọn
            }
        });
    }

    $('#userSelect').change(function () {
        const uid = $(this).val();
        if (uid) {
            $('#permissionList').removeClass('d-none');
            $('#addPermissionSection').removeClass('d-none');
            loadPermissions(uid);
        }
    });

    // Hiển thị thông báo thành công
    function showSuccessNotification(message) {
        const alert = $('.alert-success');
        alert.find('span').text(message);
        alert.removeClass('d-none').show();
        setTimeout(() => alert.fadeOut(() => alert.addClass('d-none')), 3000);
    }

    // Hiển thị thông báo lỗi
    function showErrorNotification(message) {
        const alert = $('.alert-danger');
        alert.find('span').text(message);
        alert.removeClass('d-none').show();
        setTimeout(() => alert.fadeOut(() => alert.addClass('d-none')), 3000);
    }
</script>

<!-- Chức năng ẩn hiển xóa user -->
<script>
    $("#deleteModal .btn-secondary").on("click", function () {
        $("#deleteModal").modal("hide");
    });
</script>

<!-- Xử lý xóa user -->
<script>
    let userIdToDelete = null;
    let parentElement = null;

    $('.delete-btn-permission').on('click', function () {
        $(".alert-danger span").text("Bạn không có quyền thực hiện chức năng này!");
        $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
            $(this).addClass("d-none");
        });
    });

    $('.delete-btn').on('click', function () {
        userIdToDelete = $(this).data('id');
        parentElement = $(this).closest("tr");
        // Lây nội dung ảnh hiển thị
        var imageName = parentElement.find("td").eq(1).text().trim();
        $('#deleteModal .modal-body').html("Bạn có chắc chắn muốn xóa <strong>" + imageName + "</strong>.");
        $('#deleteModal').modal('show');
    });

    // Xử lý sau khi nhấn xóa
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
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                            $(this).addClass("d-none");
                        });
                        parentElement.fadeOut(function () {
                            $(this).remove();
                        });
                    } else {
                        $(".alert-danger span").text("Xóa thất bại!");
                        $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
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
    $(document).on("click", ".edit-btn", function () {
        $(".alert-danger span").text("Bạn không có quyền thực hiện chức năng này!");
        $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
            $(this).addClass("d-none");
        });
    });
    $(document).on("click", ".edit-btn", function () {
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
                    // Hiển thị thông tin user
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

                    $('#userItem .role').html("")
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

    // Xử lý khi nhấp cập nhật
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
                    $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                        $(this).addClass("d-none");
                    });

                    parentElement.find("td").eq(1).text(fullName);
                    parentElement.find("td").eq(2).text(username);
                } else {
                    $(".alert-danger span").text("Cập nhật thất bại!");
                    $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
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
    $(document).on("click", ".add-btn", function () {
        // Hiển thị thêm thông tin
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

    // Xử lý khi chọn thêm
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
                    $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                        $(this).addClass("d-none");
                    });
                    location.reload();
                } else {
                    $(".alert-danger span").text("Cập nhật thất bại!");
                    $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
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

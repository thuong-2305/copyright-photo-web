<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <%-- CSS--%>
    <link rel="stylesheet" href="assets/css/admin-1.css">
    <link rel="stylesheet" href="assets/css/admin-nav.css">
    <link rel="stylesheet" href="assets/css/admin-dashboard.css"/>
    <jsp:include page="include/head-libraries.jsp"/>
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
        <%
            List<Integer> permissions = (List<Integer>) request.getSession().getAttribute("permissions");
            boolean canUpdateReject = permissions != null && permissions.contains(7);
        %>
        <div id="admin-dashboard-graph" class="view-products-main">
            <div class="mt-4 content-view">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold">Danh sách các ảnh chờ xác nhận</h5>
                    <div id="exportButtons">
                    </div>
                </div>

                <div class="frame__container px-2">
                    <div class="card-body">
                        <table id="productsTable" class="table table-bordered table-striped">
                            <colgroup>
                                <col style="width: 5%;">
                                <col style="width: 30%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 20%;">
                            </colgroup>
                            <thead class="table-dark">
                                <tr>
                                    <th>STT</th>
                                    <th>Tên ảnh</th>
                                    <th>Mã người bán</th>
                                    <th>Hình ảnh</th>
                                    <th>Thời gian</th>
                                    <th>Hành động</th>
                                </tr>
                            </thead>
                            <tbody>
                            <!-- Ví dụ -->
                            <c:forEach var="product" items="${products}" varStatus="status">
                                <tr>
                                    <td>${status.index + 1}</td>
                                    <td>${product.name}</td>
                                    <td>${product.uid}</td>
                                    <td>
                                        <img src="${product.url}" alt="Product Image"
                                             style="width:60px; height:60px; border-radius:5px;">
                                    </td>
                                    <td>${product.formatDateUpload}</td>
                                    <td>
                                        <% if(canUpdateReject) {%>
                                        <button
                                            data-id='${product.id}'
                                            class="btn btn-primary text-light text-decoration-none btn-accept"
                                        >Accept
                                        </button>

                                        <button
                                                data-id='${product.id}'
                                                class="btn btn-danger text-light text-decoration-none btn-reject"
                                        >Reject
                                        </button>
                                        <% } else { %>
                                        <button
                                                data-id='${product.id}'
                                                class="btn btn-primary text-light text-decoration-none btn-accept-permission"
                                        >Accept
                                        </button>

                                        <button
                                                data-id='${product.id}'
                                                class="btn btn-danger text-light text-decoration-none btn-reject-permission"
                                        >Reject
                                        </button>
                                        <% } %>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
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
<script src="./assets/js/admin-notification.js"></script>


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
    $('.btn-accept-permission, .btn-reject-permission').on("click", function() {
        $(".alert-danger span").text("Bạn không có quyền thực hiện chức năng này!");
        $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
            $(this).addClass("d-none");
        });
    });
</script>

</body>
</html>

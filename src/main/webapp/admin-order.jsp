<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/13/2025
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

        .card-body {
            overflow: hidden; !important;
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
    <jsp:include page="include/sidebar.jsp" />
    <!-- LEFT MAIN -->

    <!-- RIGHT MAIN -->
    <section class="right-category">
        <main>
            <div class="frame">
                <div class="frame__container">
                    <div class="mt-4">
                        <div class="frame_manager header d-flex justify-content-between align-items-center mb-3">
                            <h2>Quản lý đơn hàng</h2>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <table id="productsTable" class="table table-bordered table-striped">
                                <colgroup>
                                    <col style="width: 10%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 20%;">
                                    <col style="width: 25%;">
                                </colgroup>
                                <thead class="table-dark">
                                <tr>
                                    <th>Mã đơn hàng</th>
                                    <th>Tên KH</th>
                                    <th>Trạng thái</th>
                                    <th>Tổng tiền</th>
                                    <th>Ngày mua</th>
                                </tr>
                                </thead>
                                <tbody>
                                <!-- Ví dụ -->
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td>${order.orderId}</td>
                                        <td>${order.customerName}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.status == 'Completed'}">
                                                    Hoàn thành
                                                </c:when>
                                                <c:otherwise>
                                                    Hủy
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td><fmt:formatNumber value="${order.totalPrice}" /> đ</td>
                                        <td>${order.orderDate}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </section>
    <!-- RIGHT MAIN -->
</section>
<!-- MAIN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="./assets/js/admin.js"></script>
<script src="./assets/js/admin-dashboard.js"></script>
<script src="./assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function () {
        var table = $('#productsTable').DataTable({
            buttons: ['copy', 'excel', 'print', 'excel', 'csv'],
            language: {
                search: "Nhập từ khóa:",
                lengthMenu: "Hiển thị _MENU_ mục",
                info: "Hiển thị _START_ đến _END_ của _TOTAL_ mục",
                infoEmpty: "Không có dữ liệu để hiển thị",
                infoFiltered: "(lọc từ _MAX_ mục)",
                paginate: {
                    previous: "Trước",
                    next: "Tiếp"
                }
            },
            scrollX: true
        });
        table.buttons().container().appendTo('#productsTable_wapper .col-md-6:eq(0)');
        // Thay đổi placeholder của khung tìm kiếm
        var search = $('.dataTables_filter input');
        search.attr('text', 'Tìm kiếm');
        search.attr('placeholder', 'Tìm kiếm sản phẩm ...');
    });
</script>

</body>
</html>

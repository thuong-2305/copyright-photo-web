<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/admin-order.css">
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
                    <h5 class="fw-semibold">Quản lý đơn hàng</h5>
                    <div id="exportButtons">
                    </div>
                </div>

                <div class="frame__container px-2">
                    <div class="card-body">
                        <table id="productsTable" class="table table-bordered">
                            <colgroup>
                                <col style="width: 13%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 20%">
                                <col style="width: 10%;">
                                <col style="width: 10%">
                            </colgroup>
                            <thead class="table-dark">
                            <tr>
                                <th>Mã đơn hàng</th>
                                <th>Tên KH</th>
                                <th>Ngày mua</th>
                                <th>Tổng tiền</th>
                                <th>Phương thức thanh toán</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Ví dụ -->
                            <c:forEach var="order" items="${orders}">
                                <tr>
                                    <td>${order.orderId}</td>
                                    <td>${order.customerName}</td>
                                    <td>${order.formatOrderDateTime}</td>
                                    <td><fmt:formatNumber value="${order.totalPrice}" /> đ</td>
                                    <td>${order.paymentTypeName}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${order.status == 'Completed'}">
                                                <span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: green; background: #d1e7dd">
                                                    Đã giao
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: red; background: #fee0e3">
                                                    Hủy
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <button class="btn view-btn" data-id="${order.orderId}"><i class="bi bi-eye-fill"></i></button>
                                        <button class="btn delete-btn" data-id="${order.orderId}"><i class="fa-solid fa-trash"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Xác nhận xóa đơn hàng -->
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
                                    <button type="button" id="confirmCancelDelete" class="btn btn-secondary rounded-pill fw-semibold" data-dismiss="modal">Hủy</button>
                                    <button type="button" id="confirmDelete" class="btn btn-danger rounded-pill fw-semibold">Xóa</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Content add product -->
        <div id="admin-dashboard-graph" class="view-product-add d-none">
            <div class="mt-4 content-view">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold name-function">Chi tiết đơn hàng</h5>
                    <div id="returnButton">
                        <button class="btn button-back fw-semibold">
                            <i class="bi bi-arrow-return-left me-2"></i>Trở lại
                        </button>
                    </div>
                </div>

                <div class="frame__container px-2">
                    <div class="row add-product">
                        <!-- Details Section -->
                        <div class="col-md-6">
                            <div class="card position-relative card-first">
                                <div class="title-details d-flex justify-content-between align-items-center">
                                    <h6 class="fw-semibold">Chi tiết</h6>
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <small>Hoàn thành</small>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Hoàn thành</a></li>
                                            <li><a class="dropdown-item" href="#">Hủy</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center mt-3">
                                    <img src="assets/images/avart-default.png" alt="" class="img-fluid me-3" style="width: 50px; height: 50px;">
                                    <p class="mb-0 fw-semibold">Black Winter Shoes</p>
                                    <span class="ms-auto fw-semibold">$93.56</span>
                                </div>
                                <hr>
                                <div class="detail-price">
                                    <p><small>Tạm tính: </small><span class="float-end">$93.56</span></p>
                                    <p class=""><small>Giảm: </small><span class="float-end text-danger">-$10</span></p>
                                    <h5><small class="fw-semibold">Tổng: </small><span class="float-end">$83.56</span></h5>
                                </div>
                            </div>

                            <!-- Lịch sử -->
                            <div class="card p-3 mt-4 position-relative">
                                <h6 class="fw-semibold">Lịch sử</h6>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="timeline mt-3">
                                            <div class="timeline-item">
                                                <small class="fw-semibold">Thanh toán thành công</small>
                                                <p class="payment-success">03 Sep 2023 3:33 PM</p>
                                            </div>
                                            <div class="timeline-item">
                                                    <small class="fw-semibold">Đơn hàng được tạo</small>
                                                <p class="time-create">03 Sep 2023 3:36 PM</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="details-box">
                                            <p><small class="fw-semibold">Thời gian đặt hàng</small><br><span class="time-create">03 Sep 2023 3:33 PM</span></p>
                                            <p><small class="fw-semibold">Thời gian thanh toán</small><br><psan class="payment-success">03 Sep 2023 3:34 PM</psan></p>
<%--                                            <p><small class="fw-semibold">Thời gian gửi hàng</small><br>04 Sep 2023 3:35 PM</p>--%>
<%--                                            <p><small class="fw-semibold">Thời gian hoàn thành</small><br>03 Sep 2023 3:36 PM</p>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Properties Section -->
                        <div class="col-md-6">
                            <div class="card">
                                <div class="col-md-12 position-relative">
                                    <div class="card p-3 mb-3">
                                        <h6 class="fw-semibold">Thông tin khách hàng</h6>
                                        <div class="d-flex align-items-center mt-3">
                                            <img src="assets/images/avart-default.png" alt="John Bushmill" class="rounded-circle me-3" style="width: 50px; height: 50px;">
                                            <div>
                                                <p class="mb-0 fw-semibold fullName">John Bushmill</p>
                                                <small class="email">john_bushmill@gmail.com</small>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card p-3 mb-3 position-relative">
                                    <div class="line-dashed"></div>
                                    <h6 class="fw-semibold mt-3">Vận chuyển</h6>
                                    <p>Gửi từ: <span class="float-end text-primary">@CopyrightPhoto</span></p>
                                    <p>Mã đơn hàng: <span class="float-end id-order"></span></p>
                                    <p>Email nhận: <span class="float-end email"></span></p>
                                </div>

                                <div class="card p-3 mb-3 position-relative">
                                    <div class="line-dashed"></div>
                                    <h6 class="fw-semibold mt-3">Thanh toán</h6>
                                    <p>Loại thanh toán: <span class="float-end type-payment"></span></p>
                                    <p>Ngày có hiệu lực: <span class="float-end received-date"></span></p>
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

<!-- Chức năng ẩn hiện chi tiết đơn hàng -->
<script>
    $(document).ready(function () {
        $(".view-btn").on("click", function () {
            $('.view-products-main').toggleClass("d-none");
            $('.view-product-add').toggleClass("d-none");

            const orderId = $(this).data('id');
            $.ajax({
                url: '/admin-order',
                type: 'POST',
                header: {
                    'X-requested-by': 'AJAX'
                },
                data: {
                    order_id: orderId
                },
                success: function(response) {
                    console.log(response.order)
                    // Xóa nội dung cũ nếu có
                    $('.card-first').empty();
                    $('.fullName').text(response.order.fullName);
                    $('.email').text(response.order.email);
                    $('.id-order').text(response.order.orderId)
                    $('.type-payment').text(response.order.paymentTypeName)
                    $('.received-date').text(response.order.formatOrderPaymentDateTime)
                    $('.time-create').text(response.order.formatDateTime)
                    $('.payment-success').text(response.order.formatOrderPaymentDateTime)

                    // Tạo HTML mới từ dữ liệu response
                    let html = '<div class="title-details d-flex justify-content-between align-items-center">' +
                        '<h6 class="fw-semibold">Chi tiết</h6>' +
                        '<div class="dropdown">' +
                        '<button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">' +
                        '<small>Hoàn thành</small>' +
                        '</button>' +
                        '<ul class="dropdown-menu">' +
                        '<li><a class="dropdown-item" href="#">Hoàn thành</a></li>' +
                        '<li><a class="dropdown-item" href="#">Hủy</a></li>' +
                        '</ul>' +
                        '</div>' +
                        '</div>';

                    // Thêm từng sản phẩm vào HTML
                    let subtotal = 0;
                    const orderDetails = response.orderDetails
                    for (let i = 0; i < orderDetails.length; i++) {
                        let item = orderDetails[i];
                        const product = item.product;
                        let productUrl = product.url;

                        html += '<div class="d-flex align-items-center mt-3">' +
                            '<img src="' + productUrl + '" alt="' + product?.name + '" ' +
                            'class="img-fluid me-3 rounded" style="width: 50px; height: 50px;">' +
                            '<p class="mb-0">' + product.name + '</p>' +
                            '<span class="ms-auto fw-semibold">' + formatCurrency(product.price) + '</span>' +
                            '</div>';

                        subtotal += product.price;
                    }

                    // Tính toán tổng tiền (giả sử có giảm giá 10%)
                    let discount = subtotal * response.order.promotionPercent;
                    let total = subtotal - discount;

                    // Thêm phần tổng kết
                    html += '<hr><div class="detail-price">' +
                        '<p><small>Tạm tính: </small><span class="float-end">' + formatCurrency(subtotal) + '</span></p>' +
                        '<p class=""><small>Giảm: </small><span class="float-end text-danger">-' + formatCurrency(discount) + '</span></p>' +
                        '<h5><small class="fw-semibold">Tổng: </small><span class="float-end">' + formatCurrency(total) + '</span></h5>' +
                        '</div>';

                    // Thêm HTML vào card
                    $('.card-first').html(html);

                },
                error: function() {
                    alert('Đã xảy ra lỗi khi cập nhật!');
                }
            })
        })

        $('.button-back').on("click", function() {
            $('.view-products-main').toggleClass("d-none");
            $('.view-product-add').toggleClass("d-none");
        });

    });

    function formatCurrency(amount) {
        return new Intl.NumberFormat('vi-VN', {
            style: 'currency',
            currency: 'VND'
        }).format(amount);
    }
</script>

<!-- Xử lý xóa danh mục -->
<script>
    let parentElement = null;

    $('.delete-btn').on('click', function () {
        orderIdToDelete = $(this).data('id');
        parentElement = $(this).closest("tr");
        $('#deleteModal .modal-body').html("Bạn có chắc chắn muốn xóa đơn này này");
        $('#deleteModal').modal('show');
    });

    // Xử lý sau khi nhấn xóa
    $('#confirmDelete').on('click', function () {
        console.log("Clicked,", orderIdToDelete);
        if (orderIdToDelete) {
            $.ajax({
                url: '/AdminHandleDeleteOrder',
                type: 'POST',
                headers: {
                    'X-Requested-By': 'AJAX'
                },
                data: {
                    action: 'delete',
                    order_id: orderIdToDelete
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

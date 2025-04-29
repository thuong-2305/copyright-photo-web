<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- CSS -->
    <link rel="stylesheet" href="./assets/css/admin-products.css"/>
    <link rel="stylesheet" href="./assets/css/admin-1.css"/>
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
        <div id="admin-dashboard-graph">
            <div class="mt-4 content-view">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold">Các sản phẩm</h5>
                    <div id="exportButtons">
                        <button class="btn button-add fw-semibold"><i class="bi bi-plus-circle me-2"></i>Thêm sản phẩm</button>
                    </div>
                </div>

                <!-- Bảng sản phẩm -->
                <div class="frame__container px-2">
                    <div class="card-body">
                        <table id="productsTable" class="table table-bordered">
                            <colgroup>
                                <col style="width: 5%;">
                                <col style="width: 35%;">
                                <col style="width: 10%;">
                                <col style="width: 15%;">
                                <col style="width: 12%;">
                                <col style="width: 13%;">
                                <col style="width: 20%;">
                            </colgroup>
                            <thead class="table-dark">
                            <tr>
                                <th>Mã</th>
                                <th>Tên</th>
                                <th>Username</th>
                                <th>Ngày thêm</th>
                                <th>Giá</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- Nội dung hiên thị -->
                            <c:forEach var="product" items="${products}">
                                <tr>
                                    <!-- Mã -->
                                    <td>#${product.id}</td>
                                    <!-- Tên -->
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <img src="${product.url}" alt="" style="width: 40px; height: 40px; border-radius: 5px;">
                                            <span class="ms-3">${product.name}</span>
                                        </div>
                                    </td>
                                    <!-- Username -->
                                    <td>${product.username}</td>
                                    <!-- Ngày thêm -->
                                    <td>${product.formatDateUpload}</td>
                                    <!-- Giá -->
                                    <td><fmt:formatNumber value="${product.price}" pattern="#,###"/>đ</td>
                                    <!-- Trạng thái -->
                                    <td>
                                        <c:choose>
                                            <c:when test="${product.status == 'accepted'}">
                                                <span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: green; background: #d1e7dd">
                                                    Accepted
                                                </span>
                                            </c:when>
                                            <c:when test="${product.status == 'waiting'}">
                                                <span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: orange; background: #fdffb6">
                                                    Waiting
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: red; background: #fee0e3">
                                                    Rejected
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <!-- Hành động -->
                                    <td>
                                        <div class="d-flex justify-content-start">
                                            <button class="btn view-btn" data-id="${product.id}"><i class="bi bi-eye-fill"></i></button>
                                            <button class="btn edit-btn" data-id="${product.id}"><i class="bi bi-pencil-square"></i></button>
                                            <button class="btn delete-btn" data-id="${product.id}"><i class="fa-solid fa-trash"></i></button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- Xem sản phẩm -->
                    <div class="view-product d-none" id="productDetail" >
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <h5 class="fs-3 fw-semibold"></h5>
                            <button class="btn-close" onclick="toggleProductDetail()"></button>
                        </div>
                        <hr>
                        <div class="product-info mt-2">
                            <h5 class="fw-semibold"><i class="bi bi-info-square me-2"></i>Thông tin sản phẩm </h5>
                            <div class="show-content">
                                <p class="id-image"><span class="title-info fw-semibold">Mã hình ảnh:</span> </p>
                                <p class="category-image"><span class="title-info fw-semibold">Danh mục:</span> </p>
                                <p class="price-image"><span class="title-info fw-semibold">Giá:</span> </p>
                                <p class="size-image"><span class="title-info fw-semibold">Độ phân giải:</span> </p>
                                <p class="dimension-image"><span class="title-info fw-semibold">Kích thước ảnh:</span> </p>
                                <p class="date-image"><span class="title-info fw-semibold">Ngày thêm:</span> </p>
                                <p class="status-image"><span class="title-info fw-semibold">Trạng thái:</span> </p>
                                <p class="d-flex align-items-start description-image"><span class="title-info fw-semibold me-1">Mô tả:</span> </p>
                            </div>
                        </div>
                        <div class="show-image">
                            <h5 class="fw-semibold mb-3"><i class="bi bi-image me-2"></i>Hình ảnh</h5>
                            <img src="" alt="" class="product-img">
                        </div>
                    </div>

                    <!-- Them sản phẩm -->
                    <div id="khungThemSanPham" class="overlay"></div>

                    <!-- Xóa sản phẩm -->
                    <div id="khungSuaSanPham" class="overlay"></div>
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
    $('.view-btn').on('click', function () {
        const productId = $(this).data('id');
        fetch(`/admin-products?id=`+productId)
            .then(response =>{
                console.log('Response received:', response);
                return response.json()})
            .then(product => {
                if (product) {
                    // Hiển thị thông tin sản phẩm
                    $('#productDetail h5.fs-3').text(product.name);
                    $('#productDetail .id-image').html("<span class=\"title-info fw-semibold\">Mã hình ảnh:</span>#" + product.id);
                    $('#productDetail .category-image').html("<span class=\"title-info fw-semibold\">Danh mục:</span>" + product.category);
                    let formatPrice = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" }).format(product.price);
                    $('#productDetail .price-image').html("<span class=\"title-info fw-semibold\">Giá:</span>" + formatPrice);
                    $('#productDetail .size-image').html("<span class=\"title-info fw-semibold\">Độ phân giải:</span>" + product.size);
                    $('#productDetail .dimension-image').html("<span class=\"title-info fw-semibold\">Kích thước ảnh:</span>" + product.dimension);
                    $('#productDetail .date-image').html("<span class=\"title-info fw-semibold\">Ngày thêm:</span>" + product.formatDateUpload);
                    let statusHtml = '';
                    if (product.status === 'accepted') {
                        statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: green; background: #d1e7dd">Accepted</span>`;
                    } else if (product.status === 'waiting') {
                        statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: orange; background: #fdffb6">Waiting</span>`;
                    } else {
                        statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: red; background: #fee0e3">Rejected</span>`;
                    }
                    $('#productDetail .status-image').html("<span class=\"title-info fw-semibold\">Trạng thái:</span>" + statusHtml);
                    $('#productDetail .description-image').html("<span class=\"title-info fw-semibold\">Mô tả:</span>" + product.description);
                    $('#productDetail .show-image img').attr('src', product.url);

                    toggleProductDetail();
                } else { alert('Lỗi sản phẩm!'); }
            })
            .catch(error => {
                alert('Lỗi sản phẩm!');
            });
    });

    function toggleProductDetail() {
        const productDetail = document.getElementById('productDetail');
        productDetail.classList.toggle('d-none');
    }

</script>
</body>
</html>

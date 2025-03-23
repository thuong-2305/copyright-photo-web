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
        <div id="admin-dashboard-graph" class="view-products-main">
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
                    <div class="overlay" id="overlay"></div>
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

                    <!-- Thêm sản phẩm -->
                    <div id="khungThemSanPham" class="overlay"></div>

                    <!-- Sửa sản phẩm -->
                    <div id="khungSuaSanPham" class="overlay"></div>

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

                </div>
            </div>
        </div>

        <!-- Content add product -->
        <div id="admin-dashboard-graph" class="view-product-add d-none">
            <div class="mt-4 content-view">
                <div class="header d-flex justify-content-between align-items-center mb-3 py-1 px-2">
                    <h5 class="fw-semibold name-function">Thêm sản phẩm</h5>
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
                            <div class="card position-relative">
                                <div class="line-dashed"></div>
                                <h6 class="fw-semibold">Chi tiết</h6>
                                <small>Tiêu đề, mô tả, hình ảnh...</small>
                                <div class="mt-3">
                                    <label>Tên sản phẩm</label>
                                    <input type="text" class="form-control" placeholder="Tên sản phẩm" id="nameProduct">
                                </div>
                                <div class="mt-3">
                                    <label>Mô tả</label>
                                    <input type="text" class="form-control" placeholder="Mô tả" id="desciptProduct">
                                </div>

                                <div class="mt-3 mb-3">
                                    <h5 class="fw-semibold text-secondary d-flex justify-content-between align-items-center position-relative">
                                        <span>Hình ảnh</span>
                                        <div class="btn-box d-none position-absolute" style="right: 0">
                                            <button class="btn-replace btn"  title="Thay thế ảnh">
                                                <i class="fa-solid fa-retweet"></i>
                                            </button>
                                            <button class="btn-cancel btn" title="Xóa ảnh">
                                                <i class="bi bi-x-square"></i>
                                            </button>
                                        </div>
                                    </h5>
                                    <div class="image-upload-box" id="uploadBox">
                                        <input type="file" id="fileInput" hidden accept="image/*">
                                        <label for="fileInput" class="upload-area">
                                            <i class="fa fa-cloud-upload"></i>
                                            <p>Kéo và thả tệp vào đây hoặc nhấp vào</p>
                                        </label>
                                    </div>
                                    <div class="image-upload-box d-none" id="visibleImage"></div>
                                </div>

                            </div>
                        </div>

                        <!-- Properties Section -->
                        <div class="col-md-6">
                            <div class="card position-relative">
                                <div class="line-dashed"></div>
                                <h6 class="fw-semibold">Thông tin</h6>
                                <small>Thêm tính năng và thuộc tính...</small>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label>Mã sản phẩm</label>
                                        <input type="text" class="form-control" id="idProduct">
                                    </div>
                                    <div class="col-md-6">
                                        <label>Mã người bán</label>
                                        <input type="text" class="form-control" id="idSeller">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label>Chất lượng</label>
                                        <input type="text" class="form-control isExist" id="imageSize" readonly>
                                    </div>
                                    <div class="col-md-6">
                                        <label>Kích thước</label>
                                        <input type="text" class="form-control isExist" id="fileSize" readonly>
                                    </div>
                                </div>
                                <div class="mt-3">
                                    <label>Danh mục</label>
                                    <select class="form-select">
                                        <option value="">Chọn danh mục</option>
                                        <c:forEach var="item" items="${categories}">
                                            <option value="${ item.cid }">${ item.name }</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="mt-3">
                                    <label>Tags <small style="font-size: 12px;">(Tùy chọn)</small></label>
                                    <select class="form-select">
                                        <option>Chọn tags</option>
                                    </select>
                                </div>
                                <!-- Trạng thái sản phẩm -->
                                <div class="mt-3">
                                    <label>Trạng thái</label>
                                    <div class="d-flex gap-3">
                                        <div>
                                            <input type="radio" id="accepted" name="status" checked>
                                            <label for="accepted">Accepted</label>
                                        </div>
                                        <div>
                                            <input type="radio" id="waiting" name="status">
                                            <label for="waiting">Waiting</label>
                                        </div>
                                        <div>
                                            <input type="radio" id="rejected" name="status">
                                            <label for="rejected">Rejected</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Giá -->
                            <div class="card p-3 mt-4 position-relative">
                                <div class="line-dashed"></div>
                                <h6 class="fw-semibold">Giá</h6>
                                <small>Giá cho sản phẩm</small>
                                <div class="mt-3">
                                    <label>Giá gốc</label>
                                    <input type="text" class="form-control" placeholder="đ 0.00" id="priceProduct">
                                </div>
                                <div class="mt-3">
                                    <label>Giá giảm <small style="font-size: 12px">(tùy chọn)</small></label>
                                    <input type="text" class="form-control" placeholder="đ 0.00">
                                </div>
                            </div>

                            <div class="text-end mt-3 button-function">
                                <button class="btn btn-add-product fw-semibold" style="font-size: 15px">Thêm sản phẩm</button>
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

<!-- Loading screen -->
<div id="loadingScreen" class="loading-overlay d-none">
    <div class="spinner"></div>
    <p>Đang xử lý, vui lòng chờ...</p>
</div>
<!-- Loading screen -->

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

<!-- Chức năng ẩn hiển xóa sản phẩm -->
<script>
    $("#deleteModal .btn-secondary").on("click", function () {
        $("#deleteModal").modal("hide");
    });
</script>

<!-- Xử lý xóa sản phẩm -->
<script>
    let productIdToDelete = null;
    let parentElement = null;

    $('.delete-btn').on('click', function () {
        productIdToDelete = $(this).data('id');
        parentElement = $(this).closest("tr");
        // Lây nội dung ảnh hiển thị
        var imageName = parentElement.find("td").eq(1).text().trim();
        $('#deleteModal .modal-body').html("Bạn có chắc chắn muốn xóa <strong>" + imageName + "</strong>.");
        $('#deleteModal').modal('show');
    });

    // Xử lý sau khi nhấn xóa
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

<!-- Chức năng xem sản phẩm -->
<script>
    $('.view-btn').on('click', function () {
        const productId = $(this).data('id');
        fetch(`/admin-products?id=`+productId)
            .then(response =>{
                console.log('Response received:', response);
                return response.json()
            })
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
            .catch(error => { alert('Lỗi sản phẩm!'); });
    });

    function toggleProductDetail() {
        const productDetail = document.getElementById('productDetail');
        productDetail.classList.toggle('d-none');
        const overlay = document.getElementById("overlay");
        overlay.classList.toggle('show');
    }

</script>

<!-- Chức năng ẩn hiện thêm sản phẩm -->
<script>
    $('.button-add').on("click", function() {
        $('.view-products-main').toggleClass("d-none");
        $('.view-product-add').toggleClass("d-none");

        $('.name-function').text("Thêm sản phẩm");
        $('.button-function').html("<button class=\"btn btn-add-product fw-semibold\" style=\"font-size: 15px\">Thêm sản phẩm</button>")
    });

    $('.button-back').on("click", function() {
        $('.view-products-main').toggleClass("d-none");
        $('.view-product-add').toggleClass("d-none");
    });
</script>

<!-- Xử lý chức năng thêm hình ảnh upload -->
<script>
    $(document).ready(function () {
        let $fileSize = $("#fileSize");
        let $imageSize = $("#imageSize");
        let $idProduct = $("#idProduct");

        // Reset giá trị input khi load lại trang
        $fileSize.val("");
        $imageSize.val("");
        $idProduct.val("");

        let $uploadBox = $('#uploadBox');
        let $fileInput = $('#fileInput');
        let $visibleImage = $('#visibleImage');
        let $btnBox = $('.btn-box');
        let $btnCancel = $('.btn-cancel');
        let $btnReplace = $('.btn-replace');

        // Hiển hình ảnh khi chọn upload
        $fileInput.on('change', function (event) {
            let file = event.target.files[0];
            if (file) {
                let reader = new FileReader();
                reader.onload = function (e) {
                    $btnBox.removeClass("d-none");
                    $visibleImage.removeClass("d-none");
                    $visibleImage.height("auto");
                    $visibleImage.html(
                        '<img id="preview-img" src="' + e.target.result + '" style="max-width: 100%; height: auto; border-radius: 5px;" alt="image-upload">'
                    );
                    $uploadBox.addClass("d-none");
                };
                reader.readAsDataURL(file);
            }
            handleFileImage(file);

        });

        // Hủy upload ảnh
        $btnCancel.on('click', function () {
            $visibleImage.html('');
            $visibleImage.addClass("d-none");
            $visibleImage.height("250px");
            $btnBox.addClass("d-none");
            $uploadBox.removeClass("d-none");
            $fileInput.val('');
            $fileSize.val('');
            $imageSize.val('');
            $idProduct.val('');
        });

        // Thay thế ảnh đã upload
        $btnReplace.on('click', function () {
            $fileInput.click();
        });

        // Ngăn chặn focus nếu chưa upload ảnh
        $fileSize.add($imageSize).add($idProduct).on("click", function (event) {
            if (!isImageUploaded()) {
                event.preventDefault();
                $(".alert-danger span").text("Hãy upload ảnh trước");
                $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                    $(this).addClass("d-none");
                });
            }
        });

        // Kiểm tra ảnh đã upload chưa
        function isImageUploaded() {
            return $visibleImage.find("img").length > 0;
        }

        // Hàm xử lý ảnh khi thêm
        function handleFileImage(file) {
            let formData = new FormData();
            formData.append('file', file);

            $.ajax({
                url: "/AdminHandleAddImage",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    $("#fileSize").val(response.fileSize);
                    $("#imageSize").val(response.imageSize);
                    $("#idProduct").val(response.id);
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        }
    });

</script>

<!-- Xử lý chức năng thêm sản phẩm mới -->
<script>
    $(document).ready(function () {
        $(".btn-add-product").on("click", function () {
            let formData = new FormData();

            // Lấy dữ liệu từ các input
            formData.append("nameProduct", $("#nameProduct").val());
            formData.append("desciptProduct", $("#desciptProduct").val());
            formData.append("idProduct", $("#idProduct").val());
            formData.append("idSeller", $("#idSeller").val());
            formData.append("imageSize", $("#imageSize").val());
            formData.append("fileSize", $("#fileSize").val());
            formData.append("priceProduct", $("#priceProduct").val());

            // Lấy file ảnh đã chọn
            let fileInput = $("#fileInput")[0].files[0];
            if (fileInput) {
                formData.append("file", fileInput);
            }

            // Lấy danh mục
            formData.append("category", $(".form-select").val());

            // Lấy trạng thái sản phẩm
            let status = $("input[name='status']:checked").attr("id");
            formData.append("status", status);

            $.ajax({
                url: "/AdminHandleAddProduct",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    if(response.message === "Success") {
                        location.reload();
                        $('.view-products-main').toggleClass("d-none");
                        $('.view-product-add').toggleClass("d-none");

                        $("#nameProduct").val("");
                        $("#desciptProduct").val("");
                        $("#idProduct").val("");
                        $("#idSeller").val("");
                        $("#imageSize").val("");
                        $("#fileSize").val("");
                        $("#priceProduct").val("");
                        $("#fileInput").val("");
                        $(".form-select").prop("selectedIndex", 0);
                        $("input[name='status']").prop("checked", false);

                        $("#uploadBox").removeClass("d-none");
                        $("#visibleImage").addClass("d-none").html("");

                        $(".alert-success span").text("Thêm sản phẩm mới thành công!");
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                            $(this).addClass("d-none");
                        });
                    } else {
                        $("#idSeller").addClass("is-invalid");
                        $("#idSeller").after('<div class="invalid-feedback">ID Seller không đúng!</div>');

                        $(".alert-danger span").text("Lỗi ID người bán");
                        $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                            $(this).addClass("d-none");
                        });
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Lỗi:", error);
                }
            });
        });
    });
</script>

<!-- Xử lý chức năng sửa sản phẩm -->
<script>
    let productIdToEdit = null;
    let $uploadBox = $('#uploadBox');
    let $visibleImage = $('#visibleImage');
    let $btnBox = $('.btn-box');

    $('.edit-btn').on('click', function () {
        productIdToEdit = $(this).data('id');
        $('.view-products-main').toggleClass("d-none");
        $('.view-product-add').toggleClass("d-none");

        $.ajax({
            url: "/AdminHandleEditProduct",
            type: "GET",
            data: { product_id: productIdToEdit },
            success: function (response) {
                $("#nameProduct").val(response.name);
                $("#desciptProduct").val(response.description);
                $("#idProduct").val(response.id);
                $("#idSeller").val(response.uid);
                $("#imageSize").val(response.dimension);
                $("#fileSize").val(response.size);
                $("#priceProduct").val(response.price);

                $btnBox.removeClass("d-none");
                $visibleImage.removeClass("d-none");
                $visibleImage.height("auto");
                $visibleImage.html(
                    '<img id="preview-img" src="' + response.url + '" style="max-width: 100%; height: auto; border-radius: 5px;" alt="image-upload">'
                );
                $uploadBox.addClass("d-none");

                $(".form-select").prop("selectedIndex", response.cid);
                $("input[name='status']").prop("checked", false);
                $("input[name='status'][id='" + response.status + "']").prop("checked", true);
            },
            error: function (xhr, status, error) {
                console.error("Lỗi:", error);
            }
        });

        $('.name-function').text("Sửa sản phẩm");
        $('.button-function').html("<button class=\"btn btn-edit-product fw-semibold\" style=\"font-size: 15px\">Chỉnh sửa sản phẩm</button>")
    });

    $(document).on("click", ".btn-edit-product", function () {
        let formData = new FormData();

        // Lấy dữ liệu từ các input
        formData.append("nameProduct", $("#nameProduct").val());
        formData.append("desciptProduct", $("#desciptProduct").val());
        formData.append("idProduct", $("#idProduct").val());
        formData.append("idSeller", $("#idSeller").val());
        formData.append("imageSize", $("#imageSize").val());
        formData.append("fileSize", $("#fileSize").val());
        formData.append("priceProduct", $("#priceProduct").val());

        // Lấy file ảnh đã chọn
        let fileInput = $("#fileInput")[0].files[0];
        if (fileInput) {
            formData.append("file", fileInput);
        }
        formData.append("url", $("#preview-img").attr("src"));

        // Lấy danh mục
        formData.append("category", $(".form-select").val());

        // Lấy trạng thái sản phẩm
        let status = $("input[name='status']:checked").attr("id");
        formData.append("status", status);

        $.ajax({
            url: "/AdminHandleEditProduct",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {

                console.log(response.message)

                if(response.message === "Success") {

                    // $("#loadingScreen").removeClass("d-none");

                    $('.view-products-main').toggleClass("d-none");
                    $('.view-product-add').toggleClass("d-none");

                    $("#nameProduct").val("");
                    $("#desciptProduct").val("");
                    $("#idProduct").val("");
                    $("#idSeller").val("");
                    $("#imageSize").val("");
                    $("#fileSize").val("");
                    $("#priceProduct").val("");
                    $("#fileInput").val("");
                    $(".form-select").prop("selectedIndex", 0);
                    $("input[name='status']").prop("checked", false);

                    $("#uploadBox").removeClass("d-none");
                    $("#visibleImage").addClass("d-none").html("");

                    $(".alert-success span").text("Chỉnh sửa sản phẩm mới thành công!");
                    $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function() {
                        $(this).addClass("d-none");
                    });
                }
            },
            error: function (xhr, status, error) {
                console.error("Lỗi:", error);
            }
        });
    });
</script>
</body>
</html>

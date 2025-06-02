<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/myphoto-seller.css">
    <link rel="stylesheet" href="./assets/css/upload.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="./assets/css/custom-nav-pages.css">

    <style>
        .view-product {
            display: none;
            position: fixed;
            top: 10%;
            left: 50%;
            transform: translateX(-50%);
            z-index: 1000;
            background: white;
            padding: 20px;
            border-radius: 8px;
            max-width: 600px;
            width: 90%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .view-product:not(.d-none) {
            display: block;
        }
        .overlay.show {
            display: block;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        .no-scroll {
            overflow: hidden;
        }
        .product-img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<div id="homepage-seller">
    <div class="container-fluid">
        <div class="homepage-seller-container">
            <div class="homepage-seller-content">
                <div class="row" style="margin-top: 100px">
                    <!-- Sidebar -->
                    <div class="col-2 pl-0 pr-0">
                        <div id="navbar-side" class="shadow-sm" style="position: sticky !important; top: 18%;">
                            <div class="navbar-side-content">
                                <div class="profile-avatar-content w-100 d-flex flex-column text-center align-items-center justify-content-center py-3 bg-light">
                                    <div class="profile-image-container d-flex text-center align-items-center justify-content-center py-3">
                                        <div class="profile-image">
                                            <img class="rounded-circle mx-auto"
                                                 src="./assets/images/avart-default.png" alt="Avatar profile">
                                        </div>
                                        <i class="fa fa-pencil-square" aria-hidden="true"></i>
                                    </div>
                                    <div class="profile-name">
                                        ${ auth.username }
                                    </div>
                                </div>
                                <ul class="menu-link stl-none mt-3">
                                    <li class="dashboard d-flex text-center align-items-center justify-content-center">
                                        <a href="ShowStatistic" class="text-dark">
                                            <i class="fa fa-chart-simple"></i>Thống Kê
                                        </a>
                                    </li>
                                    <li class="my-photos d-flex text-center align-items-center justify-content-center">
                                        <a href="#" class="text-dark">
                                            <i class="fas fa-image"></i> Ảnh Của Tôi
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Main content -->

                    <!-- Header -->
                    <div class="col-9">
                        <div id="main-content" style="padding-left: 20px; padding-right: 20px;">
                            <div class="heading-content" style="position: sticky">
                                <h2 class="fw-bold text-uppercase">
                                    <i class="text-success bi bi-images fs-2 me-2"></i>Ảnh của tôi
                                </h2>
                            </div>
                            <!-- Body -->
                            <!-- Filter btn -->
                            <div class="body-content">
                                <div class="filter d-flex text-center justify-content-between align-items-center mt-5">
                                    <div>
                                        <label class="sort-text mr-2 fw-semibold">Ảnh hỉển thị</label>
                                        <div class="dropdown">
                                            <button class="btn dropdown-toggle border px-4" type="button" id="timeDropdown"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Công bán
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="timeDropdown">
                                                <button class="dropdown-item" onclick="fetchList('accepts')">Hiện bán</button>
                                                <button class="dropdown-item" onclick="fetchList('waits')">Đang xác nhận</button>
                                                <button class="dropdown-item" onclick="fetchList('rejects')">Đã bị từ chối</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-photo-container mt-4">
                                    <!-- Photo 1 -->
                                    <div id="photoList" class="list-photo d-flex flex-wrap" style="position: sticky">
                                        <c:forEach var="item" items="${accepts}">
                                            <div class="photo shadow-effect mr-3 mb-1">
                                                <div class="photo-image position-relative">
                                                    <img src="${item.url}" alt="">
                                                    <div class="dropdown">
                                                        <button class="btn btn-link" type="button"
                                                                data-toggle="dropdown">
                                                            <i class="fas fa-ellipsis-h"></i>
                                                        </button>
                                                        <div class="dropdown-menu">
                                                            <a class="dropdown-item d-flex align-items-center edit-item" href="#"
                                                               data-id="${item.id}" data-name="${item.name}">
                                                                <i class="fas fa-edit mr-2"></i> Chỉnh sửa
                                                            </a>
                                                            <a class="dropdown-item d-flex align-items-center delete-item" href="#"
                                                               data-id="${item.id}" data-name="${item.name}">
                                                                <i class="fas fa-trash-alt mr-2"></i> Xóa
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="photo-text-content d-flex justify-content-between mt-2">
                                                    <div class="photo-text-title font-weight-bold pl-2">${item.name}</div>
                                                    <div class="photo-text-privacy pr-2">Công khai</div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <%-- Button upload --%>
                    <div class="col-1" style="position:fixed; top: 45%; right: 2%;">
                        <div class="upload-your-photo mr-3 d-flex flex-column text-center align-items-center justify-content-center">
                            <i class="bi bi-cloud-arrow-up-fill fs-5"></i>
                            <div class="text-upload" style="width: 100px">Tải những bức ảnh của bạn</div>
                            <button id="btn-upload1" class="pl-5 pr-5 pt-1 pb-1 btn btn-primary btn-upload mt-3">
                                Tải ảnh
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Xóa sản phẩm -->
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

<!-- Xem sản phẩm -->
<div class="view-product d-none" id="productDetail">
    <div class="d-flex justify-content-between align-items-center mb-2">
        <h5 class="fs-3 fw-semibold"></h5>
        <button class="btn-close" onclick="toggleProductDetail()"></button>
    </div>
    <hr>
    <div class="product-info mt-2">
        <h5 class="fw-semibold"><i class="bi bi-info-square me-2"></i>Thông tin sản phẩm</h5>
        <div class="show-content">
            <p class="id-image"><span class="title-info fw-semibold">Mã hình ảnh:</span></p>
            <p class="category-image"><span class="title-info fw-semibold">Danh mục:</span></p>
            <p class="price-image"><span class="title-info fw-semibold">Giá:</span></p>
            <p class="size-image"><span class="title-info fw-semibold">Độ phân giải:</span></p>
            <p class="dimension-image"><span class="title-info fw-semibold">Kích thước ảnh:</span></p>
            <p class="date-image"><span class="title-info fw-semibold">Ngày thêm:</span></p>
            <p class="status-image"><span class="title-info fw-semibold">Trạng thái:</span></p>
            <p class="description-image"><span class="title-info fw-semibold me-1">Mô tả:</span></p>
        </div>
    </div>
    <div class="show-image">
        <h5 class="fw-semibold mb-3"><i class="bi bi-image me-2"></i>Hình ảnh</h5>
        <img src="" alt="" class="product-img">
    </div>
</div>

<!-- section upload -->
<div class="overlay2"></div>
<form action="uploadImage" method="post" enctype="multipart/form-data" >
<section class="upload bg-white" style="z-index: 9999;">
    <div class="container">
        <!-- title -->
        <div class="top d-flex align-items-center header">
            <i class="fa-solid fa-upload"></i>
            <p class="text fw-bold fs-5 my-0">Upload</p>
        </div>
        <!-- end title -->

        <!-- content start -->
        <div class="option v2" id="option" style="display: none">
            <div class="box d-flex flex-column align-items-center justify-content-center h-100">
                <i class="fa-solid fa-upload fs-2 fw-0"></i>
                <span class="fs-5 fw-bold my-4">Kéo thả các file để tải lên</span>
                <label for="file-upload" class="btn btn-success rounded-pill fw-bold py-2 px-4">
                    Thêm ảnh
                </label>
                <input type="file" id="file-upload" accept="image/*" class="d-none"/>
            </div>
        </div>
        <!-- end content start -->

        <div class="show-pane">
            <div class="pane-left">
                <span class="d-block mb-3 fw-bold"><i class="fa-solid fa-paperclip me-2"></i>Tổng quan ảnh</span>
                <div class="box-imgs d-flex flex-wrap">
                    <!-- Khu vực hiển thị ảnh -->
                    <div id="preview-container" class="d-flex flex-wrap"></div>

                    <!-- Nút upload thêm ảnh -->
                    <div class="bg-white d-flex justify-content-center align-items-center add-img">
                        <label for="fileUpload" class="d-flex align-items-center justify-content-center">
                            <i class="fa-solid fa-plus"></i>
                        </label>
                        <input type="file" id="fileUpload" name="file" accept="image/*" style="opacity: 0;" enctype="multipart/form-data" />
                    </div>
                </div>
            </div>

            <div class="pane-right">

                <div class="bar">
                    <ul class="nav-list">
                        <li class="item complete" data-step="1" id="step1">
                            <p>Ảnh</p>
                        </li>
                        <li class="item active" data-step="2" id="step2">
                            <p>Chi tiết</p>
                        </li>
                        <li class="item" data-step="3" id="step3">
                            <p>Thêm thông tin</p>
                        </li>
                    </ul>
                </div>

                <div class="content-2">
                    <p>Thêm và xác nhận thông tin ảnh của bạn. Để giúp dễ dàng tìm kiếm và đạt
                        được bởi người dùng đối với ảnh của bạn.</p>

                    <div class="formLeft">
                        <label for="title">Tên:</label>
                        <input type="text" id="title" name="title" placeholder="Nhập tên" required>

                        <label for="description">Mô tả:</label>
                        <textarea id="description" name="description" placeholder="Nhập mô tả" required></textarea>

                        <label for="dimension" class="mt-2">Kích thước :</label>
                        <input type="text" id="dimension" name="dimension" placeholder="Nhập kích thước ảnh" required>

                        <label for="file-size">Dung lượng:</label>
                        <input type="text" id="file-size" name="file-size" placeholder="Nhập dung lượng ảnh" required>

                        <label for="category">Danh mục:</label>
                        <select id="category" name="category" required style="background: white !important;">
                            <option value="">Chọn danh mục</option>
                            <c:forEach var="item" items="${categories}">
                                <option value="${ item.cid }">${ item.name }</option>
                            </c:forEach>
                        </select>

                        <label for="price">Giá muốn bán:</label>
                        <input type="number" id="price" name="price" placeholder="Nhập giá cho ảnh" step="0.01" min="0" required>

                        <div class="text-danger"><span></span></div>
                        <button id="submitInfo" class="next">Tiếp theo</button>
                    </div>
                </div>

                <%-- Xác nhận chính sách--%>
                <div class="content-3">
                    <h5 class="text-center">Cấp phép độc quyền truyền thông qua CoriPhoto</h5>
                    <span>Cấp phép ảnh của bạn độc quyền đến chúng tôi và các đối tác phân phối
                            với CoriPhoto của chúng tôi. Nội dung của bạn không thể được cấp phép thương mại thông
                        qua các trang web lưu trữ khá <br><br>
                        Nội dung độc quyền của chúng tôi được ưu tiên, có khả năng tìm kiếm và khám phá tốt hơn,
                        đồng thời cũng có xu hướng với mọi người.</span>
                    <div class="accept my-2">
                        <input type="checkbox" id="confirm" value="Đồng ý" required>
                        <label for="confirm" class="fw-semibild">Đồng ý</label>
                    </div>
                    <button type="submit" class="success btn btn-success rounded-pill">Hoàn tất</button>
                </div>

            </div>
        </div>
    </div>
    <button class="btn-close btn-close-black close-upload"></button>
</section>
</form>

<%-- Notification --%>
<div class="alert alert-danger d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0%">
    <i class="bi bi-exclamation-triangle"></i><span></span>
</div>

<c:if test="${ msgUpload != null }">
<div class="alert alert-success align-items-center position-fixed"
     role="alert"
     id="alertMessage"
     style="display: none; width: 25%; top: 15%; right: 0"
>
    <i class="bi bi-check2-circle"></i><span>${ msgUpload }</span>
</div>
</c:if>
<%-- Notification --%>

<script src="./assets/js/myphoto-seller.js"></script>
<script src="./assets/js/upload.js"></script>
<jsp:include page="include/scripts.jsp"/>

<script src="./assets/js/alertMessage.js"></script>
<script src="./assets/js/deleteProduct.js"></script>
<script src="./assets/js/productList.js"></script>
<script src="./assets/js/imageUpload.js"></script>
<script src="./assets/js/viewProduct.js"></script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>

</html>

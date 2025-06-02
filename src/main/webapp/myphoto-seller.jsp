<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <title>Title</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./assets/css/myphoto-seller.css">
    <link rel="stylesheet" href="./assets/css/upload.css">
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.0/classic/ckeditor.js"></script>
    <style>
        #nav {
            position: fixed !important;
            background: white;
            margin-bottom: 20px;
        }

        .modal {
            z-index: 9999;
        }

        #nav:not(.scrolled) .title-logo {
            color: black;
        }

        #nav:not(.scrolled) .title-item {
            color: black !important;
        }

        #nav:not(.scrolled) .nav-item:hover {
            color: #009970;
        }

        #nav:not(.scrolled) .title-item:hover {
            color: #009970 !important;
        }

        #nav:not(.scrolled) .title-item:hover i {
            color: #009970 !important;
        }

        #nav:not(.scrolled) .nav-item:hover .title-item {
            color: #009970 !important;
        }

        #nav:not(.scrolled) .container .login-button {
            background-color: transparent;
            color: black;
            padding: 7px 19px;
            border: 1px solid black;
        }

        .image-text {
            position: relative;
            margin: 10px;
        }
        .image-text img {
            max-width: 100px;
            max-height: 100px;
            border-radius: 8px;
        }
        .delete-img {
            position: absolute;
            top: 5px;
            right: 5px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 50%;
            padding: 5px;
            cursor: pointer;
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
                                    <small class=" text-success fw-semibold text-lowercase"
                                           style="font-size: 18px !important;">( 3 ảnh )</small>
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const alertMessage = document.getElementById("alertMessage");
        if (alertMessage) {
            alertMessage.style.display = "block";
            setTimeout(() => {
                alertMessage.style.display = "none";
            }, 2000);
        }
    });
</script>

<script>
    let productIdToDelete = null;
    let productElement = null;

    // Bắt sự kiện nhấn vào nút "Xóa"
    $(document).on("click", ".delete-item", function () {
        productIdToDelete = $(this).data("id");
        const productName = $(this).data("name");

        // Lưu phần tử ảnh tương ứng để xóa khỏi DOM sau khi thành công
        productElement = $(this).closest(".photo");

        // Hiển thị tên trong modal xác nhận
        $('#deleteModal .modal-body').html("Bạn có chắc chắn muốn xóa <strong>" + productName + "</strong>?");
        $('#deleteModal').modal('show');
    });

    // Khi người dùng xác nhận xóa
    $('#confirmDelete').on('click', function () {
        if (productIdToDelete) {
            $.ajax({
                url: '/seller-products',
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
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                            $(this).addClass("d-none");
                        });

                        // Xóa ảnh khỏi giao diện
                        if (productElement) {
                            productElement.fadeOut(function () {
                                $(this).remove();
                            });
                        }
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

<script>
    document.addEventListener("DOMContentLoaded", () => {
        fetchList('accepts');
    });

    function fetchList(type) {
        const dropdownButton = document.getElementById('timeDropdown');
        if(type === "accepts") dropdownButton.textContent = "Hiện bán";
        if(type === "waits") dropdownButton.textContent = "Đang xác nhận";
        if(type === "rejects") dropdownButton.textContent = "Đã bị từ chối";
        fetch("getProducts?type=" + type)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Lỗi HTTP: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                console.log(data.products)
                if (data.error) {
                    console.error('Server trả về lỗi:', data.error);
                    alert('Lỗi: ' + data.error); // Hiển thị thông báo lỗi
                    return;
                }
                updatePhotoList(data);
            })
            .catch(error => {
                console.error('Lỗi khi tải danh sách:', error);
            });
    }

    function updatePhotoList(data) {
        const photoList = document.getElementById('photoList');
        if (!photoList) {
            console.error('Element #photoList not found.');
            return;
        }

        console.log('Data received:', data);
        if (!data.products || !Array.isArray(data.products)) {
            console.error('Invalid data.products:', data.products);
            return;
        }

        photoList.innerHTML = ''; // Xóa nội dung cũ
        if (data.products.length === 0) {
            photoList.innerHTML = '<p>Không có sản phẩm nào.</p>';
            return;
        }

        data.products.forEach(item => {
            if (!item.url || !item.name) {
                console.error('Invalid item data:', item);
                return;
            }

            const photoHtml =
                '<div class="photo shadow-effect mr-3 mb-1">' +
                '<div class="photo-image position-relative">' +
                '<img src="' + item.url + '" alt="">' +
                '<div class="dropdown">' +
                '<button class="btn btn-link" type="button" data-toggle="dropdown">' +
                '<i class="fas fa-ellipsis-h"></i>' +
                '</button>' +
                '<div class="dropdown-menu">' +
                '<a class="dropdown-item d-flex align-items-center" href="#" onclick="handleAction(\'Chỉnh sửa\')">' +
                '<i class="fas fa-edit mr-2"></i> Chỉnh sửa' +
                '</a>' +
                '<a class="dropdown-item d-flex align-items-center" href="#" onclick="handleAction(\'Tải xuống\')">' +
                '<i class="fas fa-download mr-2"></i> Tải xuống' +
                '</a>' +
                '<a class="dropdown-item d-flex align-items-center" href="#" onclick="handleAction(\'Xóa\')">' +
                '<i class="fas fa-trash-alt mr-2"></i> Xóa' +
                '</a>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="photo-text-content d-flex justify-content-between mt-2">' +
                '<div class="photo-text-title font-weight-bold pl-2">' + item.name + '</div>' +
                '<div class="photo-text-privacy pr-2">Công khai</div>' +
                '</div>' +
                '</div>';
            photoList.innerHTML += photoHtml;
        });
    }
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const fileUpload = document.getElementById('fileUpload');
        const fileUploadAlt = document.getElementById('file-upload');

        function handleImageSelection(input) {
            const previewContainer = document.getElementById('preview-container');
            const dimensionInput = document.getElementById('dimension');
            const fileSizeInput = document.getElementById('file-size');
            const priceInput = document.getElementById('price');

            if (!previewContainer || !dimensionInput || !fileSizeInput || !priceInput) {
                console.error('Missing required elements:', {
                    previewContainer: !!previewContainer,
                    dimensionInput: !!dimensionInput,
                    fileSizeInput: !!fileSizeInput,
                    priceInput: !!priceInput
                });
                alert('Error: Required form elements are missing.');
                return;
            }

            const files = Array.from(input.files);
            if (!files.length) {
                console.error('No files selected.');
                alert('Vui lòng chọn ít nhất một tệp ảnh.');
                return;
            }

            previewContainer.innerHTML = '';

            files.forEach((file, index) => {
                if (!file.type.startsWith('image/')) {
                    console.error('Tệp không phải ảnh:', file.name);
                    alert(`Tệp ${file.name} không phải là ảnh hợp lệ.`);
                    return;
                }

                console.log('Processing file:', file.name, file.size, file.type);

                const reader = new FileReader();
                reader.onload = function (e) {
                    console.log('FileReader loaded:', file.name);
                    const img = new Image();
                    img.onload = function () {
                        console.log('Image loaded:', file.name, img.width, img.height);
                        const width = img.width;
                        const height = img.height;
                        const sizeKB = (file.size / 1024).toFixed(0);

                        // Cập nhật giá trị cho file đầu tiên
                        if (index === 0) {
                            dimensionInput.value = width + "x" + height;
                            fileSizeInput.value = sizeKB + " KB";

                            let price = 200000;
                            if (sizeKB > 1500) price = 400000;
                            else if (sizeKB > 1000) price = 300000;
                            else if (sizeKB < 500) price = 200000;
                            else price = 250000;

                            priceInput.value = price;
                        }

                        const thumb = document.createElement('img');
                        thumb.src = e.target.result;
                        thumb.alt = file.name;
                        thumb.style.maxHeight = '200px';
                        thumb.style.maxWidth = '200px';
                        thumb.style.marginLeft = '5px';
                        thumb.style.border = '1px solid #ccc';
                        thumb.style.borderRadius = '5px';
                        previewContainer.appendChild(thumb);
                    };
                    img.onerror = function () {
                        console.error('Failed to load image:', file.name);
                        alert(`Lỗi: Không thể tải ảnh ${file.name}.`);
                    };
                    img.src = e.target.result;
                };
                reader.onerror = function () {
                    console.error('FileReader error for file:', file.name);
                    alert(`Lỗi: Không thể đọc tệp ${file.name}.`);
                };
                reader.readAsDataURL(file);
            });
        }

        if (fileUpload) {
            fileUpload.addEventListener('change', function () {
                console.log('fileUpload change event triggered');
                handleImageSelection(this);
            });
        } else {
            console.error('Element #fileUpload not found.');
        }

        if (fileUploadAlt) {
            fileUploadAlt.addEventListener('change', function () {
                console.log('file-upload change event triggered');
                handleImageSelection(this);
            });
        } else {
            console.error('Element #file-upload not found.');
        }

        // Ngăn form submit khi chọn file
        const uploadForm = document.querySelector('form[action="uploadImage"]');
        if (uploadForm) {
            uploadForm.addEventListener('submit', function (e) {
                console.log('Form submission triggered');
                // Có thể thêm e.preventDefault() để debug nếu cần
            });
        }
    });
</script>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>

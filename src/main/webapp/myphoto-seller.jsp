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
    <style>
        #nav {
            position: fixed !important;
            background: white;
            margin-bottom: 20px;
        }

        .modal {
            z-index: 9999;
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
                                            <button class="btn dropdown-toggle border" type="button" id="timeDropdown"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                Công bán
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="timeDropdown">
                                                <button class="dropdown-item" onclick="fetchList('accepts')">Công bán</button>
                                                <button class="dropdown-item" onclick="fetchList('waits')">Chờ duyệt</button>
                                                <button class="dropdown-item" onclick="fetchList('rejects')">Từ chối</button>
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
                                                            <a class="dropdown-item d-flex align-items-center" href="#"
                                                               onclick="handleAction('Chỉnh sửa')">
                                                                <i class="fas fa-edit mr-2"></i> Chỉnh sửa
                                                            </a>
                                                            <a class="dropdown-item d-flex align-items-center" href="#"
                                                               onclick="handleAction('Tải xuống')">
                                                                <i class="fas fa-download mr-2"></i> Tải xuống
                                                            </a>
                                                            <a class="dropdown-item d-flex align-items-center" href="#"
                                                               onclick="handleAction('Xóa')">
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
                    <div class="col-1" style="position:fixed; top: 45%; right: 2%;">
                        <div class="upload-your-photo mr-3 d-flex flex-column text-center align-items-center justify-content-center">
                            <i class="bi bi-cloud-arrow-up-fill fs-5"></i>
                            <div class="text-upload" style="width: 100px">Tải những bức ảnh của bạn</div>
                            <button class="pl-5 pr-5 pt-1 pb-1 btn btn-primary btn-upload mt-3"
                                    id="btn-upload1">Tải ảnh
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
<section class="upload bg-white">
    <div class="container">
        <!-- title -->
        <div class="top d-flex align-items-center header">
            <i class="fa-solid fa-upload"></i>
            <p class="text fw-bold fs-5 my-0">Upload</p>
        </div>
        <!-- end title -->

        <!-- content start -->
        <div class="option v2" id="option">
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
                    <div class="image-text active">
                        <img src="../assets/images/Animals/3.jpg" alt="">
                        <i class="fa-solid fa-trash"></i>
                    </div>
                    <div class="bg-white d-flex justify-content-center align-items-center add-img"><i
                            class="fa-solid fa-plus"></i></div>
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
                    <form>
                        <label for="title">Tên:</label>
                        <input type="text" id="title" name="title" placeholder="Nhập tên" required>

                        <label for="description">Mô tả:</label>
                        <textarea id="description" name="description" placeholder="Nhập mô tả" required></textarea>

                        <label for="dimension">Tên:</label>
                        <input type="text" id="dimension" name="dimension" placeholder="Nhập kích thước ảnh" required>

                        <label for="file-size">Tên:</label>
                        <input type="text" id="file-size" name="file-size" placeholder="Nhập dung lượng ảnh" required>

                        <label for="category">Danh mục:</label>
                        <select id="category" name="category" required>
                            <option value="">Chọn danh mục</option>
                            <option value="category1">Trừu tượng</option>
                            <option value="category2">Phong cảnh</option>
                            <option value="category3">Con người</option>
                            <option value="category4">Công nghệ</option>
                            <option value="category5">Tự nhiên</option>
                            <option value="category6">Thành phố</option>
                            <option value="category7">AI</option>
                            <option value="category8">Thức ăn</option>
                            <option value="category9">Nghệ thuật</option>
                            <option value="category10">Khác</option>
                        </select>

                        <label for="tags">Thẻ:</label>
                        <select id="tags" name="tags[]" multiple required>
                            <option value="abstract">Trừu tượng</option>
                            <option value="landscape">Phong cảnh</option>
                            <option value="people">Con người</option>
                            <option value="technology">Công nghệ</option>
                            <option value="nature">Tự nhiên</option>
                            <option value="city">Thành phố</option>
                            <option value="ai">AI</option>
                            <option value="food">Thức ăn</option>
                            <option value="art">Nghệ thuật</option>
                            <option value="other">Khác</option>
                        </select>
                        <small>Nhấn Ctrl (hoặc Cmd trên Mac) để chọn nhiều thẻ</small>
                        <button type="submit" class="next">Tiếp theo</button>
                    </form>
                </div>
                <div class="content-3">
                    <h5 class="text-center">Cấp phép độc quyền truyền thông qua CoriPhoto</h5>
                    <span>Cấp phép ảnh của bạn độc quyền đến chúng tôi và các đối tác phân phối
                            với CoriPhoto của chúng tôi. Nội dung của bạn không thể được cấp phép thương mại thông
                        qua các trang web lưu trữ khá <br><br>
                        Nội dung độc quyền của chúng tôi được ưu tiên, có khả năng tìm kiếm và khám phá tốt hơn,
                        đồng thời cũng có xu hướng với mọi người.</span>
                    <div class="accept my-2">
                        <input type="checkbox" id="confirm" value="Đồng ý">
                        <label for="confirm">Đồng ý</label>
                    </div>
                    <button type="submit" class="success btn btn-success rounded-pill">Hoàn tất</button>
                </div>
            </div>
        </div>
    </div>
    <button class="btn-close btn-close-black close-upload"></button>
</section>

<script src="./assets/js/myphoto-seller.js"></script>
<script src="./assets/js/upload.js"></script>
<jsp:include page="include/scripts.jsp"/>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        // Tải danh sách mặc định (accepts) khi load trang
        fetchList('accepts');
    });

    function fetchList(type) {
        const dropdownButton = document.getElementById('timeDropdown');
        if(type === "accepts") dropdownButton.textContent = "Công bán";
        if(type === "waits") dropdownButton.textContent = "Từ chối";
        if(type === "rejects") dropdownButton.textContent = "Công bán";
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
                updatePhotoList(data);  // Chuyển dữ liệu vào hàm updatePhotoList
            })
            .catch(error => {
                console.error('Lỗi khi tải danh sách:', error);
            });
    }

    // Hàm cập nhật danh sách ảnh
    function updatePhotoList(data) {
        const photoList = document.getElementById('photoList');
        photoList.innerHTML = ''; // Xóa nội dung cũ

        if (data.products.length === 0) {
            photoList.innerHTML = '<p>Không có sản phẩm nào.</p>';
            return;
        }
        data.products.forEach(product => {
            console.log(product.name);
        });

        // Duyệt qua danh sách sản phẩm và tạo HTML
        data.products.forEach(item => {
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

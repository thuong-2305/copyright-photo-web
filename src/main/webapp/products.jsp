<jsp:useBean id="cid" scope="request" type="java.lang.Integer"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="include/head.jsp"/>
    <title>Products</title>

    <style>
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
    </style>
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<section class="search pt-5 mt-4" style="margin-top: 15px">
    <div class="search-container">
        <div class="dropdown">
            <button class="text-secondary" id="type-search"><i class="fa-solid fa-image px-2"></i><span>Tất cả
                        ảnh</span><i class="fa-solid fa-caret-down px-2"></i></button>
            <div class="dropdown-content">
                <a href="#" class="active" data-icon="fa-image"><i class="fa-solid fa-image pe-3"></i>Tất cả
                    ảnh</a>
                <a href="#" data-icon="fa-camera"><i class="fa-solid fa-camera px-3"></i>Ảnh chụp</a>
                <a href="#" data-icon="fa-vector-square"><i class="fa-solid fa-vector-square px-3"></i>Vectors</a>
                <a href="#" data-icon="fa-pen-fancy"><i class="fa-solid fa-pen-fancy px-3"></i>AI</a>
            </div>
        </div>
        <div class="search-bar">
            <input type="text" id="search-input" placeholder="Tìm kiếm tất cả nguồn">
            <span class="clear-btn text-dark">&#10005;</span>
        </div>
        <button class="search-button"><i class="fa-solid fa-magnifying-glass"></i><span class="ps-2">Tìm kiếm</span></button>
    </div>
</section>

<!-- products -->
<section class="products">
    <div class="container d-flex flex-column">
        <div class="heading">
            <div class="related-search d-flex align-items-center my-4">
                <span class="fw-bold me-3">Thẻ phổ biến:</span>
                <div class="data1 d-flex justify-content-center align-items-center">
                    <i class="fa fa-search"></i>
                    <p>Tự nhiên</p>
                </div>
                <div class="data1 d-flex justify-content-center align-items-center">
                    <i class="fa fa-search"></i>
                    <p>Phong cảnh</p>
                </div>
                <div class="data1 d-flex justify-content-center align-items-center">
                    <i class="fa fa-search"></i>
                    <p>Hoa cỏ</p>
                </div>
                <div class="data1 d-flex justify-content-center align-items-center">
                    <i class="fa fa-search"></i>
                    <p>Nhà</p>
                </div>
            </div>
            <div class="path">
                <p class="text-primary">
                    Danh mục
                    <span class="text-secondary">
                            <i class="fa-solid fa-angle-right"></i>
                        </span>
                    <% String path = (String) request.getAttribute("duongdan"); %>
                    <%= path %>
                </p>
            </div>
        </div>
        <div class="show-products">
            <div class="content-products">
                <p class="fs-3 fw-bold">Ảnh <%= path %> có giấy phép bản quyền</p>
                <p class="text-secondary">Nhiều dữ liệu ảnh, hãy Khám phá nhưng bức ảnh hàng đầu, nổi bật từ
                    CoRiPhoto.</p>
                <div class="tool d-flex justify-content-between">
                    <button class="btn border-secondary" onclick="toggleFilter()"><i
                            class="fa-solid fa-sliders"></i> Lọc
                    </button>
                    <div class="dropdown">
                        <button
                                class="btn-outline-secondary dropdown-toggle"
                                type="button"
                                data-bs-toggle="dropdown"
                                aria-expanded="false"
                                id="dropdownButton-products"
                        >
                            Sắp xếp: Phổ biến nhất
                        </button>
                        <ul class="dropdown-menu">
                            <li class="dropdown-item active" data-value="popular" style="cursor: pointer;">
                                Phổ biến nhất
                            </li>
                            <li class="dropdown-item" data-value="latest" style="cursor: pointer;">
                                Mới nhất
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="filter-panel">
                <div class="filter-header">
                    <span class="filter-title"><i class="fa-solid fa-sliders"></i> Chọn tiêu chí muốn lọc</span>
                </div>
                <hr>
                <div class="filter-section">
                    <h4>Dung lượng ảnh tối thiểu</h4>
                    <div class="filter-options">
                        <button class="filter-button">15 MB</button>
                        <button class="filter-button">24 MB</button>
                        <button class="filter-button">30 MB</button>
                        <button class="filter-button">35 MB</button>
                    </div>
                </div>

                <div class="filter-section">
                    <h4>Ngày đăng ảnh</h4>
                    <select class="filter-select">
                        <option value="any">---</option>
                        <option value="last-24h">24 giờ trước</option>
                        <option value="last-week">Tuần trước</option>
                        <option value="last-month">Tháng trước</option>
                    </select>
                </div>

                <div class="filter-section">
                    <div class="filter-options justify-content-end">
                        <button class="filter-button-apply">Áp dụng</button>
                    </div>
                </div>

            </div>
            <div class="photo-products">
                <jsp:useBean id="productSorted" scope="request" type="java.util.List"/>
                <c:forEach var="item" items="${ productSorted }">
                <div class="box">
                    <a href="product-detail?pid=${ item.getId() }">
                        <img src="${ item.getUrl() }" alt="">
                    </a>
                    <div class="info">
                        <p class="fw-semibold">${ item.getName() }</p>
                        <div class="hover-options">
                            <button class="option-button heart fw-bold"><i class="fa-regular fa-heart pe-2"></i>
                                Thích</button>
                            <button class="option-button buy fw-bold addCart" data-product-id=${ item.getId() }>
                                <i class="bi bi-bag-check-fill"></i>
                                Thêm giỏ hàng
                            </button>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
</section>
<!-- products -->

<!-- evaluate -->
<section class="emotion">
    <div class="container d-flex justify-content-between align-items-center flex-column py-3 rounded-3">
        <div class="ques">
            <p class="fw-bold fs-5">Những kết quả này có phù hợp với kết quả của bạn không?
            <div class="icon text-center">
                <i class="fs-3 fa-regular fa-face-laugh-beam"></i>
                <i class="fs-3 fa-regular fa-face-frown-open"></i>
            </div>
        </div>
    </div>
</section>
<!-- evaluate -->

<%-- notification --%>
<div class="alert alert-primary d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0%"
>
    <i class="bi bi-exclamation-triangle"></i><span></span>
</div>
<div class="alert alert-success d-none align-items-center position-fixed"
     role="alert"
     style="display: none; width: 25%; top: 15%; right: 0%"
>
    <i class="bi bi-check2-circle"></i><span></span>
</div>
<%-- notification --%>

<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/scripts.jsp"/>
<script>
    function toggleFilter() {
        const filterPanel = document.querySelector(".filter-panel");
        filterPanel.classList.toggle("active");
    }
</script>

<script>
    $(document).ready(function() {
        // Lắng nghe sự kiện click trên các mục trong dropdown
        $(".dropdown-menu .dropdown-item").on("click", function() {
            $(".dropdown-menu .dropdown-item").removeClass("active");
            $(this).addClass("active");

            var content = $(this).text().trim();
            var sortValue = $(this).data("value");

            $("#dropdownButton-products").text("Sắp xếp: " + content);
            $.ajax({
                url: "products?cid=${ cid }",
                method: "GET",
                dataType: "json",
                data: { sortType: sortValue },
                headers: {
                    "X-Requested-With": "XMLHttpRequest"
                },
                success: function(response) {
                    // Giả sử dữ liệu trả về là JSON (danh sách sản phẩm đã sắp xếp)
                    var products = response; // Nếu server trả về JSON
                    // Cập nhật lại phần tử .photo-products bằng HTML mới
                    var htmlContent = '';
                    $.each(products, function(index, item) {
                        htmlContent += '<div class="box">';
                        htmlContent += '<a href="product-detail?pid=' + item.id + '"><img src="' + item.url + '" alt=""></a>';
                        htmlContent += '<div class="info">';
                        htmlContent += '<p class="fw-semibold">' + item.name + '</p>';
                        htmlContent += '<div class="hover-options">';
                        htmlContent += '<button class="option-button heart fw-bold"><i class="fa-regular fa-heart pe-2"></i> Thích</button>';
                        htmlContent += '<button class="option-button buy fw-bold addCart" data-product-id="'+ item.id +'"><i class="bi bi-bag-check-fill"></i>Thêm giỏ hàng</button>';
                        htmlContent += '</div></div></div>';
                    });
                    // Cập nhật nội dung của photo-products với HTML mới
                    $(".photo-products").html(htmlContent);
                },
                error: function(xhr, status, error) {
                    console.error("AJAX Error: ", error);
                    console.error("Status: ", status);
                    console.error("Response Text: ", xhr.responseText);
                    alert("Có lỗi xảy ra.");
                }
            });
        });
    });
</script>

<script>
    document.addEventListener('click', function(e) {
        if (e.target.classList.contains('addCart')) {
            const productId = e.target.getAttribute('data-product-id');
            e.preventDefault();
            $.ajax({
                url: "addToCart?pid=" + productId,
                method: "POST",
                contentType: "application/json",
                success: function (response) {
                    if (response.addSuccess) {
                        $(".alert-success span").text("Thêm thành công!");
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                            $(this).addClass("d-none");
                        });
                        $("#nav .container a.cart span").text(response.cartLen);
                    } else {
                        $(".alert-primary span").text("Sản phẩm đã có trong giỏ hàng!");
                        $(".alert-primary").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                            $(this).addClass("d-none");
                        });
                    }
                },
                error: function () {
                    alert("Có lỗi xảy ra, vui lòng thử lại sau.");
                }
            });
        }
    });
</script>


</body>

</html>
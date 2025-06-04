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
<!--Đây là trang products-->
<jsp:include page="include/navbar.jsp"/>
<section class="search pt-5 mt-4" style="margin-top: 15px">
    <form action="${pageContext.request.contextPath}/search" method="get" class="search-form">
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
            <input name="content" type="text" id="search-input" placeholder="Tìm kiếm tất cả nguồn">
            <span class="clear-btn text-dark">&#10005;</span>
        </div>
        <button class="search-button" type="submit"><i class="fa-solid fa-magnifying-glass"></i><span class="ps-2">Tìm kiếm</span>
        </button>
    </div>
    </form>
</section>

<!-- products -->
<section class="products">
    <div class="container d-flex flex-column">
        <div class="heading">
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
        <div class="hero-section">
            <div class="container">
                <h2>Thư Viện Hình Ảnh Chất Lượng Cao</h2>
                <p>
                    Khám phá bộ sưu tập hình ảnh bản quyền phong phú cho dự án của bạn
                </p>
            </div>
        </div>

        <main class="container main-content">
            <div class="content-wrapper">
                <aside class="sidebar">
                    <div class="filter-section">
                        <h3>Thẻ phổ biến</h3>
                        <div class="popular-tags">
                            <a href="#" class="tag">Tự nhiên</a>
                            <a href="#" class="tag">Phong cảnh</a>
                            <a href="#" class="tag">Hoa cỏ</a>
                            <a href="#" class="tag">Nhà</a>
                            <a href="#" class="tag">Biển</a>
                            <a href="#" class="tag">Động vật</a>
                            <a href="#" class="tag">Công nghệ</a>
                            <a href="#" class="tag">Kinh doanh</a>
                        </div>
                    </div>

                    <div class="filter-section">
                        <h3>Chọn tiêu chí lọc</h3>
                        <form id="filter-form">
                            <!-- Thêm input hidden để giữ giá trị cid -->
                            <input type="hidden" name="cid" value="${cid}">

                            <div class="filter-group">
                                <h4>Dung lượng ảnh tối thiểu</h4>
                                <select class="form-control" name="size" id="size-filter">
                                    <option value="all">Tất cả kích thước</option>
                                    <option value="small">Nhỏ (≤ 1MP)</option>
                                    <option value="medium">Trung bình (1-5MP)</option>
                                    <option value="large">Lớn (5-10MP)</option>
                                    <option value="very-large">Rất lớn (≥ 10MP)</option>
                                </select>
                            </div>

                            <div class="filter-group">
                                <h4>Ngày đăng ảnh</h4>
                                <select class="form-control" name="date" id="date-filter">
                                    <option value="any">Mọi thời gian</option>
                                    <option value="last-24h">24 giờ qua</option>
                                    <option value="last-week">Tuần này</option>
                                    <option value="last-month">Tháng này</option>
                                    <option value="last-year">Năm nay</option>
                                </select>
                            </div>

                            <div class="filter-group">
                                <h4>Định dạng</h4>
                                <div class="checkbox-group">
                                    <label><input type="checkbox" name="formats" value="jpg" class="format-checkbox"/> JPG</label>
                                    <label><input type="checkbox" name="formats" value="png" class="format-checkbox"/> PNG</label>
                                    <label><input type="checkbox" name="formats" value="svg" class="format-checkbox"/> SVG</label>
                                    <label><input type="checkbox" name="formats" value="webp" class="format-checkbox"/> WEBP</label>
                                </div>
                            </div>

                            <button type="button" class="btn btn-primary btn-block" id="apply-filters">Áp dụng bộ lọc</button>
                            <button type="button" class="btn btn-outline btn-block" id="reset-filters">Đặt lại</button>
                        </form>
                    </div>
                </aside>

                <div class="content">
                    <div class="gallery-header">
                        <h2>Danh mục ảnh <%= path %> có giấy phép bản quyền</h2>
                        <p>
                            Nhiều dữ liệu ảnh, hãy Khám phá nhưng bức ảnh hàng đầu, nổi bật từ
                            CoRiPhoto.
                        </p>

                        <div class="gallery-actions">
                            <div class="sort-options">
                                <span style="color: black">Sắp xếp theo:</span>
                                <span class="sort-item active" data-value="popular" style="cursor: pointer;">Phổ
                                    biến nhất
                                </span>
                                <span class="sort-item" data-value="latest" style="cursor: pointer;">Mới nhất
                                </span>
                            </div>

                            <div class="view-options">
                                <button class="btn-icon active">
                                    <i class="fas fa-th"></i>
                                </button>
                                <button class="btn-icon"><i class="fas fa-th-list"></i></button>
                            </div>
                        </div>
                    </div>

                    <div class="image-gallery">
                        <!-- Vị trí hiển thị hình ảnh - sẽ được điền bởi dữ liệu từ backend -->
                        <div class="photo-products">
                            <jsp:useBean id="productSorted" scope="request" type="java.util.List"/>
                            <c:forEach var="item" items="${ productSorted }">
                                <div class="box">
                                    <a href="product-detail?pid=${ item.getId() }">
                                        <img src="${pageContext.request.contextPath}/watermarkedImage?url=${item.getUrl()}" alt="">
                                    </a>
                                    <div class="info">
                                        <p class="fw-semibold">${ item.getName() }</p>
                                        <div class="hover-options">
                                            <button class="favorite-btn heart option-button fw-bold"
                                                    data-product-id=${ item.getId() }>
                                                <i class="fa-regular fa-heart pe-2"></i>
                                                Thích
                                            </button>
                                            <button class="option-button buy fw-bold addCart"
                                                    data-product-id=${ item.getId() }>
                                                <i class="bi bi-bag-check-fill"></i>
                                                Thêm giỏ hàng
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="pagination">

                    </div>

<%--                    <div class="feedback-card">--%>
<%--                        <h3>Những kết quả này có phù hợp với kết quả của bạn không?</h3>--%>
<%--                        <div class="feedback-actions">--%>
<%--                            <button class="btn btn-feedback">--%>
<%--                                <i class="fas fa-thumbs-up"></i> Có--%>
<%--                            </button>--%>
<%--                            <button class="btn btn-feedback">--%>
<%--                                <i class="fas fa-thumbs-down"></i> Không--%>
<%--                            </button>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
            </div>
        </main>
    </div>
</section>
<!-- products -->

<!-- evaluate -->
<section class="emotion">
    <div class="container d-flex justify-content-between align-items-center flex-column py-3 rounded-3">
        <div class="ques">
            <p class="fw-bold fs-5">Những kết quả này có phù hợp với kết quả của bạn không?
            <div class="icon text-center">
                <button class="btn btn-feedback">
                    <i class="fas fa-thumbs-up"></i> Có
                </button>
                <button class="btn btn-feedback">
                    <i class="fas fa-thumbs-down"></i> Không
                </button>
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
    $(document).ready(function () {
        // Lắng nghe sự kiện click trên nút "Áp dụng bộ lọc"
        $("#apply-filters").on("click", function () {
            applyFilters();
        });

        // Lắng nghe sự kiện click trên nút "Đặt lại"
        $("#reset-filters").on("click", function () {
            // Đặt lại các giá trị trong form về mặc định
            $("#size-filter").val("all");
            $("#date-filter").val("any");
            $(".format-checkbox").prop("checked", false);

            // Áp dụng lọc sau khi đặt lại
            applyFilters();
        });

        // Lắng nghe sự kiện click trên các mục trong phân trang
        $(".pagination a").on("click", function (e) {
            e.preventDefault(); // Ngăn chặn hành động mặc định của liên kết

            // Kiểm tra nếu nút bị vô hiệu hóa
            if ($(this).hasClass("disabled")) {
                return; // Không làm gì nếu nút bị vô hiệu hóa
            }

            // Lấy giá trị của data-value
            var page = $(this).data('value');

            // Lưu trang hiện tại vào dữ liệu lọc và áp dụng lọc
            currentPage = page;
            applyFilters();
        });

        // Biến lưu trạng thái trang hiện tại
        var currentPage = 1;

        // Hàm áp dụng các bộ lọc
        function applyFilters() {
            // Thu thập dữ liệu từ form
            var formData = new FormData();
            formData.append('cid', ${cid});
            formData.append('size', $("#size-filter").val());
            formData.append('date', $("#date-filter").val());
            formData.append('page', currentPage);

            // Thu thập các định dạng đã chọn
            var selectedFormats = [];
            $(".format-checkbox:checked").each(function() {
                selectedFormats.push($(this).val());
                formData.append('formats', $(this).val());
            });

            // Hiển thị hiệu ứng loading (tùy chọn)
            $(".photo-products").html('<div class="loading">Đang tải...</div>');

            // Gửi yêu cầu AJAX để lọc sản phẩm
            $.ajax({
                url: "products",
                method: "POST",
                data: new URLSearchParams(formData),
                processData: false,
                contentType: 'application/x-www-form-urlencoded',
                success: function (response) {
                    // Cập nhật phần hiển thị sản phẩm
                    updateProductDisplay(response.products);

                    // Cập nhật phân trang
                    updatePagination(response.pagination);
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error: ", error);
                    $(".photo-products").html('<div class="error">Có lỗi xảy ra khi tải dữ liệu.</div>');
                }
            });
        }

        // Hàm cập nhật hiển thị sản phẩm
        function updateProductDisplay(products) {
            var htmlContent = '';

            if (products.length === 0) {
                htmlContent = '<div class="no-results">Không có sản phẩm nào phù hợp với tiêu chí lọc.</div>';
            } else {
                $.each(products, function(index, item) {
                    htmlContent += '<div class="box">';
                    htmlContent += '<a href="product-detail?pid=' + item.id + '"><img src="' + "/watermarkedImage?url=" + item.url + '" alt=""></a>';
                    htmlContent += '<div class="info">';
                    htmlContent += '<p class="fw-semibold">' + item.name + '</p>';
                    htmlContent += '<div class="hover-options">';
                    htmlContent += '<button class="favorite-btn heart option-button fw-bold" data-product-id="' + item.id + '"> <i class="fa-regular fa-heart pe-2"></i>Thích </button>';
                    htmlContent += '<button class="option-button buy fw-bold addCart" data-product-id="' + item.id + '"><i class="bi bi-bag-check-fill"></i>Thêm giỏ hàng</button>';
                    htmlContent += '</div></div></div>';
                });
            }

            // Cập nhật nội dung của photo-products với HTML mới
            $(".photo-products").html(htmlContent);
        }

        // Hàm cập nhật hiển thị phân trang
        function updatePagination(pagination) {
            var htmlContent = '';

            // Nút Previous
            htmlContent += '<a href="#" class="prev' + (pagination.currentPage == 1 ? ' disabled' : '') +
                '" data-value="' + (pagination.currentPage - 1) + '"><i class="fas fa-chevron-left"></i></a>';

            // Các nút số trang
            for (var i = 1; i <= pagination.totalPages; i++) {
                if (i === pagination.currentPage) {
                    htmlContent += '<a href="#" class="active" data-value="' + i + '">' + i + '</a>';
                } else {
                    htmlContent += '<a href="#" data-value="' + i + '">' + i + '</a>';
                }
            }

            // Thêm "..." nếu có nhiều trang
            if (pagination.totalPages > 10) {
                htmlContent = htmlContent.replace(/<a href="#" data-value="4".*?<a href="#" data-value="' + pagination.totalPages + '"/,
                    '<a href="#" data-value="4">4</a><span>...</span><a href="#" data-value="' + pagination.totalPages + '"');
            }

            // Nút Next
            htmlContent += '<a href="#" class="next' + (pagination.currentPage == pagination.totalPages ? ' disabled' : '') +
                '" data-value="' + (pagination.currentPage + 1) + '"><i class="fas fa-chevron-right"></i></a>';

            // Cập nhật phân trang
            $(".pagination").html(htmlContent);

            // Tái kết nối sự kiện click cho các nút phân trang mới
            $(".pagination a").on("click", function (e) {
                e.preventDefault();
                if (!$(this).hasClass("disabled")) {
                    currentPage = $(this).data('value');
                    applyFilters();
                }
            });
        }
    });
</script>
<script>
    function toggleFilter() {
        const filterPanel = document.querySelector(".filter-panel");
        filterPanel.classList.toggle("active");
    }
</script>

<script>
    $(document).ready(function () {
        // Lấy totalPages từ request
        var totalPages = <%= request.getAttribute("totalPages") %>;
        var currentPage = 1; // Mặc định là trang 1

        // Hàm tạo phân trang
        function createPagination() {
            var paginationHtml = '';

            // Nút Previous
            if (currentPage > 1) {
                paginationHtml += '<a href="#" class="prev" data-value="' + (currentPage - 1) + '"><i class="fas fa-chevron-left"></i></a>';
            } else {
                paginationHtml += '<a href="#" class="prev disabled"><i class="fas fa-chevron-left"></i></a>';
            }

            // Các số trang
            for (var i = 1; i <= totalPages; i++) {
                if (i === currentPage) {
                    paginationHtml += '<a href="#" class="active" data-value="' + i + '">' + i + '</a>';
                } else {
                    paginationHtml += '<a href="#" data-value="' + i + '">' + i + '</a>';
                }
            }

            // Nút Next
            if (currentPage < totalPages) {
                paginationHtml += '<a href="#" class="next" data-value="' + (currentPage + 1) + '"><i class="fas fa-chevron-right"></i></a>';
            } else {
                paginationHtml += '<a href="#" class="next disabled"><i class="fas fa-chevron-right"></i></a>';
            }

            $('.pagination').html(paginationHtml);
        }

        // Gọi hàm tạo phân trang khi trang được tải
        createPagination();
    })
</script>

<script>
    $(document).ready(function () {
        // Lắng nghe sự kiện click trên các mục trong phân trang
        $(".pagination a").on("click", function (e) {
            e.preventDefault();

            // Lấy giá trị của data-value
            var page = $(this).data('value');
            // alert("Bạn đã nhấn vào trang: " + page);
            $(".pagination a").removeClass("active"); // Xóa lớp active khỏi tất cả các liên kết
            $(this).addClass("active"); // Thêm lớp active cho liên kết được nhấn
            // Gọi hàm tải sản phẩm với trang đã chọn
            loadProducts(page);
        });

        // Hàm tải sản phẩm qua AJAX
        function loadProducts(page) {
            $.ajax({
                url: "products?cid=${cid}",
                method: "GET",
                dataType: "json",
                data: {
                    page: page
                },
                headers: {
                    "X-Requested-With": "XMLHttpRequest"
                },
                success: function (response) {
                    // Giả sử dữ liệu trả về là JSON (danh sách sản phẩm đã sắp xếp)
                    var products = response; // Nếu server trả về JSON
                    // Cập nhật lại phần tử .photo-products bằng HTML mới
                    var htmlContent = '';
                    $.each(products, function (index, item) {
                        htmlContent += '<div class="box">';
                        htmlContent += '<a href="product-detail?pid=' + item.id + '"><img src="' + "/watermarkedImage?url=" + item.url + '" alt=""></a>';
                        htmlContent += '<div class="info">';
                        htmlContent += '<p class="fw-semibold">' + item.name + '</p>';
                        htmlContent += '<div class="hover-options">';
                        htmlContent += '<button class="favorite-btn heart option-button fw-bold" data-product-id="' + item.id + '"> <i class="fa-regular fa-heart pe-2"></i>Thích </button>';
                        htmlContent += '<button class="option-button buy fw-bold addCart" data-product-id="' + item.id + '"><i class="bi bi-bag-check-fill"></i>Thêm giỏ hàng</button>';
                        htmlContent += '</div></div></div>';
                    });
                    // Cập nhật nội dung của photo-products với HTML mới
                    $(".photo-products").html(htmlContent);
                    // Cập nhật phân trang
                    updatePagination(response.pagination);
                },
                error: function (xhr, status, error) {
                    console.error("AJAX Error: ", error);
                    alert("Có lỗi xảy ra khi tải dữ liệu.");
                }
            });
        }
    });
</script>

<script>
    $(document).ready(function () {
        // Lắng nghe sự kiện click trên các mục trong dropdown
        $(".sort-options .sort-item").on("click", function () {
            $(".sort-options .sort-item").removeClass("active");
            $(this).addClass("active");

            const sortValue = $(this).data("value");

            $.ajax({
                url: "products?cid=${ cid }",
                method: "GET",
                dataType: "json",
                data: {sortType: sortValue},
                headers: {
                    "X-Requested-With": "XMLHttpRequest"
                },
                success: function (response) {
                    // Giả sử dữ liệu trả về là JSON (danh sách sản phẩm đã sắp xếp)
                    var products = response; // Nếu server trả về JSON
                    // Cập nhật lại phần tử .photo-products bằng HTML mới
                    var htmlContent = '';
                    $.each(products, function (index, item) {
                        htmlContent += '<div class="box">';
                        htmlContent += '<a href="product-detail?pid=' + item.id + '"><img src="' + "/watermarkedImage?url=" + item.url + '" alt=""></a>';
                        htmlContent += '<div class="info">';
                        htmlContent += '<p class="fw-semibold">' + item.name + '</p>';
                        htmlContent += '<div class="hover-options">';
                        htmlContent += '<button class="favorite-btn heart option-button fw-bold" data-product-id="' + item.id + '"> <i class="fa-regular fa-heart pe-2"></i>Thích </button>';
                        htmlContent += '<button class="option-button buy fw-bold addCart" data-product-id="' + item.id + '"><i class="bi bi-bag-check-fill"></i>Thêm giỏ hàng</button>';
                        htmlContent += '</div></div></div>';
                    });
                    // Cập nhật nội dung của photo-products với HTML mới
                    $(".photo-products").html(htmlContent);
                },
                error: function (xhr, status, error) {
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
    document.addEventListener('click', function (e) {
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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const favoriteButtons = document.querySelectorAll('.favorite-btn');

        favoriteButtons.forEach(button => {
            button.addEventListener('click', function (event) {
                event.preventDefault();

                const productId = this.getAttribute('data-product-id');
                // Kiểm tra nếu productId bị rỗng
                if (!productId || productId === '') {
                    alert("Không thể thêm vào danh sách yêu thích. ID sản phẩm không hợp lệ." + productId);
                    return;
                }

                // Gửi yêu cầu AJAX đến Servlet
                fetch('AddFavourite', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: `action=add&productId=` + productId
                })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            this.querySelector('i').classList.remove('fa-regular');
                            this.querySelector('i').classList.add('fa-solid');
                            $(".alert-success span").text(data.message);
                            $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                                $(this).addClass("d-none");
                            });
                        } else {
                            $(".alert-success span").text(data.message);
                            $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                                $(this).addClass("d-none");
                            });
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                        alert('Có lỗi xảy ra khi thêm vào danh sách yêu thích.');
                    });
            });
        });
    });
</script>

</body>

</html>
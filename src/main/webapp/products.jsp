<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="include/head.jsp"/>
    <title>Products</title>
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<section class="search pt-5 mt-3" style="margin-top: 15px">
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
                <p class="text-secondary">1231 dữ liệu ảnh, hãy Khám phá nhưng bức ảnh hàng đầu, nổi bật từ
                    CoRiPhoto.</p>
                <div class="tool d-flex justify-content-between">
                    <button class="btn border-secondary" onclick="toggleFilter()"><i
                            class="fa-solid fa-sliders"></i> Lọc
                    </button>
                    <div class="dropdown">
                        <button class="btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Sắp xếp: Phổ biến nhất
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="products?popular=true %>">Phổ biến nhất</a></li>
                            <li><a class="dropdown-item" href="products?latest=true">Mới nhất</a></li>
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
                <jsp:useBean id="products" scope="request" type="java.util.List"/>
                <c:forEach var="item" items="${ products }">
                <div class="box">
                    <a href="#">
                        <img src="${ item.getUrl() }" alt="">
                    </a>
                    <div class="info">
                        <p class="fw-semibold">${ item.getName() }</p>
                        <div class="hover-options">
                            <button class="option-button heart fw-bold"><i class="fa-regular fa-heart pe-2"></i>
                                Thích</button>
                            <button class="option-button buy fw-bold"><i class="fa-solid fa-down-long pe-2"></i> <a
                                    href="product_details.html">Tải ảnh</a></button>
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

<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/scripts.jsp"/>
<script>
    function toggleFilter() {
        const filterPanel = document.querySelector(".filter-panel");
        filterPanel.classList.toggle("active");
    }
</script>
</body>

</html>
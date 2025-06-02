<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <title>Category Details</title>
    <jsp:include page="include/head.jsp" />
    <link rel="stylesheet" href="./assets/css/category-details.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<!-- Enhanced Search Banner -->
<section class="search-banner">
    <div class="banner-background">
        <div class="animated-shapes">
            <div class="shape shape-1"></div>
            <div class="shape shape-2"></div>
            <div class="shape shape-3"></div>
        </div>
    </div>

    <div class="banner-content">
        <div class="container">
            <div class="banner-header" data-aos="fade-up">
                <h1 class="banner-title">Không tìm thấy điều bạn cần?</h1>
                <p class="banner-subtitle">
                    Hãy thử tìm kiếm với từ khóa khác hoặc khám phá bộ sưu tập của
                    chúng tôi
                </p>
            </div>

            <div class="search-wrapper" data-aos="fade-up" data-aos-delay="200">
                <div class="search-box">
                    <!-- Category Dropdown -->
                    <div class="search-category">
                        <button class="category-btn" id="categoryBtn">
                            <i class="fas fa-images"></i>
                            <span class="category-text">Tất cả ảnh</span>
                            <i class="fas fa-chevron-down arrow"></i>
                        </button>
                        <div class="category-dropdown" id="categoryDropdown">
                            <div
                                    class="dropdown-item active"
                                    data-value="all"
                                    data-icon="fa-images"
                            >
                                <i class="fas fa-images"></i>
                                <span>Tất cả ảnh</span>
                            </div>
                            <div
                                    class="dropdown-item"
                                    data-value="photo"
                                    data-icon="fa-camera"
                            >
                                <i class="fas fa-camera"></i>
                                <span>Ảnh chụp</span>
                            </div>
                            <div
                                    class="dropdown-item"
                                    data-value="vector"
                                    data-icon="fa-vector-square"
                            >
                                <i class="fas fa-vector-square"></i>
                                <span>Vectors</span>
                            </div>
                            <div
                                    class="dropdown-item"
                                    data-value="ai"
                                    data-icon="fa-brain"
                            >
                                <i class="fas fa-brain"></i>
                                <span>AI</span>
                            </div>
                        </div>
                    </div>

                    <!-- Search Input -->
                    <div class="search-input-wrapper">
                        <input
                                type="text"
                                class="search-input"
                                id="searchInput"
                                placeholder="Tìm kiếm hình ảnh, vectors, AI..."
                                autocomplete="off"
                        />
                        <button class="clear-btn" id="clearBtn">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>

                    <!-- Search Button -->
                    <button class="search-btn" id="searchBtn">
                        <i class="fas fa-search"></i>
                        <span>Tìm kiếm</span>
                    </button>
                </div>

                <!-- Popular Searches -->
                <div
                        class="popular-searches"
                        data-aos="fade-up"
                        data-aos-delay="400"
                >
                    <span class="popular-label">Tìm kiếm phổ biến:</span>
                    <div class="tag-list">
                        <a href="#" class="search-tag">Thiên nhiên</a>
                        <a href="#" class="search-tag">Công nghệ</a>
                        <a href="#" class="search-tag">Abstract</a>
                        <a href="#" class="search-tag">Business</a>
                        <a href="#" class="search-tag">Động vật</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Hero Banner Section -->
<section class="hero-banner">
    <div class="banner-overlay"></div>
    <div class="banner-content">
        <div class="container">
            <h1 class="banner-title" data-aos="fade-up">
                Khám phá hàng trăm ảnh có bản quyền của chúng tôi
            </h1>
            <p class="banner-description" data-aos="fade-up" data-aos-delay="200">
                Với hàng trăm hình ảnh bản quyền trong danh mục của chúng tôi và nhiều hình ảnh khác
                được thêm vào mỗi ngày, bạn chắc chắn sẽ tìm thấy hình ảnh hoặc đồ họa hoàn hảo cho
                dự án tiếp theo của mình tại CoRiPhoto.
            </p>
            <div class="banner-stats" data-aos="fade-up" data-aos-delay="400">
                <div class="stat-item">
                    <i class="fas fa-images"></i>
                    <h3>10K+</h3>
                    <p>Hình ảnh</p>
                </div>
                <div class="stat-item">
                    <i class="fas fa-folder"></i>
                    <h3>50+</h3>
                    <p>Danh mục</p>
                </div>
                <div class="stat-item">
                    <i class="fas fa-download"></i>
                    <h3>100K+</h3>
                    <p>Lượt tải</p>
                </div>
            </div>
        </div>
    </div>
    <div class="banner-shape">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320">
            <path fill="#ffffff" fill-opacity="1" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,122.7C672,117,768,139,864,154.7C960,171,1056,181,1152,165.3C1248,149,1344,107,1392,85.3L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path>
        </svg>
    </div>
</section>

<!-- Categories Section -->
<section class="category-section">
    <div class="container">
        <div class="section-header" data-aos="fade-up">
            <h2 class="section-title">Danh mục hình ảnh</h2>
            <p class="section-subtitle">Khám phá bộ sưu tập đa dạng với nhiều chủ đề khác nhau</p>
        </div>

        <div class="category-filter" data-aos="fade-up" data-aos-delay="200">
            <button class="filter-btn active" data-filter="all">Tất cả</button>
            <button class="filter-btn" data-filter="popular">Phổ biến</button>
            <button class="filter-btn" data-filter="new">Mới nhất</button>
            <button class="filter-btn" data-filter="trending">Xu hướng</button>
        </div>

        <div class="category-grid">
            <jsp:useBean id="categories" scope="request" type="java.util.List"/>
            <c:forEach var="item" items="${categories}" varStatus="status">
                <div class="category-card" data-aos="fade-up" data-aos-delay="${status.index * 100}">
                    <a href="products?cid=${item.getCid()}" class="card-link">
                        <div class="card-image">
                            <img src="${item.getUrl()}" alt="${item.getName()}" loading="lazy">
                            <div class="card-overlay">
                                <div class="overlay-content">
                                    <i class="fas fa-arrow-right"></i>
                                </div>
                            </div>
                        </div>
                        <div class="card-content">
                            <h3 class="card-title">${item.getName()}</h3>
                            <div class="card-meta">
                                    <span class="item-count">
                                        <i class="fas fa-images"></i> 10 ảnh
                                    </span>
                                <span class="view-count">
                                        <i class="fas fa-eye"></i> 1k+
                                    </span>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>

        <div class="load-more" data-aos="fade-up">
            <button class="btn-load-more">
                Xem thêm danh mục
                <i class="fas fa-chevron-down"></i>
            </button>
        </div>
    </div>
</section>

<!-- Content Tabs Section -->
<section class="content-section">
    <div class="container">
        <div class="section-header" data-aos="fade-up">
            <h2 class="section-title">Ứng dụng trong thực tế</h2>
            <p class="section-subtitle">Khám phá cách sử dụng hình ảnh trong các lĩnh vực khác nhau</p>
        </div>

        <div class="tab-container" data-aos="fade-up" data-aos-delay="200">
            <div class="tab-header">
                <button class="tab-btn active" data-target="social-network">
                    <i class="fas fa-share-alt"></i>
                    <span>Mạng xã hội</span>
                </button>
                <button class="tab-btn" data-target="marketing">
                    <i class="fas fa-bullhorn"></i>
                    <span>Chiến dịch thị trường</span>
                </button>
                <button class="tab-btn" data-target="design">
                    <i class="fas fa-laptop-code"></i>
                    <span>Thiết kế website</span>
                </button>
                <button class="tab-btn" data-target="creative">
                    <i class="fas fa-lightbulb"></i>
                    <span>Sáng tạo dự án</span>
                </button>
            </div>

            <div class="tab-content">
                <!-- Social Network Tab -->
                <div class="content-panel active" id="social-network">
                    <div class="content-wrapper">
                        <div class="content-text">
                            <h3>Mạng xã hội</h3>
                            <div class="content-list">
                                <div class="list-item">
                                    <i class="fas fa-check-circle"></i>
                                    <p>Nghiên cứu trên mạng xã hội đã chỉ ra rằng việc thường xuyên đăng nội dung là một trong những chìa
                                        khóa thu hút khán giả. Bạn không có thời gian đi loanh quanh để chụp ảnh cho Instagram của mình? Đừng
                                        lo lắng. Thư viện hình ảnh miễn phí khổng lồ của CoRiPhoto luôn sẵn sàng trợ giúp.</p>
                                </div>
                                <div class="list-item">
                                    <i class="fas fa-check-circle"></i>
                                    <p>Bạn có bảng màu cụ thể mà bạn sử dụng trên Instagram của mình nhưng ảnh bạn
                                        tìm thấy trong thư viện của chúng tôi không hoàn toàn khớp với nhau? Sử dụng CoRiPhoto Editor để điều chỉnh màu sắc của hình ảnh
                                        miễn phí bản quyền.</p>
                                </div>
                            </div>
                            <a href="#" class="btn-primary">
                                Khám phá ngay
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="content-image">
                            <img src="./assets/images/People/9.jpg" alt="Social Media">
                            <div class="image-decoration"></div>
                        </div>
                    </div>
                </div>

                <!-- Marketing Tab -->
                <div class="content-panel" id="marketing">
                    <div class="content-wrapper">
                        <div class="content-text">
                            <h3>Chiến dịch thị trường</h3>
                            <div class="content-list">
                                <div class="list-item">
                                    <i class="fas fa-check-circle"></i>
                                    <p>Thêm không khí đích thực vào chiến dịch tiếp thị tiếp theo của bạn bằng
                                        những bức ảnh miễn phí bản quyền. Không có gì ngạc nhiên khi người tiêu dùng phản ứng tích cực hơn với những
                                        người có vẻ ngoài chân thật trong các quảng cáo mà họ xem.</p>
                                </div>
                            </div>
                            <a href="#" class="btn-primary">
                                Khám phá ngay
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="content-image">
                            <img src="./assets/images/Commercial/2.jpg" alt="Marketing">
                            <div class="image-decoration"></div>
                        </div>
                    </div>
                </div>

                <!-- Design Tab -->
                <div class="content-panel" id="design">
                    <div class="content-wrapper">
                        <div class="content-text">
                            <h3>Thiết kế web</h3>
                            <div class="content-list">
                                <div class="list-item">
                                    <i class="fas fa-check-circle"></i>
                                    <p>Làm nổi bật thiết kế trang web của bạn và nổi bật giữa đám đông bằng
                                        hình ảnh miễn phí bản quyền. Hãy thử khám phá trang hình ảnh "Tóm tắt" được tuyển chọn của CoRiPhoto.</p>
                                </div>
                                <div class="list-item">
                                    <i class="fas fa-check-circle"></i>
                                    <p>Sử dụng các tùy chọn bộ lọc của CoRiPhoto để chọn màu chính bạn muốn
                                        làm nổi bật trong hình ảnh của mình.</p>
                                </div>
                            </div>
                            <a href="#" class="btn-primary">
                                Khám phá ngay
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="content-image">
                            <img src="./assets/images/technology/data/7.webp" alt="Web Design">
                            <div class="image-decoration"></div>
                        </div>
                    </div>
                </div>

                <!-- Creative Tab -->
                <div class="content-panel" id="creative">
                    <div class="content-wrapper">
                        <div class="content-text">
                            <h3>Sáng tạo dự án</h3>
                            <div class="content-list">
                                <div class="list-item">
                                    <i class="fas fa-check-circle"></i>
                                    <p>Với hàng triệu hình ảnh miễn phí bản quyền để lựa chọn và thư viện hình ảnh
                                        ngày càng phát triển, CoRiPhoto chắc chắn sẽ có ảnh, hình minh họa hoặc vectơ để đáp ứng nhu cầu sáng
                                        tạo của bạn.</p>
                                </div>
                            </div>
                            <a href="#" class="btn-primary">
                                Khám phá ngay
                                <i class="fas fa-arrow-right"></i>
                            </a>
                        </div>
                        <div class="content-image">
                            <img src="./assets/images/HandScenery/007.jpg" alt="Creative Projects">
                            <div class="image-decoration"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Call to Action Section -->
<section class="cta-section">
    <div class="container">
        <div class="cta-content" data-aos="zoom-in">
            <h2>Bắt đầu khám phá ngay hôm nay</h2>
            <p>Tham gia cùng hàng nghìn người dùng đang sử dụng CoRiPhoto</p>
            <button class="btn-cta">
                Đăng ký miễn phí
                <i class="fas fa-arrow-right"></i>
            </button>
        </div>
    </div>
</section>

<!-- Scripts -->
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="{pageContext.request.contextPath}/assets/js/category-details.js"></script>
<jsp:include page="include/footer.jsp"/>

<jsp:include page="include/scripts.jsp"/>
</body>

</html>

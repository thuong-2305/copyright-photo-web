<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
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

<!-- Search Results Page -->
<section class="search-page">
    <!-- Search Header -->
    <div class="search-header">
        <div class="container">
            <div class="search-box-wrapper">
                <form action="${pageContext.request.contextPath}/search" method="get" class="search-form">
                <div class="search-box">
                    <div class="search-category-select">
                        <button class="category-toggle" id="categoryToggle">
                            <i class="fas fa-images"></i>
                            <span>Tất cả ảnh</span>
                            <i class="fas fa-chevron-down"></i>
                        </button>
                        <div class="category-dropdown" id="categoryDropdown">
                            <div class="dropdown-item active" data-value="all">
                                <i class="fas fa-images"></i>
                                <span>Tất cả ảnh</span>
                            </div>
                            <div class="dropdown-item" data-value="photo">
                                <i class="fas fa-camera"></i>
                                <span>Ảnh chụp</span>
                            </div>
                            <div class="dropdown-item" data-value="vector">
                                <i class="fas fa-vector-square"></i>
                                <span>Vectors</span>
                            </div>
                            <div class="dropdown-item" data-value="ai">
                                <i class="fas fa-brain"></i>
                                <span>AI</span>
                            </div>
                        </div>
                    </div>

                    <div class="search-input-group">
                        <input
                                type="text"
                                class="search-input"
                                id="searchInput"
                                name="content"
                                placeholder="Tìm kiếm hình ảnh..."
                                value="${content}"
                        >
                        <button class="clear-btn" id="clearBtn" type="submit">
                            <i class="fas fa-times"></i>
                        </button>
                    </div>

                    <button class="search-submit">
                        <i class="fas fa-search"></i>
                        <span>Tìm kiếm</span>
                    </button>
                </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="search-content">
        <div class="container">
            <div class="content-wrapper">
                <!-- Sidebar Filters -->
                <aside class="filters-sidebar">
                    <div class="filter-section">
                        <h3 class="filter-title">
                            <i class="fas fa-filter"></i>
                            Bộ lọc
                        </h3>

                        <!-- Price Filter -->
                        <div class="filter-group">
                            <h4 class="filter-label">Giá</h4>
                            <div class="price-range">
                                <input type="range" min="0" max="1000000" value="0" class="price-slider" id="minPrice">
                                <input type="range" min="0" max="1000000" value="1000000" class="price-slider" id="maxPrice">
                                <div class="price-values">
                                    <span id="minPriceValue">0đ</span>
                                    <span id="maxPriceValue">1.000.000đ</span>
                                </div>
                            </div>
                        </div>

                        <!-- Size Filter -->
                        <div class="filter-group">
                            <h4 class="filter-label">Kích thước</h4>
                            <div class="checkbox-list">
                                <label class="checkbox-item">
                                    <input type="checkbox" value="small">
                                    <span class="checkmark"></span>
                                    <span>Nhỏ (< 1MP)</span>
                                </label>
                                <label class="checkbox-item">
                                    <input type="checkbox" value="medium">
                                    <span class="checkmark"></span>
                                    <span>Vừa (1-5MP)</span>
                                </label>
                                <label class="checkbox-item">
                                    <input type="checkbox" value="large">
                                    <span class="checkmark"></span>
                                    <span>Lớn (> 5MP)</span>
                                </label>
                            </div>
                        </div>

                        <!-- Thay thế phần Color Filter bằng Quality Filter -->
                        <div class="filter-group">
                            <h4 class="filter-label">Chất lượng ảnh</h4>
                            <div class="radio-list">
                                <label class="radio-item">
                                    <input type="radio" name="quality" value="standard">
                                    <span class="radio-mark"></span>
                                    <span>Chuẩn (HD)</span>
                                </label>
                                <label class="radio-item">
                                    <input type="radio" name="quality" value="hd">
                                    <span class="radio-mark"></span>
                                    <span>Full HD (2K)</span>
                                </label>
                                <label class="radio-item">
                                    <input type="radio" name="quality" value="4k">
                                    <span class="radio-mark"></span>
                                    <span>Ultra HD (4K+)</span>
                                </label>
                            </div>
                        </div>


                        <button class="apply-filters-btn">
                            <i class="fas fa-check"></i>
                            Áp dụng bộ lọc
                        </button>
                    </div>
                </aside>

                <!-- Products Section -->
                <div class="products-section">
                    <!-- Search Info - Moved here -->
                    <div class="search-info">
                        <h1 class="search-title">
                            Kết quả tìm kiếm cho "<span class="keyword">${content}</span>"
                        </h1>
                        <p class="result-count">
                            Tìm thấy <span class="count">${products.size()}</span> kết quả
                        </p>
                    </div>

                    <!-- Sort Bar -->
                    <div class="sort-bar">
                        <div class="view-options">
                            <button class="view-btn active" data-view="grid">
                                <i class="fas fa-th"></i>
                            </button>
                            <button class="view-btn" data-view="list">
                                <i class="fas fa-list"></i>
                            </button>
                        </div>

                        <div class="sort-dropdown">
                            <select class="sort-select" id="sortSelect">
                                <option value="relevant">Phù hợp nhất</option>
                                <option value="newest">Mới nhất</option>
                                <option value="popular">Phổ biến nhất</option>
                                <option value="price-low">Giá thấp đến cao</option>
                                <option value="price-high">Giá cao đến thấp</option>
                            </select>
                        </div>
                    </div>

                    <!-- Products Grid -->
                    <div class="products-grid" id="productsGrid">
                        <% List<Product> products = (List<Product>) request.getAttribute("products"); %>
                        <% if (products != null && !products.isEmpty()) { %>
                        <% for (Product item : products) { %>
                        <div class="product-card" data-aos="fade-up">
                            <div class="card-inner">
                                <div class="product-image">
                                    <a href="product-detail?pid=<%= item.getId() %>">
                                        <img src="<%= item.getUrl() %>" alt="<%= item.getName() %>" loading="lazy">
                                        <div class="image-overlay">
                                            <button class="quick-view-btn" data-id="<%= item.getId() %>">
                                                <i class="fas fa-eye"></i>
                                                <span>Xem nhanh</span>
                                            </button>
                                        </div>
                                    </a>
                                    <div class="product-badges">
                                        <% if (item.getDateUpload().isAfter(LocalDateTime.now().minusDays(7))) { %>
                                        <span class="badge badge-new">Mới</span>
                                        <% } %>
                                    </div>
                                </div>

                                <div class="product-info">
                                    <h3 class="product-title">
                                        <a href="product-detail?pid=<%= item.getId() %>">
                                            <%= item.getName() %>
                                        </a>
                                    </h3>

                                    <div class="product-meta">
                                                <span class="product-category">
                                                    <i class="fas fa-folder"></i>
                                                    <%= item.getCategory() %>
                                                </span>
                                        <span class="product-size">
                                                    <i class="fas fa-expand"></i>
                                                    <%= item.getDimension() %>
                                                </span>
                                    </div>

                                    <div class="product-price">
                                        <span class="price"><%= String.format("%,.0f", item.getPrice()) %>đ</span>
                                    </div>

                                    <div class="product-actions">
                                        <button class="btn-favorite" data-id="<%= item.getId() %>">
                                            <i class="far fa-heart"></i>
                                        </button>
                                        <button class="btn-add-cart" data-product-id="<%= item.getId() %>">
                                            <i class="fas fa-shopping-cart"></i>
                                            <span>Thêm vào giỏ</span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                        <% } else { %>
                        <!-- Empty State -->
                        <div class="empty-state">
                            <img src="/assets/images/empty-search.svg" alt="No results">
                            <h3>Không tìm thấy kết quả</h3>
                            <p>Hãy thử tìm kiếm với từ khóa khác hoặc điều chỉnh bộ lọc</p>
                            <button class="btn-reset" onclick="resetSearch()">
                                <i class="fas fa-redo"></i>
                                Tìm kiếm lại
                            </button>
                        </div>
                        <% } %>
                    </div>

                    <!-- Pagination -->
                    <% if (products != null && !products.isEmpty()) { %>
                    <div class="pagination">
                        <button class="page-btn prev" disabled>
                            <i class="fas fa-chevron-left"></i>
                        </button>
                        <button class="page-btn active">1</button>
                        <button class="page-btn">2</button>
                        <button class="page-btn">3</button>
                        <span class="page-dots">...</span>
                        <button class="page-btn">10</button>
                        <button class="page-btn next">
                            <i class="fas fa-chevron-right"></i>
                        </button>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Quick View Modal -->
<div class="modal" id="quickViewModal">
    <div class="modal-content">
        <span class="modal-close">&times;</span>
        <div class="modal-body">
        </div>
    </div>
</div>

<script src="assets/js/search.js"></script>
<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/scripts.jsp"/>
</body>
</html>

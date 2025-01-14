<%@ page import="vn.edu.hcmuaf.fit.coriphoto.model.Product" %>
<%@ page import="java.util.List" %>
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
        <button onclick="submitSearch()" class="search-button"><i class="fa-solid fa-magnifying-glass"></i><span class="ps-2">Tìm kiếm</span></button>
    </div>
</section>

<!-- products -->
<section class="products">
    <div class="container d-flex flex-column">
        <div class="heading">
            <div style="height: 20px">
            </div>
            <div class="path">
                <p class="text-primary">
                    <span class="fw-semibold">Các ảnh liên quan đến từ khóa : </span>${ content }
                </p>
            </div>
        </div>
        <div class="show-products">
            <div class="photo-products">
                <% List<Product> products = (List<Product>) request.getAttribute("products"); %>
                <% for (Product item : products) { %>
                    <div class="box">
                        <a href="product-detail?pid=<%= item.getId() %>">
                            <img src="<%= item.getUrl() %>" alt="">
                        </a>
                        <div class="info">
                            <p class="fw-semibold"><%= item.getName() %></p>
                            <div class="hover-options">
                                <button class="option-button heart fw-bold"><i class="fa-regular fa-heart pe-2"></i>
                                    Thích</button>
                                <button class="option-button buy fw-bold addCart" data-product-id=<%= item.getId() %>>
                                    <i class="bi bi-bag-check-fill"></i>
                                    Thêm giỏ hàng
                                </button>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
    </div>
</section>
<!-- products -->
<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/scripts.jsp"/>
</body>
</html>

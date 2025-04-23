<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentURL = request.getRequestURI();
%>
<section class="left d-flex flex-column justify-content-between">
    <div class="top-left">
        <p class="fs-5 fw-semibold m-0 text-center mt-2">
            <span class="text-logo fw-bold">CoRiPhoto</span> Admin
        </p>
        <ul class="list-unstyled">
            <li class="<%= currentURL.contains("/ShowDashBoard") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/ShowDashBoard">
                    <i class="fa-solid fa-house"></i>Trang chủ
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-products") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-products">
                    <i class="bi bi-grid-fill"></i>Sản phẩm
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-category") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-category">
                    <i class="bi bi-list-task"></i>Danh mục
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-order") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-order">
                    <i class="bi bi-wallet-fill"></i>Đơn hàng
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-customer") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-customer">
                    <i class="fa-solid fa-user"></i>Khách hàng
                </a>
            </li>
            <hr>
            <li class="<%= currentURL.contains("/admin-notification") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-notification">
                    <i class="bi bi-bell-fill"></i>Thông báo
                </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/homepage">
                    <i class="bi bi-box-arrow-right"></i>Đăng xuất
                </a>
            </li>
        </ul>
    </div>
</section>


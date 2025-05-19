<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String currentURL = request.getRequestURI();
%>
<section class="left d-flex flex-column justify-content-between">
    <div class="top-left">
        <p class="fs-5 fw-semibold m-0 text-center mt-2 title-logo">
            <span class="text-logo fw-bold">CoRiPhoto</span> Admin
        </p>
        <ul class="list-unstyled">
            <li class="<%= currentURL.contains("/admin-homepage.jsp") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/ShowDashBoard">
                    <i class="fa-solid fa-house"></i><span>Trang chủ</span>
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-products") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-products">
                    <i class="bi bi-grid-fill"></i><span>Sản phẩm</span>
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-category") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-category">
                    <i class="bi bi-list-task"></i><span>Danh mục</span>
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-order") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-order">
                    <i class="bi bi-wallet-fill"></i><span>Đơn hàng</span>
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-customer") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-customer">
                    <i class="fa-solid fa-user"></i><span>Khách hàng</span>
                </a>
            </li>
            <li class="<%= currentURL.contains("/admin-log") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-log">
                    <i class="fa-solid fa-user"></i><span>Tài khoản</span>
                </a>
            </li>
            <hr>
            <li class="<%= currentURL.contains("/admin-notification") ? "active" : "" %>">
                <a href="${pageContext.request.contextPath}/admin-notification">
                    <i class="bi bi-bell-fill"></i><span>Thông báo</span>
                </a>
            </li>
        </ul>
    </div>
</section>


<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Trang xác nhận đặt hàng thành công">
    <title>Đặt hàng thành công</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <!-- Custom CSS -->
    <jsp:include page="include/head.jsp"/>

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
    </style>

    <link rel="stylesheet" href="./assets/css/order-success.css">

</head>
<body>
<jsp:include page="include/navbar.jsp"/>

<div class="container notification-container mt-4">
    <div class="card my-5 p-4 text-center">
        <div class="icon-success mb-3">
            <i class="fas fa-shield-alt fa-3x"></i>
        </div>
        <h1 class="display-4 mb-3">Cảm ơn bạn đã đặt hàng!</h1>
        <p class="lead mb-3">
            Vui lòng kiểm tra email của bạn để nhận được thông tin chi tiết về đơn hàng của chúng tôi.<br>
            Mọi thông tin cần thiết về đơn hàng đã được gửi đến email của bạn.
        </p>
        <p class="text-muted mb-4">Ngày đặt hàng: <%= new SimpleDateFormat("dd/MM/yyyy").format(new Date()) %></p>
        <a href="/" class="btn btn-custom btn-lg">Quay lại trang chủ</a>
    </div>
</div>

<jsp:include page="include/footer.jsp"/>
<jsp:include page="include/scripts.jsp"/>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
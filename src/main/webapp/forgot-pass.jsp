<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 12/28/2024
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css" />
    <link rel="stylesheet" href="./assets/css/forgot-pass.css" />
</head>
<body>
<div class="frame-forgot">
    <div class="forgot-container">
        <h2 class="text-center mb-4">Bạn quên mật khẩu?</h2>
        <p class="text-center">
            Nhập địa chỉ email của bạn và chúng tôi sẽ gửi cho bạn hướng dẫn để
            đặt lại mật khẩu.
        </p>
        <form>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" placeholder="Nhập email của bạn" required />
            </div>
            <button type="submit" class="btn btn-send w-100 mb-3">
                Gửi email
            </button>
        </form>
        <a href="login" class="btn btn-back">Quay trở lại đăng nhập</a>
    </div>
</div>
<jsp:include page="include/scripts.jsp"/>
</body>
</html>

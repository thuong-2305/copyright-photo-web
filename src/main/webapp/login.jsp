<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Windows
  Date: 12/28/2024
  Time: 9:47 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css"/>
    <link rel="stylesheet" href="./assets/css/login.css"/>
</head>
<body>
<div class="content">
    <div class="image-about">
        <img src="./assets/images/Animal/7.jpg" alt=""/>
    </div>
    <div class="frame-login">
        <div class="login-container">
            <h2 class="text-center mb-4">Đăng nhập</h2>
            <form action="login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input name="email" type="email" class="form-control" id="email" placeholder="Nhập email của bạn"
                           required value="${email != null ? email : ''}"/>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label d-flex justify-content-between">
                        Mật khẩu:<a href="forgot-pass.jsp" class="text-decoration-none">Quên mật khẩu?</a>
                    </label>
                    <input name="password" type="password" class="form-control" id="password" placeholder="Nhập mật khẩu của bạn" required />
                </div>
                <p class="text-danger">${ error }</p>
                <button type="submit" class="btn btn-login w-100 mb-3">
                    Đăng nhập
                </button>
            </form>
            <button class="btn btn-google">
                <i class="fa-brands fa-google"></i>Đăng nhập bằng Google
            </button>
            <div class="text-center mt-4">
                <span>Bạn chưa có tài khoản?
                    <a href="signup.jsp" class="text-decoration-none">Đăng ký</a>
                </span>
            </div>
        </div>
    </div>
</div>

<jsp:include page="include/scripts.jsp"/>
</body>
</html>

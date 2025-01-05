<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <p class="text-danger">${ errorEmail }</p>
                <div class="mb-3">
                    <label for="password" class="form-label d-flex justify-content-between">
                        Mật khẩu:<a href="forgot-pass.jsp" class="text-decoration-none">Quên mật khẩu?</a>
                    </label>
                    <input name="password" type="password" class="form-control" id="password" placeholder="Nhập mật khẩu của bạn" required />
                </div>
                <p class="text-danger">${ errorPassword }</p>
                <button type="submit" class="btn btn-login w-100 mb-3">
                    Đăng nhập
                </button>
            </form>

            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
            &redirect_uri=http://localhost:8080/CoRiPhoto/login&response_type=code
&client_id=347849780193-j9q68d1s2iu8g598kc2tsgqcdd2r4ved.apps.googleusercontent.com" class="btn btn-google">
                <i class="fa-brands fa-google"></i>Đăng nhập bằng Google
            </a>
            <div class="text-center mt-4">
                <span>Bạn chưa có tài khoản?
                    <a href="signup" class="text-decoration-none">Đăng ký</a>
                </span>
            </div>
        </div>
    </div>
</div>

<jsp:include page="include/scripts.jsp"/>
</body>
</html>

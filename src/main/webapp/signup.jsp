<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng ký</title>
    <link rel="stylesheet" href="./assets/css/forgot-pass.css"/>
    <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css" />
    <link rel="stylesheet" href="./assets/css/signup.css" />
</head>

<body>
<div class="content">
    <div class="image-about">
        <img src="./assets/images/Animal/7.jpg" alt=""/>
    </div>
    <div class="frame-signup">
        <div class="signup-container">
            <h2 class="text-center mb-4">Đăng ký</h2>
            <form action="signup" method="post">
                <p class="text-danger">${ error }</p>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input
                            name="email"
                            type="email"
                            class="form-control"
                            id="email"
                            placeholder="Nhập email của bạn"
                            required
                    />
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Tên người dùng: </label>
                    <input
                            name="username"
                            type="text"
                            class="form-control"
                            id="username"
                            placeholder="Nhập tên tài khoản"
                            required
                    />
                </div>
                <div class="mb-3">
                    <label
                            for="password"
                            class="form-label d-flex justify-content-between"
                    >
                        Mật khẩu:
                    </label>
                    <input
                            name = "password"
                            type="password"
                            class="form-control"
                            id="password"
                            placeholder="Nhập mật khẩu của bạn"
                            required
                    />
                </div>
                <div class="mb-3">
                    <label
                            for="password"
                            class="form-label d-flex justify-content-between"
                    >
                        Nhập lại mật khẩu:
                    </label>
                    <input
                            name="confirmPassword"
                            type="password"
                            class="form-control"
                            placeholder="Nhập lại mật khẩu"
                            required
                    />
                </div>
                <button type="submit" class="btn btn-signup w-100 mb-3">
                    Đăng ký
                </button>
            </form>
            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
            &redirect_uri=http://localhost:8080/CoRiPhoto/login&response_type=code
&client_id=347849780193-j9q68d1s2iu8g598kc2tsgqcdd2r4ved.apps.googleusercontent.com" class="btn btn-google">
                <i class="fa-brands fa-google"></i>Tiếp tục với Google
            </a>

            <div class="text-center mt-4">
                <span>Bạn đã có tài khoản?
                  <a href="login" class="text-decoration-none">Đăng nhập</a>
                </span>
            </div>
        </div>
    </div>
</div>
<jsp:include page="include/scripts.jsp"/>
</body>
</html>


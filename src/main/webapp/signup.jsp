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
        <img src="./assets/images/signup.png" alt=""/>
    </div>
    <div class="frame-signup">
        <h1 class="fw-bold mb-5" style="color: #57cc99; margin-top: 250px !important;">CoriPhoto</h1>
        <div class="signup-container mb-2">
            <h2 class="text-center fw-semibold mb-4">Đăng ký</h2>
            <form action="signup" method="post">
                <p class="text-danger">${ error }</p>
                <div class="mb-3">
                    <label for="name" class="form-label">Họ Tên:</label>
                    <input
                            name="name"
                            type="text"
                            class="form-control"
                            id="name"
                            placeholder="Nhập họ tên"
                            required
                    />
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input
                            name="email"
                            type="email"
                            class="form-control"
                            id="email"
                            placeholder="Nhập email"
                            required
                    />
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Username: </label>
                    <input
                            name="username"
                            type="text"
                            class="form-control"
                            id="username"
                            placeholder="Nhập username"
                            required
                    />
                </div>
                <div class="mb-3 position-relative">
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
                    <i class="fa fa-eye position-absolute togglePassword"
                       style="right: 10px; top: 70%; transform: translateY(-50%); cursor: pointer; color: darkgray;"></i>
                </div>
                <div class="mb-3 position-relative">
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
                    <i class="fa fa-eye position-absolute togglePassword"
                       style="right: 10px; top: 70%; transform: translateY(-50%); cursor: pointer; color: darkgray;"></i>
                </div>
                <button type="submit" class="btn btn-signup w-100 mb-3">
                    Đăng ký
                </button>
            </form>
            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
            &redirect_uri=http://localhost:8080/login&response_type=code
&client_id=347849780193-j9q68d1s2iu8g598kc2tsgqcdd2r4ved.apps.googleusercontent.com" class="btn btn-google">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0 0 48 48">
                    <path fill="#FFC107" d="M43.611,20.083H42V20H24v8h11.303c-1.649,4.657-6.08,8-11.303,8c-6.627,0-12-5.373-12-12c0-6.627,5.373-12,12-12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C12.955,4,4,12.955,4,24c0,11.045,8.955,20,20,20c11.045,0,20-8.955,20-20C44,22.659,43.862,21.35,43.611,20.083z"></path><path fill="#FF3D00" d="M6.306,14.691l6.571,4.819C14.655,15.108,18.961,12,24,12c3.059,0,5.842,1.154,7.961,3.039l5.657-5.657C34.046,6.053,29.268,4,24,4C16.318,4,9.656,8.337,6.306,14.691z"></path><path fill="#4CAF50" d="M24,44c5.166,0,9.86-1.977,13.409-5.192l-6.19-5.238C29.211,35.091,26.715,36,24,36c-5.202,0-9.619-3.317-11.283-7.946l-6.522,5.025C9.505,39.556,16.227,44,24,44z"></path><path fill="#1976D2" d="M43.611,20.083H42V20H24v8h11.303c-0.792,2.237-2.231,4.166-4.087,5.571c0.001-0.001,0.002-0.001,0.003-0.002l6.19,5.238C36.971,39.205,44,34,44,24C44,22.659,43.862,21.35,43.611,20.083z"></path>
                </svg>
                Tiếp tục với Google
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

<script>
    document.querySelectorAll('.togglePassword').forEach(function (toggleIcon) {
        toggleIcon.addEventListener('click', function () {
            const passwordInput = this.previousElementSibling;

            passwordInput.type = passwordInput.type === 'password' ? 'text' : 'password';

            this.classList.toggle('fa-eye');
            this.classList.toggle('fa-eye-slash');
        });
    });
</script>

</body>
</html>


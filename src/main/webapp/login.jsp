<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.time.LocalDateTime" %>
<html lang="en">
<head>
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css"/>
    <link rel="stylesheet" href="./assets/css/login.css"/>
</head>

<body>
<div class="content main-login">
    <div class="image-about">
        <img src="./assets/images/login.png" alt="login"/>
    </div>
    <div class="frame-login">
        <h1 class="fw-bold mb-5" style="color: #57cc99;">CoriPhoto</h1>
        <%
            String signupMessage = (String) session.getAttribute("signupMessage");
            if (signupMessage != null) {
        %>
        <div class="alert alert-success" role="alert">
            <%= signupMessage %>
        </div>
        <%
                session.removeAttribute("signupMessage");
            }
        %>
        <div class="login-container">
            <h2 class="text-center fw-semibold mb-4">Đăng nhập</h2>
            <form action="login" method="post" class="mb-0" id="login-form">
                <div class="mb-3">
                    <label for="email" class="form-label">Username hoặc email:</label>
                    <input name="email" type="text" class="form-control" id="email"
                           placeholder="Nhập username hoặc email"
                           required value="${email != null ? email : ''}" autocomplete="off"/>
                </div>
                <p class="text-danger">${errorEmail}</p>
                <div class="mb-3 position-relative">
                    <label for="password" class="form-label d-flex justify-content-between">
                        Mật khẩu:<a href="forgot-pass.jsp" class="text-decoration-none">Quên mật khẩu?</a>
                    </label>
                    <input name="password" type="password" class="form-control" id="password"
                           placeholder="Nhập password" required/>
                    <i class="fa fa-eye position-absolute" id="togglePassword"
                       style="right: 10px; top: 70%; transform: translateY(-50%); cursor: pointer; color: darkgray;"></i>
                </div>
                <p class="text-danger">${errorPassword}</p>
                <!-- Hiển thị thông báo khóa, thông báo thành công và nút gửi lại token -->
                <c:if test="${not empty errorLock}">
                    <p class="text-danger">${errorLock}</p>
                    <c:if test="${errorLock.contains('khóa tạm thời')}">
                        <%
                            String email = (String) request.getAttribute("email");
                            String timestamp = LocalDateTime.now().toString();
                            String encodedEmail = Base64.getUrlEncoder().encodeToString(email.getBytes());
                            String encodedTimestamp = Base64.getUrlEncoder().encodeToString(timestamp.getBytes());
                            String resendUrl = "resend-unlock-token?email=" + encodedEmail + "&ts=" + encodedTimestamp;
                        %>
                        <a href="<%= resendUrl %>" class="btn btn-sm btn-outline-primary mt-2" style="color: #007bff; border-color: #007bff;">
                            Gửi lại link mở khóa qua email
                        </a>
                    </c:if>
                </c:if>
                <c:if test="${not empty message}">
                    <p class="text-success">${message}</p>
                </c:if>
                <%-- Xác thực captcha --%>
                <div class="g-recaptcha" data-sitekey="6LcalvMqAAAAAIPMHNMM3bTb4GNDzWfWGPb_0jbw"></div>
                <div id="error-captcha" style="color: red"></div>
                <%-- End captcha --%>
                <button type="button" onclick="checkcaptcha('login')" class="btn btn-login w-100 mb-3">
                    Đăng nhập
                </button>
            </form>

            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid
            &redirect_uri=http://localhost:8080/login&response_type=code
&client_id=347849780193-j9q68d1s2iu8g598kc2tsgqcdd2r4ved.apps.googleusercontent.com"
               class="btn btn-google">
                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="25" height="25" viewBox="0 0 48 48">
                    <!-- SVG paths giữ nguyên -->
                </svg>
                Đăng nhập bằng Google
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

<script>
    document.getElementById('togglePassword').addEventListener('click', function () {
        const passwordInput = document.getElementById('password');
        const type = passwordInput.type === 'password' ? 'text' : 'password';
        passwordInput.type = type;
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
    });
</script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script src="assets/js/verify-captcha.js"></script>
</body>
</html>
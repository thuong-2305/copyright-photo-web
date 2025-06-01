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
                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" viewBox="0 0 48 48">
                    <path fill="#4285F4" d="M24 9.5c3.8 0 6.4 1.6 7.9 3l5.9-5.9C34.2 3.1 29.7 1 24 1 14.3 1 6.6 7.6 4.2 16.7l7.6 5.9C13.2 15.7 18.1 9.5 24 9.5z"/>
                    <path fill="#34A853" d="M24 38.5c-5.7 0-10.6-4.1-11.8-9.7l-7.6 5.9C8.8 41.2 16 47 24 47c5.7 0 10.2-2.1 13.8-5.6l-7.6-5.9c-1.9 1.2-4.2 2 0 0z"/>
                    <path fill="#FBBC05" d="M46.2 24.7c0-1.6-.1-3.2-.4-4.7H24v9.4h12.7c-.5 2.5-2 4.7-4.2 6.2l7.6 5.9c4.5-4.1 6.1-10.2 6.1-16.8z"/>
                    <path fill="#EA4335" d="M12.2 28.3c-.6-1.8-.9-3.7-.9-5.8s.3-4 .9-5.8l-7.6-5.9c-1.8 3.6-2.8 7.6-2.8 11.7 0 4.1 1 8.1 2.8 11.7l7.6-5.9z"/>
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
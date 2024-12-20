<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/20/2024
  Time: 12:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Form đăng nhập</title>
    <link rel="stylesheet" href="../../assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css" />
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/login.css" />
</head>

<body>
<div class="content">
    <div class="image-about">
        <img src="../../assets/images/Animals/7.jpg" alt="" />
    </div>
    <div class="frame-login">
        <div class="login-container">
            <h2 class="text-center mb-4">Đăng nhập</h2>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input name="email" type="email" class="form-control" id="email" placeholder="Nhập email của bạn" required />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label d-flex justify-content-between">
                        Mật khẩu:<a href="forgot-pass.jsp" class="text-decoration-none">Quên mật khẩu?</a>
                    </label>
                    <input name="password" type="password" class="form-control" id="password" placeholder="Nhập mật khẩu của bạn" required />
                </div>
                <button type="submit" class="btn btn-login w-100 mb-3">
                    Đăng nhập
                </button>
            </form>
            <button class="btn btn-google">
                <i class="fa-brands fa-google"></i>Đăng nhập bằng Google
            </button>

            <div class="text-center mt-4">
          <span>Bạn chưa có tài khoản?
            <a href="signup.jsp" class="text-decoration-none">Đăng ký</a></span>
            </div>
        </div>
    </div>
</div>

<script src="../assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>

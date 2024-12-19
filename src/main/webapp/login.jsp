<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Form đăng nhập</title>
  <link rel="stylesheet" href="assets/libraries/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css" />
  <link rel="stylesheet" href="assets/css/login.css" />
</head>

<body>
  <div class="content">
    <div class="image-about">
      <img src="assets/images/Animal/7.jpg" alt="" />
    </div>
    <div class="frame-login">
      <div class="login-container">
        <h2 class="text-center mb-4">Đăng nhập</h2>
        <form action="Login" method="post">
          <div class="mb-3">
            <label for="username" class="form-label">Tên đăng nhập:</label>
            <input name="username" type="text" class="form-control" id="username" placeholder="Nhập tên đăng nhập" required />
          </div>
          <div class="mb-3">
            <label for="password" class="form-label d-flex justify-content-between">
              Mật khẩu:<a href="forgot-pass.html" class="text-decoration-none">Quên mật khẩu?</a>
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
            <a href="signup.html" class="text-decoration-none">Đăng ký</a></span>
        </div>
      </div>
    </div>
  </div>

  <script src="assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
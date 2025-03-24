<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Đặt lại mật khẩu</title>
  <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css" />
  <link rel="stylesheet" href="./assets/css/reset-pass.css" />
</head>
<body>
<div class="frame-reset">
  <div class="reset-container">
    <h2 class="text-center mb-3">Đặt lại mật khẩu</h2>
    <p class="text-center">Vui lòng nhập mật khẩu mới của bạn.</p>

    <form id="resetPasswordForm">
      <div class="mb-3">
        <label for="newPassword" class="form-label">Mật khẩu mới:</label>
        <input type="password" class="form-control" id="newPassword" placeholder="Nhập mật khẩu mới" required />
      </div>
      <div class="mb-3">
        <label for="confirmPassword" class="form-label">Xác nhận mật khẩu:</label>
        <input type="password" class="form-control" id="confirmPassword" placeholder="Nhập lại mật khẩu mới" required />
      </div>
      <button type="submit" class="btn btn-send w-100 mb-3">Đặt lại mật khẩu</button>
    </form>
  </div>
</div>

<jsp:include page="include/scripts.jsp"/>

<script type="module" src="./assets/js/reset-password.js"></script>

</body>
</html>

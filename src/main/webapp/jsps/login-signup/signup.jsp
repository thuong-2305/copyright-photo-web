<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12/20/2024
  Time: 12:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Form đăng nhập</title>
    <link
            rel="stylesheet"
            href="../../assets/libraries/bootstrap/css/bootstrap.min.css"
    />
    <link
            rel="stylesheet"
            href="../../assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css"
    />
    <link rel="stylesheet" href="../../assets/css/signup.css" />
</head>

<body>
<div class="content">
    <div class="image-about">
        <img src="../../assets/images/Animals/7.jpg" alt="" />
    </div>
    <div class="frame-signup">
        <div class="signup-container">
            <h2 class="text-center mb-4">Đăng ký</h2>
            <form>
                <div class="mb-3">
                    <label for="email" class="form-label">Email:</label>
                    <input
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
                            type="password"
                            class="form-control"
                            placeholder="Nhập lại mật khẩu"
                            required
                    />
                </div>
                <button type="submit" class="btn btn-signup w-100 mb-3">
                    <a href="../homeuser.html" class="text-decoration-none text-light">Đăng ký</a>

                </button>
            </form>
            <button class="btn btn-google">
                <i class="fa-brands fa-google"></i>Tiếp tục với Google
            </button>

            <div class="text-center mt-4">
            <span
            >Bạn đã có tài khoản?
              <a href="login.jsp" class="text-decoration-none"
              >Đăng nhập</a
              ></span
            >
            </div>
        </div>
    </div>
</div>

<<<<<<< HEAD
<script src="../assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

</html>
=======
<script src="../assets/libraries/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/bootstrap-icons.min.js"></script>
</body>
</html>
>>>>>>> d39fc5d1f19cf37faf9e5664eeec20b28ddd3f21


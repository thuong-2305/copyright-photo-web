<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <title>Hồ sơ</title>
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" href="assets/css/change-password.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        #nav:not(.scrolled) .title-logo {
            color: black;
        }

        #nav:not(.scrolled) .title-item {
            color: black !important;
        }

        #nav:not(.scrolled) .nav-item:hover {
            color: #009970;
        }

        #nav:not(.scrolled) .title-item:hover {
            color: #009970 !important;
        }

        #nav:not(.scrolled) .title-item:hover i {
            color: #009970 !important;
        }

        #nav:not(.scrolled) .nav-item:hover .title-item {
            color: #009970 !important;
        }
    </style>
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<div id="change-password" class="my-5 py-5">
    <div class="container-fluid">
        <div class="change-password-container">
            <div class="row">
                <div class="col-3">
                    <div class="nav" id="account-menu-container">
                        <div class="account-menu-content">
                            <!-- Avatar -->
                            <div class="profile-avatar-container">
                                <div class="profile-avatar-content">
                                    <div class="profile-image dp-ib">
                                        <img src="assets/images/avart-default.png" alt="">
                                    </div>
                                    <div class="font-weight-bold ml-2 dp-ib profile-name">
                                        Zupiter
                                    </div>
                                </div>
                            </div>
                            <!-- Navigation -->
                            <ul class="mt-3 menu-link stl-none">
                                <li class="profile mt-2">
                                    <a href="ShowProfileInformation">Hồ sơ</a>
                                </li>
                                <li class="payment-method mt-2">
                                    <a href="ShowPaymentMethodProfile">Phương thức thanh toán</a>
                                </li>
                                <li class="change-password mt-2">
                                    <a href="ChangePassword">Đổi mật khẩu</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-9 main-content">
                    <div class="change-pw-header pb-4 pt-4">
                        <div class="title-change-pw dp-ib mb-2">
                            Đổi Mật Khẩu
                        </div>
                        <div class="pw-security-description">
                            Để bảo mật tài khoản, vui lòng không chia sẻ mật khẩu cho người khác
                        </div>
                    </div>

                    <form class="ml-4 password-form mt-4" action="ChangePassword" method="POST">
                        <c:if test="${not empty successMessage}">
                            <div class="alert alert-success">
                                    ${successMessage}
                            </div>
                        </c:if>

                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger">
                                    ${errorMessage}
                            </div>
                        </c:if>

                        <div class="form-group row">
                            <label for="oldPassword" class="col-sm-4 col-form-label">Mật khẩu cũ</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="oldPassword" name="oldPassword"
                                       required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="newPassword" class="col-sm-4 col-form-label">Mật khẩu mới</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="newPassword" name="newPassword"
                                       required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="confirmPassword" class="col-sm-4 col-form-label">Xác nhận mật khẩu</label>
                            <div class="col-sm-8">
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                                       required>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-8 offset-sm-4">
                                <button type="submit" class="btn btn-change-pw">Đổi Mật Khẩu</button>
                            </div>
                        </div>
                    </form>


                </div>
            </div>
        </div>


    </div>
</div>

<jsp:include page="include/footer.jsp"/>

<jsp:include page="include/scripts.jsp"/>

<script src="assets/js/editprofile.js"></script>

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>

</body>

</html>
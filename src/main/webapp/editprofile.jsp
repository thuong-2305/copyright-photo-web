<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">

<head>
    <title>Hồ sơ</title>
    <jsp:include page="include/head.jsp"/>
    <link rel="stylesheet" href="assets/css/editprofile.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        #nav {
            position: relative;
        }
        .modal {
            z-index: 9999;
        }
    </style>
</head>

<body>
<jsp:include page="include/navbar.jsp"/>

<div id="account-details">
    <div class="container-fluid">
        <div class="account-details-container">
            <!-- Khi người dùng không điền thông tin -->
            <div class="account-details-content">
                <div class="row">
                    <div class="col-3">
                        <div class="nav" id="account-menu-container">
                            <div class="account-menu-content">
                                <!-- Avatar -->
                                <div class="profile-avatar-container">
                                    <div class="profile-avatar-content">
                                        <div class="profile-image dp-ib">
                                            <img src="assets/images/avart-default.png" alt="avatar">
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
                    <!-- Content -->


                    <div class="col-8 main-content">
                        <c:if test="${not empty success}">
                            <div class="alert alert-success">
                                    ${success}
                            </div>
                        </c:if>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">
                                    ${error}
                            </div>
                        </c:if>
                        <div class="account-details-heading">
                            <h3>Hồ sơ</h3>
                            <h5>Quản lý thông tin hồ sơ để bảo vệ tài khoản</h5>
                        </div>
                        <form action="UpdateProfileName" method="post" class="account-details-body">
                            <div class="row name">
                                <div class="col-6 last-name-content">
                                    <div class="last-name-label">
                                        <label for="">
                                            <span>Tên</span>
                                        </label>
                                    </div>
                                    <div class="last-name-input">
                                        <input class="w-100 form-control" type="text" name="fullname" value="${user.fullName}">
                                    </div>
                                </div>
                            </div>
                            <div class="email">
                                <div class="email-content row align-items-center">
                                    <div class="email-label col-3 text-left pr-2">
                                        <label class="mb-0" for="">Email</label>
                                    </div>
                                    <div class="email-text col-9">
                                        <div class="email-text-from-user d-flex align-items-center text-left">
                                            ${user.email}
                                            <button type="button" id="changeEmailButton"
                                                    class="btn email-change pb-0 pt-0 mb-0 mt-0 ml-2"
                                                    data-toggle="modal" data-target="#otpModal">Thay đổi
                                            </button>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="otpModal" tabindex="-1" role="dialog"
                                     aria-labelledby="otpModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="otpModalLabel">Gửi OTP đến email</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <p>Chúng tôi sẽ gửi OTP đến email của bạn để xác nhận thay đổi.</p>
                                                <button type="button" id="sendOtpButton" class="btn btn-primary" data-dismiss="modal">Gửi OTP</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="newEmailModal" tabindex="-1" role="dialog"
                                     aria-labelledby="newEmailModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="newEmailModalLabel">Nhập email mới</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <label for="newEmail">Email mới:</label>
                                                <input type="email" id="newEmail" class="form-control"
                                                       placeholder="Nhập email mới">
                                                <button type="button" id="submitNewEmail" class="btn btn-primary mt-3">Thay đổi email
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="username">
                                <div class="username-content row align-items-center">
                                    <div class="username-label col-3 text-left pr-2">
                                        <label class="mb-0" for="">Tên đăng nhập</label>
                                    </div>
                                    <div class="username-text col-9">
                                        <div class="username-text-from-user text-left">
                                            ${user.username}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="account-details-footer">
                                <div class="btn-container dp-flex">
                                    <button type="submit" class="btn-save dp-flex" value="change">
                                        <span>Lưu thay đổi</span>
                                    </button>
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="include/footer.jsp"/>

<jsp:include page="include/scripts.jsp"/>

<script src="assets/js/change-email.js"></script>
<script src="assets/js/send-otp.js"></script>

<!-- Optional JavaScript -->
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
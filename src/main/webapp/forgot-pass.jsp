<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Quên mật khẩu</title>
    <link rel="stylesheet" href="./assets/libraries/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./assets/libraries/fontawesome-free-6.6.0-web/css/all.min.css"/>
    <link rel="stylesheet" href="./assets/css/forgot-pass.css"/>
</head>
<body>
<div class="frame-forgot">
    <div class="forgot-container">

        <h2 class="text-center mb-4">Bạn quên mật khẩu?</h2>
        <p class="text-center">
            Nhập địa chỉ email của bạn và chúng tôi sẽ gửi cho bạn hướng dẫn để
            đặt lại mật khẩu.
        </p>

        <form id="forgotPasswordForm">
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" placeholder="Nhập email của bạn" required/>
            </div>
            <button type="submit" class="btn btn-send w-100 mb-3">Gửi email</button>
        </form>
        <a href="login" class="btn btn-back">Quay trở lại đăng nhập</a>


        <div class="modal fade" id="otpModal" tabindex="-1" aria-labelledby="otpModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="otpModalLabel">Nhập mã OTP</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Vui lòng nhập mã OTP đã gửi đến email của bạn.</p>
                        <input type="text" id="otpInput" class="form-control" placeholder="Nhập mã OTP" required/>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <button type="button" class="btn btn-primary" id="verifyOtpBtn">Xác nhận</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal thông báo lỗi -->
        <div class="modal fade" id="otpErrorModal" tabindex="-1" aria-labelledby="otpErrorModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="otpErrorModalLabel">Thông báo</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <p>Bạn đã nhập sai OTP quá 5 lần. Vui lòng thử lại sau 10 phút hoặc yêu cầu mã mới sau thời gian
                            này!</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
<jsp:include page="include/scripts.jsp"/>

<script src="./assets/js/forgot-password.js"></script>
<script src="./assets/js/verify-otp.js"></script>
<script src="./assets/js/reset-password.js"></script>

</body>
</html>

// signup.js
import { isPasswordStrong } from './check-strong-password.js';

$(document).ready(function () {
    let isProcessing = false; // Biến flag để kiểm soát trạng thái xử lý

    $("#check-email-btn").click(function (event) {
        event.preventDefault(); // Ngăn hành vi mặc định

        // Kiểm tra nếu đang xử lý, ngăn click nhiều lần
        if (isProcessing) return;

        let name = $("#name").val().trim();
        let username = $("#username").val().trim();
        let password = $("#password").val().trim();
        let confPassword = $("#confirmPassword").val().trim();
        let email = $("#email").val().trim();

        let errorMessage = "";

        if (name === "" || username === "") {
            errorMessage = "Vui lòng nhập đầy đủ họ tên và username!";
        } else if (password === "") {
            errorMessage = "Vui lòng nhập mật khẩu!";
        } else if (password !== confPassword) {
            errorMessage = "Mật khẩu xác nhận không khớp!";
        } else if (!isPasswordStrong(password)) {
            errorMessage = "Mật khẩu phải có ít nhất 8 ký tự, bao gồm 1 chữ cái in hoa, 1 số và 1 ký tự đặc biệt!";
        }

        if (errorMessage !== "") {
            $("#error-message").text(errorMessage).show();
            return; // Thoát nếu có lỗi
        }

        $("#error-message").hide();

        // Đặt flag và vô hiệu hóa nút
        isProcessing = true;
        $("#check-email-btn").prop("disabled", true);

        $.post("RegisterVerifyEmail", { email: email }, function (response) {
            if (response.valid) {
                $("#otp-modal").modal("show");
            } else {
                $("#error-message").text("Email không hợp lệ hoặc đã được sử dụng!").show();
            }
            // Reset flag và bật lại nút
            isProcessing = false;
            $("#check-email-btn").prop("disabled", false);
        }, "json").fail(function () {
            // Xử lý lỗi nếu yêu cầu thất bại
            $("#error-message").text("Có lỗi xảy ra, vui lòng thử lại!").show();
            // Reset flag và bật lại nút
            isProcessing = false;
            $("#check-email-btn").prop("disabled", false);
        });
    });
});
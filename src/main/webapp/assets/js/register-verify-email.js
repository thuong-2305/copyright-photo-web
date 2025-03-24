// signup.js
import { isPasswordStrong } from './check-strong-password.js';

$(document).ready(function () {
    $("#check-email-btn").click(function (event) {
        event.preventDefault(); // Ngăn hành vi mặc định

        // Kiểm tra xem nút đã bị vô hiệu hóa chưa để tránh click nhiều lần
        if ($(this).prop("disabled")) return;

        $(this).prop("disabled", true); // Vô hiệu hóa nút sau khi click

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
            $(this).prop("disabled", false); // Bật lại nút nếu có lỗi
            return;
        }

        $("#error-message").hide();

        $.post("RegisterVerifyEmail", { email: email }, function (response) {
            if (response.valid) {
                $("#otp-modal").modal("show");
            } else {
                $("#error-message").text("Email không hợp lệ hoặc đã được sử dụng!").show();
            }
            $("#check-email-btn").prop("disabled", false); // Bật lại nút sau khi hoàn tất
        }, "json");
    });
});
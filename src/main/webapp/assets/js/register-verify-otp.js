$(document).ready(function () {
    $("#verify-otp-btn").click(function () {
        let otp = $("#otp-input").val();
        let email = $("#email").val();

        $.post("RegisterVerifyOTP", { email: email, otp: otp }, function (response) {
            if (response.valid) {
                $("#signup-form").attr("action", "signup").submit();
            } else {
                alert(response.message || "OTP không đúng!");

                // Kiểm tra số lần nhập sai
                if (response.attempts >= 5) {
                    // Ẩn modal OTP
                    $("#otp-modal").modal("hide");
                    // Hiển thị modal lỗi
                    $("#otp-error-modal").modal("show");
                }
            }
        }, "json");
    });
});
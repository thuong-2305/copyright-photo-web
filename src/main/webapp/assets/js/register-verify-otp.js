$(document).ready(function () {
    $("#verify-otp-btn").click(function () {
        let otp = $("#otp-input").val();
        let email = $("#email").val();

        $.post("RegisterVerifyOTP", { email: email, otp: otp }, function (response) {
            if (response.valid) {
                $("#signup-form").attr("action", "signup").submit();
            } else {
                alert("OTP không đúng!");
            }
        }, "json");
    });
});

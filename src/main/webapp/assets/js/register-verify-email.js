$(document).ready(function () {
    $("#check-email-btn").click(function () {
        let email = $("#email").val();
        $.post("RegisterVerifyEmail", { email: email }, function (response) {
            if (response.valid) {
                $("#otp-modal").modal("show");
            } else {
                $("#error-message").text("Email không hợp lệ hoặc đã được sử dụng!");
            }
        }, "json");
    });
});

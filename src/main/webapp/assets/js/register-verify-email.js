$(document).ready(function () {
    $("#check-email-btn").click(function () {
        let name = $("#name").val().trim();
        let username = $("#username").val().trim();
        let password = $("#password").val().trim();
        let confPassword = $("#confirmPassword").val().trim();
        let email = $("#email").val().trim();

        let errorMessage = "";

        // Kiểm tra thông tin có bị trống không
        if (name === "" || username === "") {
            errorMessage = "Vui lòng nhập đầy đủ họ tên và username!";
        } else if (password === "") {
            errorMessage = "Vui lòng nhập mật khẩu!";
        } else if (password !== confPassword) {
            errorMessage = "Mật khẩu xác nhận không khớp!";
        }

        // Nếu có lỗi, hiển thị thông báo và không gửi request
        if (errorMessage !== "") {
            $("#error-message").text(errorMessage).show();
            return;
        }

        // Ẩn thông báo lỗi nếu không có lỗi
        $("#error-message").hide();

        // Nếu hợp lệ, gửi request kiểm tra email
        $.post("RegisterVerifyEmail", { email:email }, function (response) {
            if (response.valid) {
                $("#otp-modal").modal("show");
            } else {
                $("#error-message").text("Email không hợp lệ hoặc đã được sử dụng!").show();
            }
        }, "json");
    });
});

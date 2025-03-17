function checkcaptcha(formType){
    const loginForm = document.getElementById('login-form');
    const error = document.getElementById('error-captcha');
    var response = grecaptcha.getResponse();
    if (response) {
        if (formType === 'login'){
            loginForm.submit();
        }else if (formType === 'signup'){
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
        }
    } else {
        error.textContent = "Vui lòng xác thực bạn không phải là robot!";
    }
}
function checkcaptcha(formType) {
    const loginForm = document.getElementById('login-form');
    const error = document.getElementById('error-captcha');
    var response = grecaptcha.getResponse();

    if (response) {
        error.textContent = ""; // Xóa thông báo lỗi nếu có
        if (formType === 'login') {
            loginForm.submit();
        } else if (formType === 'signup') {
            // Gọi hàm xử lý signup từ file khác thay vì định nghĩa sự kiện mới
            handleSignup();
        }
    } else {
        error.textContent = "Vui lòng xác thực bạn không phải là robot!";
    }
}

// Hàm trung gian để gọi từ signup.js
function handleSignup() {
    $("#check-email-btn").trigger("click"); // Kích hoạt sự kiện click đã định nghĩa trong signup.js
}
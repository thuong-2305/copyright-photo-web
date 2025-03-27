document.getElementById("forgotPasswordForm").addEventListener("submit", function (event) {
    event.preventDefault();

    let email = document.getElementById("email").value;

    fetch("ForgotPassword", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({email: email})
    })
        .then(response => response.json())
        .then(data => {
            if (data.exists) {
                alert("Mã OTP đã được gửi đến email của bạn. Vui lòng kiểm tra hộp thư.");
                localStorage.setItem("resetEmail", email);
                var otpModal = new bootstrap.Modal(document.getElementById("otpModal"));
                otpModal.show();
            } else {
                alert(data.message); // Hiển thị thông báo khóa nếu có
            }
        })
        .catch(error => console.error("Lỗi:", error));
});
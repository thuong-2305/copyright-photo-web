document.getElementById("forgotPasswordForm").addEventListener("submit", function (event) {
    event.preventDefault(); // Chặn hành vi submit mặc định

    let email = document.getElementById("email").value;

    // Gửi request kiểm tra email đến servlet
    fetch("ForgotPassword", {
        method: "POST",
        headers: {"Content-Type": "application/json"},
        body: JSON.stringify({email: email})
    })
        .then(response => response.json())
        .then(data => {
            if (data.exists) {
                // Phần này gửi OTP về email
                alert("Mã OTP đã được gửi đến email của bạn. Vui lòng kiểm tra hộp thư.");
                localStorage.setItem("resetEmail", email);
                // Nếu email hợp lệ, mở modal OTP
                var otpModal = new bootstrap.Modal(document.getElementById("otpModal"));
                otpModal.show();
            } else {
                alert("Email không tồn tại trong hệ thống.");
            }
        })
        .catch(error => console.error("Lỗi:", error));
});





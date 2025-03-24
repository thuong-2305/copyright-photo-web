document.getElementById("verifyOtpBtn").addEventListener("click", function () {
    let otp = document.getElementById("otpInput").value;

    fetch("VerifyForgotPassword", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ otp: otp })
    })
        .then(response => response.json())
        .then(data => {
            if (data.status === "success") {
                setTimeout(() => {
                    window.location.href = "reset-password.jsp";
                }, 500);
            } else {
                alert(data.message); // Giữ lại để hiển thị lỗi khác (hết hạn, không đúng, ...)

                // Kiểm tra số lần nhập sai
                if (data.attempts >= 5) {
                    // Ẩn modal OTP
                    bootstrap.Modal.getInstance(document.getElementById("otpModal")).hide();
                    // Hiển thị modal lỗi
                    new bootstrap.Modal(document.getElementById("otpErrorModal")).show();
                }
            }
        })
        .catch(error => console.error("Lỗi:", error));
});
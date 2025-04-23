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
                alert("OTP hợp lệ. Bạn có thể đặt lại mật khẩu.");

                // Chuyển hướng đến trang đặt lại mật khẩu
                setTimeout(() => {
                    window.location.href = "reset-password.jsp";
                }, 500);
            } else {
                alert(data.message);
            }
        })
        .catch(error => console.error("Lỗi:", error));
});

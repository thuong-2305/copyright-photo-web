document.getElementById("sendOtpButton").addEventListener("click", function () {
    fetch("SendOTP", {
        method: "POST",
    })
        .then(response => response.text())
        .then(result => {
            if (result === "success") {
                alert("OTP đã được gửi đến email của bạn!");
                $('#otpModal').modal('hide');
                $('#newEmailModal').modal('show');
            } else {
                alert("Có lỗi xảy ra. Vui lòng thử lại.");
            }
        })
        .catch(error => console.error('Error:', error));
});

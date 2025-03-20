document.getElementById("submitOTP").addEventListener("click", function () {
    let otpInput = document.getElementById("otpCode").value;
    fetch("ConfirmOTP", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "otp=" + encodeURIComponent(otpInput)
    })
        .then(response => response.text())
        .then(result => {
            if (result === "success") {
                $('#confirmOTPModal').modal('hide');
                $('#newEmailModal').modal('show');
            } else {
                alert("Mã OTP không đúng. Vui lòng thử lại.");
            }
        })
        .catch(error => console.error('Error:', error));
});

document.getElementById("submitNewEmail").addEventListener("click", function () {
    const newEmail = document.getElementById("newEmail").value;
    const userOtp = prompt("Vui lòng nhập mã OTP:");

    fetch("ChangeEmail", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `newEmail=${encodeURIComponent(newEmail)}&otp=${encodeURIComponent(userOtp)}`
    })
        .then(response => response.text())
        .then(result => {
            if (result === "success") {
                alert("Email của bạn đã được thay đổi thành công!");
                $('#newEmailModal').modal('hide');
                window.location.href = "ShowProfileInformation";
            } else if (result === "invalidOtp") {
                alert("OTP không chính xác. Vui lòng thử lại.");
            } else {
                alert("Có lỗi xảy ra. Vui lòng thử lại.");
            }
        })
        .catch(error => console.error('Error:', error));
});

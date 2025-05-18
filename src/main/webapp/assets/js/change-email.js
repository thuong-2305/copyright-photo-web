document.getElementById("submitNewEmail").addEventListener("click", function () {
    const newEmail = document.getElementById("newEmail").value.trim();

    fetch("ChangeEmail", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `newEmail=${encodeURIComponent(newEmail)}`
    })
        .then(response => response.text())
        .then(result => {
            switch (result) {
                case "success":
                    alert("Email của bạn đã được thay đổi thành công!");
                    $('#newEmailModal').modal('hide');
                    window.location.href = "ShowProfileInformation";
                    break;
                case "emailExists":
                    alert("Email này đã được sử dụng. Vui lòng nhập email khác!");
                    break;
                case "invalidEmail":
                    alert("Email không hợp lệ. Vui lòng kiểm tra lại!");
                    break;
                default:
                    alert("Có lỗi xảy ra. Vui lòng thử lại.");
                    break;
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("Lỗi kết nối. Vui lòng thử lại sau.");
        });
});

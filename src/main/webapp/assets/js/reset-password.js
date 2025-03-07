document.getElementById("resetPasswordForm").addEventListener("submit", async function (event) {
    event.preventDefault();

    let newPassword = document.getElementById("newPassword").value;
    let confirmPassword = document.getElementById("confirmPassword").value;

    if (newPassword.length < 6) {
        alert("Mật khẩu phải có ít nhất 6 ký tự.");
        return;
    }

    if (newPassword !== confirmPassword) {
        alert("Mật khẩu xác nhận không khớp.");
        return;
    }

    try {
        let response = await fetch("ResetPassword", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ newPassword: newPassword, confirmPassword: confirmPassword }) // Gửi cả 2 giá trị
        });

        let data = await response.json();
        alert(data.message);
        if (data.status === "success") {
            window.location.href = "login"; // Chuyển hướng sau khi đặt lại mật khẩu
        }
    } catch (error) {
        alert("Đã xảy ra lỗi khi kết nối đến máy chủ.");
        console.error("Lỗi:", error);
    }
});

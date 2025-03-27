import { isPasswordStrong } from './check-strong-password.js';

document.getElementById("resetPasswordForm").addEventListener("submit", async function (event) {
    event.preventDefault();

    let newPassword = document.getElementById("newPassword").value;
    let confirmPassword = document.getElementById("confirmPassword").value;

    // Kiểm tra độ mạnh mật khẩu bằng hàm isPasswordStrong
    if (!isPasswordStrong(newPassword)) {
        alert("Mật khẩu phải có ít nhất 8 ký tự, bao gồm 1 chữ cái in hoa, 1 số và 1 ký tự đặc biệt!");
        return;
    }

    // Kiểm tra xác nhận mật khẩu
    if (newPassword !== confirmPassword) {
        alert("Mật khẩu xác nhận không khớp.");
        return;
    }

    try {
        let response = await fetch("ResetPassword", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ newPassword: newPassword, confirmPassword: confirmPassword })
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
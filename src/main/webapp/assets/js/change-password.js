import { isPasswordStrong } from './check-strong-password.js';

document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector(".password-form");

    form.addEventListener("submit", function (event) {
        // Lấy giá trị từ các input
        const oldPassword = document.getElementById("oldPassword").value.trim();
        const newPassword = document.getElementById("newPassword").value.trim();
        const confirmPassword = document.getElementById("confirmPassword").value.trim();

        // Kiểm tra các điều kiện
        if (oldPassword === "") {
            event.preventDefault(); // Ngăn gửi form
            alert("Vui lòng nhập mật khẩu cũ!");
            return;
        }

        if (!isPasswordStrong(newPassword)) {
            event.preventDefault(); // Ngăn gửi form
            alert("Mật khẩu mới phải có ít nhất 8 ký tự, bao gồm 1 chữ cái in hoa, 1 số và 1 ký tự đặc biệt!");
            return;
        }

        if (newPassword !== confirmPassword) {
            event.preventDefault(); // Ngăn gửi form
            alert("Mật khẩu mới và xác nhận mật khẩu không khớp!");
            return;
        }

        // Nếu tất cả kiểm tra đều qua, form sẽ được gửi đến servlet
    });
});
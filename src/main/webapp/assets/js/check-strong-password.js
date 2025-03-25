
function isPasswordStrong(password) {
    // Kiểm tra độ dài tối thiểu 8 ký tự
    if (password.length < 8) return false;

    // Kiểm tra có ít nhất 1 chữ cái in hoa
    if (!/[A-Z]/.test(password)) return false;

    // Kiểm tra có ít nhất 1 số
    if (!/[0-9]/.test(password)) return false;

    // Kiểm tra có ít nhất 1 ký tự đặc biệt
    if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)) return false;

    return true;
}

// Xuất hàm để sử dụng ở nơi khác
export { isPasswordStrong };
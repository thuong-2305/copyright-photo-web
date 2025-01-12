function redirectToCheckout() {
    const urlParams = new URLSearchParams(window.location.search);

    // Lấy pid từ URL (sản phẩm hiện tại)
    const pid = urlParams.get('pid');
    const license = document.querySelector('input[name="condition"]:checked').value;  // Lấy giấy phép


    // Lấy danh sách tất cả các sản phẩm pid mà người dùng đã chọn
    let productIds = [pid]; // Bắt đầu với pid hiện tại (ảnh đơn)

    // Nếu người dùng chọn gói ảnh, thêm các pid vào danh sách
    // if (packageLabel.toLowerCase().includes("gói")) {
    //     // Đây là danh sách các pid của các sản phẩm trong gói ảnh
    //     productIds = [98, 99, 100];  // Ví dụ: Mảng chứa pid của các sản phẩm trong gói (có thể thay đổi)
    // }

    // Chuyển mảng pid thành chuỗi phân cách bằng dấu phẩy
    let productIdsParam = productIds.join(",");

    // Tạo URL gửi thông tin tới servlet
    const redirectToCheckoutURL = `/RedirectToCheckout?productIds=${productIdsParam}&condition=${encodeURIComponent(license)}`;

    // Chuyển hướng tới servlet để xử lý
    window.location.href = redirectToCheckoutURL;
}

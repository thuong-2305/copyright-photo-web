function redirectToCheckout() {
    const urlParams = new URLSearchParams(window.location.search);

    // Lấy pid từ URL (sản phẩm hiện tại)
    const pid = urlParams.get('pid');
    const license = document.querySelector('input[name="condition"]:checked').value;  // Lấy giấy phép


    // Lấy danh sách tất cả các sản phẩm pid mà người dùng đã chọn
    let productIds = [pid]; // Bắt đầu với pid hiện tại (ảnh đơn)

    let productIdsParam = productIds.join(",");

    // Tạo URL gửi thông tin tới servlet
    const redirectToCheckoutURL = `/RedirectToCheckout?productIds=${productIdsParam}&condition=${encodeURIComponent(license)}`;

    // Chuyển hướng tới servlet để xử lý
    window.location.href = redirectToCheckoutURL;
}

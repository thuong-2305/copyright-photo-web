// JavaScript thuần
document.addEventListener("DOMContentLoaded", function() {
    // Lấy phần tử đầu tiên có class 'icon-available-earning-text'
    var infoIcon = document.querySelector('.icon-available-earning-text');
    
    // Kiểm tra xem phần tử có tồn tại hay không
    if (infoIcon) {
        // Kích hoạt tooltip cho phần tử đó
        new bootstrap.Tooltip(infoIcon);
    }
});

function selectCategory(categoryName) {
    // Set giá trị danh mục đã chọn vào input ẩn
    document.getElementById('categoryInput').value = categoryName;
    // Gửi form để cập nhật sản phẩm
    document.getElementById('categoryForm').submit();

    console.log(categoryName);
}
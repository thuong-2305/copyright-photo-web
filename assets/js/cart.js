// Lắng nghe sự kiện click trên checkbox "Chọn Tất Cả"
document.querySelector('.select-all input[type="checkbox"]').addEventListener('change', function() {
    // Lấy tất cả các checkbox trong giỏ hàng
    const allCheckboxes = document.querySelectorAll('#cart-item-list input[type="checkbox"]');
  
    // Kiểm tra xem checkbox "Chọn Tất Cả" có được chọn không
    const isChecked = this.checked;
  
    // Duyệt qua tất cả các checkbox và thay đổi trạng thái (checked) theo trạng thái của checkbox "Chọn Tất Cả"
    allCheckboxes.forEach(function(checkbox) {
      checkbox.checked = isChecked;
    });
  
    // Cập nhật lại số lượng sản phẩm đang chọn
    const selectedCount = isChecked ? allCheckboxes.length : 0;
    document.querySelector('.selected-count .ng-binding').textContent = selectedCount;
  });
  
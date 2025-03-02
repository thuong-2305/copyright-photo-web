document.addEventListener('DOMContentLoaded', function() {
    // Xử lý sự kiện chọn/bỏ chọn ảnh
    const selectButtons = document.querySelectorAll('.select-btn');
    const clearButton = document.querySelector('.clear-btn');
    const removeButtons = document.querySelectorAll('.remove-btn');

    // Xử lý nút chọn
    selectButtons.forEach(button => {
        button.addEventListener('click', function() {
            const card = this.closest('.image-card');

            // Toggle trạng thái được chọn
            this.classList.toggle('selected');
            card.classList.toggle('selected');

            // Cập nhật biểu tượng
            if (this.classList.contains('selected')) {
                this.innerHTML = '<i class="fas fa-check"></i>';
            } else {
                this.innerHTML = '<i class="fas fa-check"></i>';
                // Chỉ thay đổi màu sắc, giữ nguyên biểu tượng
            }
        });
    });

    // Xử lý nút xóa lựa chọn
    clearButton.addEventListener('click', function() {
        selectButtons.forEach(button => {
            button.classList.remove('selected');
            button.innerHTML = '<i class="fas fa-check"></i>';
            button.closest('.image-card').classList.remove('selected');
        });
    });

    // Xử lý nút xóa ảnh
    removeButtons.forEach(button => {
        button.addEventListener('click', function() {
            const card = this.closest('.image-card');
            card.style.animation = 'fadeOut 0.3s';
            setTimeout(() => {
                card.remove();
            }, 300);
        });
    });

    // Xử lý các nút trên thanh công cụ
    const toolButtons = document.querySelectorAll('.tool-btn');
    toolButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Lấy số lượng hình ảnh được chọn
            const selectedImages = document.querySelectorAll('.image-card.selected');

            if (selectedImages.length === 0) {
                alert('Vui lòng chọn ít nhất một hình ảnh!');
                return;
            }

            // Xử lý các hành động khác nhau dựa trên nút được nhấn
            const buttonIcon = this.querySelector('i').className;

            if (buttonIcon.includes('fa-trash')) {
                if (confirm('Bạn có chắc muốn xóa các hình ảnh đã chọn không?')) {
                    selectedImages.forEach(img => {
                        img.style.animation = 'fadeOut 0.3s';
                        setTimeout(() => {
                            img.remove();
                        }, 300);
                    });
                }
            } else if (buttonIcon.includes('fa-shopping-cart')) {
                alert('Đã thêm ' + selectedImages.length + ' hình ảnh vào giỏ hàng!');
            } else {
                alert('Chức năng này đang được phát triển!');
            }
        });
    });

    // Thêm hiệu ứng CSS cho animation
    const style = document.createElement('style');
    style.textContent = `
        @keyframes fadeOut {
            from { opacity: 1; transform: scale(1); }
            to { opacity: 0; transform: scale(0.8); }
        }
    `;
    document.head.appendChild(style);
});
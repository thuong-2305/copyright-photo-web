function toggleMenu(button) {
    const menu = button.nextElementSibling; // Lấy menu ngay sau nút
    const isVisible = menu.style.display === 'block';

    // Ẩn tất cả các menu khác nếu có
    document.querySelectorAll('.dropdown-menu-custom').forEach((dropdown) => {
        dropdown.style.display = 'none';
    });

    // Hiển thị hoặc ẩn menu hiện tại
    menu.style.display = isVisible ? 'none' : 'block';

    // Đóng menu khi nhấn ra ngoài
    document.addEventListener('click', function handleClickOutside(event) {
        if (!button.contains(event.target) && !menu.contains(event.target)) {
            menu.style.display = 'none';
            document.removeEventListener('click', handleClickOutside);
        }
    });
}

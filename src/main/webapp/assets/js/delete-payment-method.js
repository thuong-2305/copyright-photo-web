function confirmDelete(pmid) {
    const modal = document.getElementById('confirmDeleteModal');
    modal.classList.add('show');  // Thêm class 'show' để hiển thị modal
    const proceedButton = document.getElementById('confirmDeleteButton');
    proceedButton.setAttribute('data-pmid', pmid);  // Lưu pmid vào nút xác nhận
}

function closeModal() {
    const modal = document.getElementById('confirmDeleteModal');
    modal.classList.remove('show');  // Loại bỏ class 'show' để ẩn modal
}

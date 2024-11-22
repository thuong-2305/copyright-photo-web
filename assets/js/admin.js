document.querySelector('input[type="text"]').addEventListener('input', function () {
    const searchValue = this.value.toLowerCase();
    const rows = document.querySelectorAll('tbody tr');

    rows.forEach(row => {
        const name = row.cells[0].textContent.toLowerCase();
        if (name.includes(searchValue)) {
            row.style.display = '';
        } else {
            row.style.display = 'none';
        }
    });
});

let editingCategoryIndex = null; // Dùng để theo dõi mục đang chỉnh sửa

// Mở modal để thêm mới danh mục
document.querySelector(".btn.btn-primary").addEventListener("click", () => {
    editingCategoryIndex = null; // Đặt về null để thêm mới
    document.getElementById("categoryForm").reset(); // Reset form
    document.getElementById("categoryModalLabel").innerText = "Thêm danh mục mới";
    new bootstrap.Modal(document.getElementById("categoryModal")).show();
});

// // Mở modal để sửa danh mục
// document.querySelector("tbody").addEventListener("click", (event) => {
//     if (event.target.classList.contains("btn-primary")) {
//         console.log("hello")
//         const row = event.target.closest("tr");
//         editingCategoryIndex = [...row.parentElement.children].indexOf(row);

//         // Lấy thông tin từ hàng và điền vào form
//         const category = data[editingCategoryIndex];
//         document.getElementById("categoryName").value = category.name;
//         document.getElementById("categoryProducts").value = parseInt(category.products);
//         document.getElementById("categoryStatus").value = category.status;

//         document.getElementById("categoryModalLabel").innerText = "Chỉnh sửa danh mục";
//         new bootstrap.Modal(document.getElementById("categoryModal")).show();
//     }
// });

// Lưu danh mục (thêm mới hoặc cập nhật)
// document.getElementById("saveCategory").addEventListener("click", () => {
//     const name = document.getElementById("categoryName").value;
//     const featured = document.getElementById("categoryFeatured").value === "true";
//     const products = `${document.getElementById("categoryProducts").value} products`;
//     const status = document.getElementById("categoryStatus").value;

//     if (editingCategoryIndex !== null) {
//         // Cập nhật danh mục hiện có
//         data[editingCategoryIndex] = { name, featured, products, status };
//     } else {
//         // Thêm mới danh mục
//         data.push({ name, featured, products, status });
//     }

//     displayTable(currentPage); // Hiển thị lại bảng
//     bootstrap.Modal.getInstance(document.getElementById("categoryModal")).hide(); // Đóng modal
// });
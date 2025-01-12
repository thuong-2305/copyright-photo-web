
// Xử lý doanh thu theo tháng
const months = [
    "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6",
    "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"
];

let currentMonthIndex = 0; // Khởi tạo tháng hiện tại là Tháng 1 (index 0)
let currentYear = 2025; // Năm mặc định là 2025

// Lấy phần tử DOM
const currentMonthElement = document.getElementById("current-month");
const incomePlaceholder = document.getElementById("monthly-income-placeholder");
const prevMonthButton = document.getElementById("prev-month");
const nextMonthButton = document.getElementById("next-month");
const yearSelector = document.getElementById("year-selector");

// Cập nhật giao diện
function updateMonthUI() {
    currentMonthElement.textContent = months[currentMonthIndex];
    const selectedYear = yearSelector.value; // Lấy năm được chọn
    incomePlaceholder.textContent = "--- VNĐ"; // Placeholder

    // Gọi API từ Servlet
    fetch(`/ShowDashBoard?monthIncome=${currentMonthIndex + 1}&yearIncome=${selectedYear}`, {
        method: 'GET',
        headers: {
            'X-Requested-With': 'XMLHttpRequest', // Đảm bảo yêu cầu là AJAX
        },
    })
        .then(response => response.json())
        .then(data => {
            // Cập nhật giao diện với dữ liệu JSON trả về từ Servlet
            incomePlaceholder.textContent = `${data.totalIncomeByMonthYear.toLocaleString()} VNĐ`;
        })
        .catch(error => {
            console.error('Có lỗi xảy ra:', error);
        });
}

// Xử lý khi nhấn "Tháng trước"
prevMonthButton.addEventListener("click", () => {
    if (currentMonthIndex === 0) {
        if (currentYear > 2022) { // Nếu là tháng 1 và năm không phải 2022 thì giảm năm
            currentYear--;
            currentMonthIndex = 11; // Quay lại Tháng 12 của năm trước
        }
    } else {
        currentMonthIndex--;
    }
    updateMonthUI();
});

// Xử lý khi nhấn "Tháng sau"
nextMonthButton.addEventListener("click", () => {
    if (currentMonthIndex === 11) {
        if (currentYear < 2025) { // Nếu là tháng 12 và năm không phải 2025 thì tăng năm
            currentYear++;
            currentMonthIndex = 0; // Quay lại Tháng 1 của năm sau
        }
    } else {
        currentMonthIndex++;
    }
    updateMonthUI();
});

// Xử lý khi thay đổi năm
yearSelector.addEventListener("change", () => {
    currentYear = parseInt(yearSelector.value, 10); // Lấy năm mới từ dropdown
    updateMonthUI();
});

// Khởi tạo giao diện
yearSelector.value = "2025"; // Đặt mặc định là năm 2025
updateMonthUI();





// Xử lý biểu đồ
// Data for the chart
const labels = [
    "1", "2", "3", "4", "5", "6",
    "7", "8", "9", "10", "11", "12"
];
const data = {
    labels: labels,
    datasets: [
        {
            label: "Người bán",
            data: [300, 350, 400, 380, 420, 450, 480, 500, 520, 540, 560, 580],
            borderColor: "rgba(54, 162, 235, 1)",
            backgroundColor: "rgba(54, 162, 235, 0.2)",
            fill: true,
            tension: 0.4, // Smooth curve
        },
        {
            label: "Khách hàng",
            data: [450, 550, 650, 580, 620, 700, 750, 800, 820, 850, 900, 950],
            borderColor: "rgba(75, 192, 192, 1)",
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            fill: true,
            tension: 0.4,
        },
       
    ],
};

// Configuration of the chart
const config = {
    type: "line", // Change this to line
    data: data,
    options: {
        responsive: true,
        plugins: {
            legend: {
                display: true,
                position: "top",
            },
            tooltip: {
                enabled: true,
            },
        },
        scales: {
            x: {
                title: {
                    display: true,
                    text: "Tháng",
                },
            },

        },
    },
};

// Render the chart in the canvas element
const ctx = document.getElementById("userStatisticsChart").getContext("2d");
new Chart(ctx, config);

// Xử lý doanh thu theo tháng 
// Dữ liệu giả
const months = [
    "Tháng 1",
    "Tháng 2",
    "Tháng 3",
    "Tháng 4",
    "Tháng 5",
    "Tháng 6",
    "Tháng 7",
    "Tháng 8",
    "Tháng 9",
    "Tháng 10",
    "Tháng 11",
    "Tháng 12",
];

let currentMonthIndex = 10; // Khởi tạo tháng hiện tại là Tháng 11
let currentYear = 2023; // Năm mặc định

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

    // Giả lập gọi API (thay bằng API thật nếu có backend)
    fetchIncomeForMonthAndYear(currentMonthIndex, selectedYear);
}

// Xử lý khi nhấn "Tháng trước"
prevMonthButton.addEventListener("click", () => {
    currentMonthIndex = (currentMonthIndex - 1 + months.length) % months.length;
    updateMonthUI();
});

// Xử lý khi nhấn "Tháng sau"
nextMonthButton.addEventListener("click", () => {
    currentMonthIndex = (currentMonthIndex + 1) % months.length;
    updateMonthUI();
});

// Xử lý khi thay đổi năm
yearSelector.addEventListener("change", () => {
    updateMonthUI();
});

// Mô phỏng API (để thay thế với backend)
function fetchIncomeForMonthAndYear(monthIndex, year) {
    console.log(`Fetching data for: ${months[monthIndex]}, ${year}`);
    // Dữ liệu giả
    const incomeData = {
        2023: [1200000, 1500000, 1800000, 2000000, 2300000, 2500000, 2700000, 3000000, 3200000, 3400000, 3600000, 3800000],
        2024: [1300000, 1400000, 1900000, 2100000, 2400000, 2600000, 2800000, 3100000, 3300000, 3500000, 3700000, 3900000],
    };

    // Hiển thị dữ liệu nếu có
    const income = incomeData[year]?.[monthIndex];
    if (income) {
        incomePlaceholder.textContent = `${income.toLocaleString()} VNĐ`;
    } else {
        incomePlaceholder.textContent = "Không có dữ liệu";
    }
}

// Khởi tạo giao diện
updateMonthUI();


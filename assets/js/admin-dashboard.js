// Include Chart.js Library in your project
// Example: Add this in your <head> tag
// <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
            label: "Người dùng",
            data: [450, 550, 650, 580, 620, 700, 750, 800, 820, 850, 900, 950],
            borderColor: "rgba(75, 192, 192, 1)",
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            fill: true,
            tension: 0.4,
        },
        {
            label: "Người mới",
            data: [200, 220, 300, 250, 270, 300, 320, 330, 340, 350, 360, 380],
            borderColor: "rgba(255, 99, 132, 1)",
            backgroundColor: "rgba(255, 99, 132, 0.2)",
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

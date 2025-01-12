const labels = [
    "Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6",
    "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"
];

const data = {
    labels: labels,
    datasets: [
        {
            label: "Người bán",
            data: [], // Mảng sẽ được gán cố định từ Servlet
            borderColor: "rgba(54, 162, 235, 1)",
            backgroundColor: "rgba(54, 162, 235, 0.2)",
            fill: true,
            tension: 0.4,
        },
        {
            label: "Khách hàng",
            data: [], // Mảng sẽ được gán cố định từ Servlet
            borderColor: "rgba(75, 192, 192, 1)",
            backgroundColor: "rgba(75, 192, 192, 0.2)",
            fill: true,
            tension: 0.4,
        },
    ],
};

const config = {
    type: "line",
    data: data,
    options: {
        responsive: true,
        plugins: {
            legend: { display: true, position: "top" },
            tooltip: { enabled: true },
        },
        scales: {
            x: {
                title: { display: true, text: "Tháng" },
            },
        },
    },
};

const ctx = document.getElementById("userStatisticsChart").getContext("2d");
const incomeChart = new Chart(ctx, config);

// Load data from the backend (Servlet)
function loadData() {
    fetch(`/ShowDashBoard`, {
        method: 'GET',
        headers: {
            'X-Requested-With': 'XMLHttpRequest', // Ensure AJAX request
        },
    })
        .then(response => response.json())
        .then(dataFromServer => {
            // Assign the data to the chart datasets
            data.datasets[0].data = dataFromServer.sellersData; // Sellers data
            data.datasets[1].data = dataFromServer.customersData; // Customers data
            incomeChart.update(); // Update the chart only when data is loaded
        })
        .catch(error => {
            console.error('Error fetching data:', error);
        });
}

// Initial data load
loadData();

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

// Định nghĩa hàm loadData ra ngoài $(document).ready
function loadData(categoryParentName) {
    $.ajax({
        url: "/ShowStatistic",
        type: "GET",
        data: { categoryParentName: categoryParentName }, // Thêm tham số lọc
        success: function (data) {
            console.log("Received Data: ", data); // Kiểm tra dữ liệu nhận được

            $('#productsTable').DataTable({
                "destroy": true,    // Hủy bảng cũ trước khi khởi tạo lại
                "processing": true, // Hiển thị thông báo đang xử lý dữ liệu
                "data": data,       // Dữ liệu nhận từ server
                "columns": [
                    {
                        "data": "id", // Dữ liệu ID
                        "render": function (data) {
                            return '<span class="product-id">' + data + '</span>';
                        },
                    },
                    {
                        "data": "name", // Dữ liệu tên sản phẩm
                        "render": function (data) {
                            return '<span class="product-name">' + data + '</span>';
                        },
                    },
                    {
                        "data": "url", // Dữ liệu ảnh
                        "render": function (data, type, row) {
                            // 'data' là URL ảnh, 'row' chứa toàn bộ đối tượng JSON (bao gồm id)
                            return (
                                '<a href="product-detail?pid=' +
                                row.id +
                                '">' +
                                '<img src="' +
                                data +
                                '" class="img-thumbnail" width="50" height="50">' +
                                '</a>'
                            ); // Tạo ảnh có liên kết
                        },
                    },
                    {
                        "data": "buycount", // Dữ liệu số lượt mua
                        "render": function (data) {
                            return data; // Hiển thị số lượt mua
                        },
                    },
                    {
                        "data": "averageprice", // Dữ liệu giá trung bình
                        "render": function (data) {
                            return data.toLocaleString("vi-VN") + " VNĐ"; // Định dạng số
                        },
                    },
                    {
                        "data": "totalprice", // Dữ liệu tổng tiền
                        "render": function (data) {
                            return data.toLocaleString("vi-VN") + " VNĐ"; // Định dạng số
                        },
                    },
                ],
            });
        },
        error: function (xhr, error, thrown) {
            console.error("Error loading data: ", error); // Ghi log khi có lỗi
        },
    });
}

$(document).ready(function () {
    // Load dữ liệu mặc định với tất cả sản phẩm
    loadData("all");

    // Khi chọn danh mục, gửi yêu cầu lọc
    $('.category-filter').on('click', function () {
        const category = $(this).data('category'); // Lấy giá trị danh mục từ button
        console.log("Category selected: ", category);
        loadData(category); // Gọi lại loadData với category mới
    });
});

function selectCategory(categoryParentName) {
    $('#categoryInput').val(categoryParentName);
    $('#categoryDropdown').text(categoryParentName === "all" ? "Tất cả" : categoryParentName);

    // Gọi hàm loadData để tải dữ liệu
    loadData(categoryParentName);
}









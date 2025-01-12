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


$(document).ready(function() {
    $('#productsTable').DataTable({
        "processing": true,  // Hiển thị thông báo đang xử lý dữ liệu
        "serverSide": true,  // Kích hoạt chế độ server-side processing
        "ajax": {
            "url": "/ShowStatistic",  // URL của servlet hoặc API trả về dữ liệu
            "type": "GET",  // Sử dụng GET request
            "data": function(d) {
                // Thêm các tham số phân trang từ DataTables
                d.draw = d.draw || 1;  // Đảm bảo tham số 'draw' không bị null
                d.start = d.start || 0;  // Đảm bảo tham số 'start' không bị null
                d.length = d.length || 5;  // Đảm bảo tham số 'length' không bị null
                d.categoryParentName = $('#categoryInput').val();  // Thêm tham số lọc danh mục
            },
            "dataSrc": function(json) {
                console.log("Received JSON: ", json);  // Kiểm tra JSON nhận được
                // Trả về dữ liệu từ trường "data" trong JSON
                return json.data;
            },
            "error": function(xhr, error, thrown) {
                console.error("Error loading data: ", error);  // Ghi log khi có lỗi
            }
        },
        "columns": [
            {
                "data": "url",  // Dữ liệu ảnh
                "render": function(data) {
                    return '<img src="' + data + '" class="img-thumbnail" width="50" height="50">';  // Hiển thị ảnh
                }
            },
            {
                "data": "buycount",  // Dữ liệu số lượt mua
                "render": function(data) {
                    return data;  // Hiển thị số lượt mua
                }
            },
            {
                "data": "averageprice",  // Dữ liệu giá trung bình
                "render": function(data) {
                    return data;  // Hiển thị giá trung bình
                }
            },
            {
                "data": "totalprice",  // Dữ liệu tổng tiền
                "render": function(data) {
                    return data;  // Hiển thị tổng tiền
                }
            }
        ]
    });
});

function selectCategory(category) {
    $('#categoryInput').val(category);  // Cập nhật giá trị category
    $('#productsTable').DataTable().ajax.reload();  // Tải lại bảng với category mới
}







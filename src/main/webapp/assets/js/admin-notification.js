$(document).ready(function () {

    // Hàm hiển thị thông báo
    function showAlert(type, message) {
        const alertClass = type === 'success' ? '.alert-success' : '.alert-danger';
        $(`${alertClass} span`).text(message);
        $(alertClass).removeClass('d-none').fadeIn().delay(1000).fadeOut(function () {
            $(this).addClass('d-none');
        });
    }

    // Hàm xử lý hành động (accept / reject)
    function handleAction(actionType, successMsg, errorMsg) {
        return function () {
            const $row = $(this).closest('tr');
            const productId = $(this).data('id');
            const uid = $row.find('td:eq(2)').text();

            $.ajax({
                url: '/AdminHandleActNotify',
                type: 'GET',
                headers: {
                    'X-Requested-By': 'AJAX'
                },
                data: {
                    act: actionType,
                    id: productId,
                    uid: uid
                },
                success: function () {
                    showAlert('success', successMsg);
                    $row.fadeOut(100, function () {
                        $(this).remove();
                    });
                },
                error: function () {
                    showAlert('error', errorMsg);
                }
            });
        }
    }

    // Gán sự kiện cho nút Accept và Reject
    $('.btn-accept').on('click', handleAction('accepted', 'Đã chấp nhận sản phẩm!', 'Lỗi khi chấp nhận sản phẩm!'));
    $('.btn-reject').on('click', handleAction('rejected', 'Đã từ chối sản phẩm!', 'Lỗi khi từ chối sản phẩm!'));
});
let productIdToDelete = null;
let productElement = null;

$(document).on("click", ".delete-item", function () {
    productIdToDelete = $(this).data("id");
    const productName = $(this).data("name");
    productElement = $(this).closest(".photo");

    $('#deleteModal .modal-body').html("Bạn có chắc chắn muốn xóa <strong>" + productName + "</strong>?");
    $('#deleteModal').modal('show');
});

$('#confirmDelete').on('click', function () {
    if (productIdToDelete) {
        fetch('/seller-products', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
                'X-Requested-By': 'AJAX'
            },
            body: new URLSearchParams({
                action: 'delete',
                product_id: productIdToDelete
            })
        })
            .then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    $(".alert-success span").text("Xóa thành công!");
                    $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                        $(this).addClass("d-none");
                    });

                    if (productElement) {
                        productElement.fadeOut(function () {
                            $(this).remove();
                        });
                    }
                } else {
                    $(".alert-danger span").text("Xóa thất bại!");
                    $(".alert-danger").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                        $(this).addClass("d-none");
                    });
                }
                $('#deleteModal').modal('hide');
            })
            .catch(error => {
                alert('Đã xảy ra lỗi!');
                console.error('Fetch error:', error);
                $('#deleteModal').modal('hide');
            });
    }
});

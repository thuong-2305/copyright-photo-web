$(document).ready(function () {
    $(".addCart, .addCart2").click(function (event) {
        let productId = $(this).data("product-id");
        let isAddCart2 = $(this).hasClass("addCart2");
        // let selectedCondition = isAddCart2 ? $('input[name="condition"]:checked').val() : 1;
        let selectedCondition = isAddCart2
            ? ($('input[name="condition"]:checked').val() === 'advance' ? 2 : 1)
            : 1;
        event.preventDefault();
        $.ajax({
            url: "addToCart?pid=" + productId,
            method: "POST",
            contentType: "application/json",
            data: JSON.stringify({
                "licenseId": selectedCondition
            }),
            success: function (response) {
                if (response.addSuccess) {
                    $(".alert-success span").text("Thêm thành công!");
                    $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                        $(this).addClass("d-none");
                    });
                    $("#nav .container a.cart span").text(response.cartLen);
                } else {
                    $(".alert-primary span").text("Sản phẩm đã có trong giỏ hàng!");
                    $(".alert-primary").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                        $(this).addClass("d-none");
                    });
                }
            },
            error: function () {
                alert("Có lỗi xảy ra, vui lòng thử lại sau.");
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const favoriteButtons = document.querySelectorAll('.favorite-btn');

    favoriteButtons.forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault();

            const productId = this.getAttribute('data-product-id');
            // Kiểm tra nếu productId bị rỗng
            if (!productId || productId === '') {
                alert("Không thể thêm vào danh sách yêu thích. ID sản phẩm không hợp lệ." + productId);
                return;
            }

            // Gửi yêu cầu AJAX đến Servlet
            fetch('AddFavourite', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `action=add&productId=` + productId
            })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        this.querySelector('i').classList.remove('fa-regular');
                        this.querySelector('i').classList.add('fa-solid');
                        $(".alert-success span").text(data.message);
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                            $(this).addClass("d-none");
                        });
                    } else {
                        $(".alert-success span").text(data.message);
                        $(".alert-success").removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
                            $(this).addClass("d-none");
                        });
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Có lỗi xảy ra khi thêm vào danh sách yêu thích.');
                });
        });
    });
});

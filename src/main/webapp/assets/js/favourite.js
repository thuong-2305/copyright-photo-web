// Hàm xử lý yêu thích
function toggleFavorite(productId) {
    if (confirm("Bạn có chắc muốn xóa sản phẩm này khỏi danh sách yêu thích?")) {
        // Gửi yêu cầu AJAX để xóa sản phẩm
        fetch(`RemoveFavourite?action=remove&productId=`+productId, {
            method: 'POST'
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(data.message);
                    location.reload(); // Tải lại trang sau khi xóa thành công
                } else {
                    alert("Có lỗi xảy ra: " + data.message);
                }
            })
            .catch(error => {
                alert(productId);
                console.error("Error:", error);
                alert("Có lỗi xảy ra khi xóa sản phẩm.");
            });
    }
}

document.addEventListener('DOMContentLoaded', function () {
    // 1. Xử lý sự kiện chọn/bỏ chọn ảnh trên từng ảnh (nút .select-btn)

    const selectButtons = document.querySelectorAll('.select-btn');
    const clearButton = document.querySelector('.clear-btn');
    const removeButtons = document.querySelectorAll('.remove-btn');
    // Chọn/bỏ chọn ảnh
    selectButtons.forEach(button => {
        button.addEventListener('click', function () {
            const card = this.closest('.image-card');
            this.classList.toggle('selected');
            card.classList.toggle('selected');

            // Cập nhật icon nút
            if (this.classList.contains('selected')) {
                this.innerHTML = '<i class="fas fa-check"></i>';
            } else {
                this.innerHTML = '<i class="fas fa-check"></i>';
            }
        });
    });

    // 2. Xử lý nút "Clear selection"
    clearButton.addEventListener('click', function () {
        selectButtons.forEach(button => {
            button.classList.remove('selected');
            button.innerHTML = '<i class="fas fa-check"></i>';
            button.closest('.image-card').classList.remove('selected');
        });
    });

    // 3. Xử lý nút xóa riêng trên mỗi ảnh (dấu "x")
    removeButtons.forEach(button => {
        button.addEventListener('click', function () {
            const card = this.closest('.image-card');
            card.style.animation = 'fadeOut 0.3s';
            setTimeout(() => {
                card.remove();
            }, 300);
        });
    });

    // 4. Xử lý các nút trên thanh công cụ (giỏ hàng, chọn nhiều, xóa, ...)
    // Hàm show ẩn thông báo cho gọn
    function showAlertSuccess(message) {
        $(".alert-success span").text(message);
        $(".alert-success")
            .removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
            $(this).addClass("d-none");
        });
    }
    function showAlertPrimary(message) {
        $(".alert-primary span").text(message);
        $(".alert-primary")
            .removeClass("d-none").fadeIn().delay(1000).fadeOut(function () {
            $(this).addClass("d-none");
        });
    }

    const toolButtons = document.querySelectorAll('.tool-btn');
    toolButtons.forEach(button => {
        button.addEventListener('click', function () {
            const buttonIcon = this.querySelector('i').className;
            const selectedImages = document.querySelectorAll('.image-card.selected');
            const selectedCards = document.querySelectorAll('.image-card.selected');
            // Nếu là nút "Xóa" (fa-trash):
            if (buttonIcon.includes('fa-trash')) {
                if (selectedImages.length === 0) {
                    alert('Vui lòng chọn ít nhất một hình ảnh!');
                    return;
                }
                if (confirm('Bạn có chắc muốn xóa các hình ảnh đã chọn không?')) {
                    // Thu thập danh sách productId (giả sử .image-card có data-product-id)
                    let productIds = [];
                    selectedImages.forEach(img => {
                        // Lấy ID từ data-product-id
                        let productId = img.getAttribute('data-product-id');
                        if (productId) {
                            productIds.push(productId);
                        }
                    });

                    // Gửi AJAX đến Servlet
                    fetch('RemoveFavourite', {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/x-www-form-urlencoded'
                        },
                        body: 'action=bulkRemove&productIds=' + JSON.stringify(productIds)
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                alert(data.message);

                                // Xóa ảnh trong giao diện (fadeOut animation)
                                selectedImages.forEach(img => {
                                    img.style.animation = 'fadeOut 0.3s';
                                    setTimeout(() => {
                                        img.remove();
                                    }, 300);
                                });
                            } else {
                                alert('Có lỗi xảy ra: ' + data.message);
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            alert("Có lỗi xảy ra khi xóa sản phẩm.");
                        });
                }
            }
            // Nếu là nút "Giỏ hàng" (fa-shopping-cart):
            else if (buttonIcon.includes('fa-shopping-cart')) {
                // 1) Nếu chưa chọn ảnh, báo lỗi
                if (selectedCards.length === 0) {
                    alert('Vui lòng chọn ít nhất một hình ảnh!');
                    return;
                }

                // 2) Thêm tất cả ảnh đã chọn vào giỏ
                selectedCards.forEach(card => {
                    const productId = card.getAttribute('data-product-id');
                    if (!productId) return; // Tránh lỗi nếu thiếu ID

                    // Gửi AJAX như nút addCart đơn
                    $.ajax({
                        url: "addToCart?pid=" + productId,
                        method: "POST",
                        contentType: "application/json",
                        data: JSON.stringify({
                            "licenseId": 1 // Hoặc 2 nếu bạn cần logic "advance"
                        }),
                        success: function (response) {
                            if (response.addSuccess) {
                                // Hiển thị thông báo thành công
                                showAlertSuccess("Đã thêm hình " + productId + " vào giỏ!");
                                // Cập nhật số lượng giỏ
                                $("#nav .container a.cart span").text(response.cartLen);
                            } else {
                                // Nếu đã nằm trong giỏ
                                showAlertPrimary("Hình " + productId + " đã có trong giỏ hàng!");
                            }
                        },
                        error: function () {
                            alert("Có lỗi xảy ra, vui lòng thử lại sau.");
                        }
                    });
                });
            }
            // Nếu là nút "Chọn nhiều" (fa-copy):
            else if (buttonIcon.includes('fa-copy')) {
                const allCards = document.querySelectorAll('.image-card');
                allCards.forEach(card => {
                    card.classList.add('selected');
                    const btn = card.querySelector('.select-btn');
                    if (btn) {
                        btn.classList.add('selected');
                        btn.innerHTML = '<i class="fas fa-check"></i>';
                    }
                });
            }
            else {
                alert('Chức năng này đang được phát triển!');
            }
        });
    });

    // 5. Thêm hiệu ứng CSS cho animation fadeOut
    const style = document.createElement('style');
    style.textContent = `
        @keyframes fadeOut {
            from { opacity: 1; transform: scale(1); }
            to { opacity: 0; transform: scale(0.8); }
        }
    `;
    document.head.appendChild(style);
});
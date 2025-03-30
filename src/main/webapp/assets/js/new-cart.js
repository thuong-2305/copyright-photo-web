$(document).ready(function () {
    // Kiểm tra ban đầu để hiển thị/ẩn delivery-info
    if (parseInt($('#hiddenNumChecked').val()) >= 5 && $('#hiddenGift').val()) {
        $('.delivery-info').show();
    }

    // Xử lý click vào toàn bộ cart-item để toggle checkbox
    $('.cart-item').on('click', function (event) {
        if ($(event.target).is('img') || $(event.target).is('.remove-btn') || $(event.target).closest('a').length || $(event.target).is('.license-radio') || $(event.target).closest('.license-label').length) {
            return;
        }
        let checkbox = $(this).find('.selectBuy');
        checkbox.prop('checked', !checkbox.prop('checked')).trigger('change');
    });

    // Xử lý thay đổi giấy phép
    $('.license-radio').on('change', function () {
        const priceDisplay = $(this).closest('.cart-item').find('.price-display');
        const cartId = $(this).closest('.cart-item').find('.selectBuy').data('cart-id');
        const productId = $(this).closest('.cart-item').find('.selectBuy').data('product-id');
        const licenseType = $(this).val();
        const licenseId = licenseType === 'standard' ? 1 : 2;
        const isChecked = $(this).closest('.cart-item').find('.selectBuy').is(':checked');

        $(this).closest('.cart-item').find('.selectBuy').data('license-id', licenseId);

        $.ajax({
            url: 'updateLicense',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                cartId: cartId,
                pid: productId,
                licenseId: licenseId
            }),
            success: function (response) {
                if (response.success) {
                    const newPrice = response.newPrice;
                    priceDisplay.text(numeral(newPrice).format('0,0') + ' đ');

                    $.ajax({
                        url: 'updatePrice',
                        method: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({
                            cartId: cartId,
                            checked: isChecked,
                            pid: productId
                        }),
                        success: function (response) {
                            var formattedTotal = numeral(response.total).format('0,0');
                            var formattedTotalFinal = numeral(response.totalFinal).format('0,0');

                            $('#subtotal').text(formattedTotal + ' đ');
                            if (response.numChecked >= 5 && response.gift) {
                                $('#totalFinal').text(formattedTotalFinal + ' đ');
                                $('#saving').html('<i class="bi bi-tag-fill"></i> ' + numeral(response.total - response.totalFinal).format('-0,0') + ' đ');
                                $('#gift-text').text(response.gift);
                                $('.delivery-info').show();
                            } else {
                                $('#totalFinal').text(formattedTotal + ' đ');
                                $('#saving').html('');
                                $('.delivery-info').hide(); // Ẩn toàn bộ delivery-info
                            }

                            $('#numChecked').text(response.numChecked);
                            $('#hiddenNumChecked').val(response.numChecked);
                            $('#hiddenTotal').val(response.total);
                            $('#hiddenTotalFinal').val(response.totalFinal);
                            $('#hiddenGift').val(response.gift);
                        },
                        error: function () {
                            alert('Có lỗi xảy ra khi cập nhật tổng giá, vui lòng thử lại sau.');
                        }
                    });
                } else {
                    alert('Không thể cập nhật giấy phép, vui lòng thử lại!');
                }
            }.bind(this),
            error: function () {
                alert('Có lỗi xảy ra khi cập nhật giấy phép, vui lòng thử lại sau.');
            }
        });
    });
    // Xử lý thay đổi checkbox
    $('.selectBuy').on('change', function () {
        let isChecked = $(this).is(':checked');
        let cartId = $(this).data('cart-id');
        let pid = $(this).data('product-id');

        $.ajax({
            url: 'updatePrice',
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                cartId: cartId,
                checked: isChecked,
                pid: pid
            }),
            success: function (response) {
                var formattedTotal = numeral(response.total).format('0,0');
                var formattedTotalFinal = numeral(response.totalFinal).format('0,0');

                $('#subtotal').text(formattedTotal + ' đ');
                if (response.numChecked >= 5 && response.gift) {
                    $('#totalFinal').text(formattedTotalFinal + ' đ');
                    $('#saving').html('<i class="bi bi-tag-fill"></i> ' + numeral(response.total - response.totalFinal).format('-0,0') + ' đ');
                    $('#gift-text').text(response.gift);
                    $('.delivery-info').show();
                } else {
                    $('#totalFinal').text(formattedTotal + ' đ');
                    $('#saving').html('');
                    $('.delivery-info').hide(); // Ẩn toàn bộ delivery-info
                }

                $('#numChecked').text(response.numChecked);
                $('#hiddenNumChecked').val(response.numChecked);
                $('#hiddenTotal').val(response.total);
                $('#hiddenTotalFinal').val(response.totalFinal);
                $('#hiddenGift').val(response.gift);
            },
            error: function () {
                alert('Có lỗi xảy ra, vui lòng thử lại sau.');
            }
        });
    });
    // Xử lý xóa sản phẩm
    $('.remove-btn').on('click', function (event) {
        event.stopPropagation();
        let productId = $(this).data('product-id');
        let parentElement = $(this).closest('.cart-item');

        $.ajax({
            url: 'deleteFromCart',
            method: 'POST',
            data: { pid: productId },
            success: function (response) {
                if (response.error) {
                    alert(response.error);
                    return;
                }

                $('.alert-success span').text('Xóa thành công!');
                $('.alert-success').fadeIn().delay(1000).fadeOut(function () {
                    $(this).css('display', 'none');
                });

                var formattedTotal = numeral(response.total).format('0,0');
                $('#subtotal').text(formattedTotal + ' đ');
                $('#totalFinal').text(formattedTotal + ' đ');
                $('#saving').html('');
                if (response.numChecked >= 5 && response.gift) {
                    $('#gift-text').text(response.gift);
                    $('.delivery-info').show();
                } else {
                    $('.delivery-info').hide(); // Ẩn toàn bộ delivery-info
                }

                parentElement.fadeOut(function () {
                    $(this).remove();
                });

                $('#numChecked').text(response.numChecked);
                $('#hiddenNumChecked').val(response.numChecked);
                $('#hiddenTotal').val(response.total);
                $('#hiddenTotalFinal').val(response.totalFinal);
                $('#hiddenGift').val(response.gift);
            },
            error: function (xhr, status, error) {
                console.log('AJAX Error: ', status, error);
                console.log('Response Text: ', xhr.responseText);
                alert('Có lỗi xảy ra, vui lòng thử lại sau.');
            }
        });
    });
    // Xử lý nút thêm vào giỏ từ phần gợi ý
    $('.add-to-cart').on('click', function () {
        const productId = $(this).data('product-id');
        $.ajax({
            url: '/addToCart',
            method: 'POST',
            data: { pid: productId }, // Gửi pid qua query parameter
            contentType: 'application/json',
            data: JSON.stringify({
                licenseId: 1 // Gửi licenseId trong body JSON
            }),
            success: function (response) {
                if (response.addSuccess) {
                    $('.alert-success').show().find('span').text('Sản phẩm đã được thêm vào giỏ hàng!');
                    $('.alert-success').fadeIn().delay(1000).fadeOut(function () {
                        $(this).css('display', 'none');
                    });
                    setTimeout(() => location.reload(), 1500);
                } else {
                    alert('Không thể thêm sản phẩm vào giỏ hàng, vui lòng thử lại!');
                }
            },
            error: function () {
                alert('Có lỗi xảy ra, vui lòng thử lại!');
            }
        });
    });

    // Xử lý checkout
    $('#checkoutButton').on('click', function (event) {
        event.preventDefault();

        // Kiểm tra xem có sản phẩm nào được chọn không
        const selectedProducts = [];
        $('.selectBuy:checked').each(function () {
            selectedProducts.push({
                cartId: $(this).data('cart-id'),
                productId: $(this).data('product-id'),
                licenseId: $(this).data('license-id')
            });
        });

        if (selectedProducts.length === 0) {
            alert('Vui lòng chọn ít nhất một sản phẩm để thanh toán!');
            return;
        }

        const numChecked = $('#hiddenNumChecked').val();
        const total = $('#hiddenTotal').val();
        const totalFinal = $('#hiddenTotalFinal').val();

        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'RedirectCartToCheckout';

        const inputProducts = document.createElement('input');
        inputProducts.type = 'hidden';
        inputProducts.name = 'selectedProducts';
        inputProducts.value = JSON.stringify(selectedProducts);
        form.appendChild(inputProducts);

        const inputNumChecked = document.createElement('input');
        inputNumChecked.type = 'hidden';
        inputNumChecked.name = 'numChecked';
        inputNumChecked.value = numChecked;
        form.appendChild(inputNumChecked);

        const inputTotal = document.createElement('input');
        inputTotal.type = 'hidden';
        inputTotal.name = 'total';
        inputTotal.value = total;
        form.appendChild(inputTotal);

        const inputTotalFinal = document.createElement('input');
        inputTotalFinal.type = 'hidden';
        inputTotalFinal.name = 'totalFinal';
        inputTotalFinal.value = totalFinal;
        form.appendChild(inputTotalFinal);

        document.body.appendChild(form);
        form.submit();
    });
});
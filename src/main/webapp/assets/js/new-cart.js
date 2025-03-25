$(document).ready(function () {
    // Kiểm tra ban đầu để hiển thị/ẩn delivery-info
    if (parseInt($('#hiddenNumChecked').val()) >= 5 && $('#hiddenGift').val()) {
        $('.delivery-info').show();
    }

    // Xử lý click vào toàn bộ cart-item để toggle checkbox
    $('.cart-item').on('click', function (event) {
        if ($(event.target).is('img') || $(event.target).is('.remove-btn') || $(event.target).closest('a').length) {
            return;
        }
        let checkbox = $(this).find('.selectBuy');
        checkbox.prop('checked', !checkbox.prop('checked')).trigger('change');
    });

    // Xử lý xóa sản phẩm
    $(".remove-btn").click(function (event) {
        event.stopPropagation();
        let productId = $(this).data("product-id");
        let parentElement = $(this).closest(".cart-item");

        $.ajax({
            url: "deleteFromCart",
            method: "POST",
            data: { pid: productId },
            success: function (response) {
                if (response.error) {
                    alert(response.error);
                    return;
                }

                $(".alert-success span").text("Xóa thành công!");
                $(".alert-success").fadeIn().delay(1000).fadeOut(function() {
                    $(this).css("display", "none");
                });

                var formattedTotal = numeral(response.total).format('0,0');
                $('#subtotal').text(formattedTotal + ' đ');
                $('#totalFinal').text(formattedTotal + ' đ');
                $('#saving').html('');
                if (response.numChecked >= 5 && $('#hiddenGift').val()) {
                    $('.delivery-info p').text($('#hiddenGift').val());
                    $('.delivery-info').show();
                } else {
                    $('.delivery-info').hide();
                }

                parentElement.fadeOut(function () {
                    $(this).remove();
                });

                $("#numChecked").text(response.numChecked);
                $("#hiddenNumChecked").val(response.numChecked);
                $("#hiddenTotal").val(response.total);
            },
            error: function (xhr, status, error) {
                console.log("AJAX Error: ", status, error);
                console.log("Response Text: ", xhr.responseText);
                alert("Có lỗi xảy ra, vui lòng thử lại sau.");
            }
        });
    });

    // Xử lý thay đổi checkbox
    $(".selectBuy").on("change", function () {
        let isChecked = $(this).is(":checked");
        let cartId = $(this).data("cart-id");
        let pid = $(this).data("product-id");

        $.ajax({
            url: "updatePrice",
            method: "POST",
            contentType: "application/json",
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
                    $('.delivery-info p').text(response.gift);
                    $('.delivery-info').show();
                } else {
                    $('#totalFinal').text(formattedTotal + ' đ');
                    $('#saving').html('');
                    $('.delivery-info').hide();
                }

                $('#numChecked').text(response.numChecked);
                $('#hiddenNumChecked').val(response.numChecked);
                $('#hiddenTotal').val(response.total);
                $('#hiddenTotalFinal').val(response.totalFinal);
                $('#hiddenGift').val(response.gift);
            },
            error: function () {
                alert("Có lỗi xảy ra, vui lòng thử lại sau.");
            }
        });
    });
});

// Xử lý checkout
document.getElementById('checkoutButton').addEventListener('click', function (event) {
    event.preventDefault();
    const selectedProducts = [];
    document.querySelectorAll('.selectBuy:checked').forEach((checkbox) => {
        selectedProducts.push({
            cartId: checkbox.getAttribute('data-cart-id'),
            productId: checkbox.getAttribute('data-product-id'),
            licenseId: checkbox.getAttribute('data-license-id'),
        });
    });

    const numChecked = document.getElementById('hiddenNumChecked').value;
    const total = document.getElementById('hiddenTotal').value;
    const totalFinal = document.getElementById('hiddenTotalFinal').value;

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
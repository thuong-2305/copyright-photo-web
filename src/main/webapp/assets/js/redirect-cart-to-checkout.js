document.getElementById('checkoutButton').addEventListener('click', function (event) {
    event.preventDefault(); // Ngăn chặn hành động mặc định

    // Danh sách các sản phẩm được chọn
    const selectedProducts = [];
    document.querySelectorAll('.selectBuy:checked').forEach((checkbox) => {
        selectedProducts.push({
            cartId: checkbox.getAttribute('data-cart-id'),
            productId: checkbox.getAttribute('data-product-id'),
            licenseId: checkbox.getAttribute('data-license-id'),
        });
    });

    // Lấy thông tin từ các trường hidden
    const numChecked = document.getElementById('hiddenNumChecked').value;
    const total = document.getElementById('hiddenTotal').value;
    const totalFinal = document.getElementById('hiddenTotalFinal').value;

    // Tạo form ẩn
    const form = document.createElement('form');
    form.method = 'POST';
    form.action = 'RedirectCartToCheckout';

    // Thêm các trường dữ liệu vào form
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

    // Thêm form vào DOM và submit
    document.body.appendChild(form);
    form.submit();
});

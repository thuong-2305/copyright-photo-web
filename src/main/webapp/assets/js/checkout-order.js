function submitPaymentForm() {
    const paymentForm = document.getElementById('paymentForm');


    //
    const paymentMethod = document.querySelector('input[name="payment-method"]:checked');
    if (!paymentMethod) {
        alert('Vui lòng chọn phương thức thanh toán!');
        return;
    }
    console.log("paymentMethod" + paymentMethod)


    // Thẻ lưu hay thanh toán mới
    const paymentTypeId = paymentMethod.value;
    console.log("paymentTypeId" + paymentTypeId);


    // Kiểm tra phần thanh toán thẻ đã lưu
    if (paymentTypeId === 'saved-cards') {
        const selectedCard = document.querySelector('input[name="paymentMethod"]:checked');
        console.log("selectedCard" + selectedCard);


        if (!selectedCard) {
            alert('Vui lòng chọn một thẻ đã lưu!');
            return;
        }
        document.getElementById('pmid').value = selectedCard.value;
        console.log("selectedCard value" + selectedCard.value);



    } else if (paymentTypeId === 'new-payment') {
        const newPaymentSection = document.getElementById('new-payment-section');
        const creditCardTab = document.getElementById('credit-card');
        const bankAccountTab = document.getElementById('bank-account');

        let paymentType = '';
        if (!creditCardTab.classList.contains('d-none')) {
            paymentType = creditCardTab.getAttribute('name');
        } else if (!bankAccountTab.classList.contains('d-none')) {
            paymentType = bankAccountTab.getAttribute('name');
        } else {
            alert('Vui lòng chọn phương thức thanh toán!');
            return;
        }


        if (paymentType === 'credit-card') {
            const cardName = document.getElementById('card-name').value.trim();
            const cardNumber = document.getElementById('card-number').value.trim();
            const cardBank = document.getElementById('card-bank').value.trim();
            const cardExpiry = document.getElementById('card-expiry').value.trim();
            const cardCVC = document.getElementById('card-cvc').value.trim();

            if (!cardName || !cardNumber || !cardBank || !cardExpiry || !cardCVC || !cardBank) {
                alert('Vui lòng nhập đầy đủ thông tin thẻ!');
                return;
            }

            addHiddenInput(paymentForm, 'paymentTypeId', 1);
            addHiddenInput(paymentForm, 'cardName', cardName);
            addHiddenInput(paymentForm, 'cardNumber', cardNumber);
            addHiddenInput(paymentForm, 'cardBank', cardBank);
            addHiddenInput(paymentForm, 'cardExpiry', cardExpiry);
            addHiddenInput(paymentForm, 'cardCVC', cardCVC);

        } else if (paymentType === 'bank-account') {
            const bankAccountHolder = document.getElementById('bank-account-holder').value.trim();
            const bankAccountNumber = document.getElementById('bank-account-number').value.trim();
            const bankExpiry = document.getElementById('bank-expiry').value.trim();

            const bankName = document.getElementById('bank-name').value.trim();

            if (!bankAccountHolder || !bankAccountNumber || !bankName || !bankExpiry) {
                alert('Vui lòng nhập đầy đủ thông tin tài khoản ngân hàng!');
                return;
            }

            addHiddenInput(paymentForm, 'paymentTypeId', 2);
            addHiddenInput(paymentForm, 'bankAccountHolder', bankAccountHolder);
            addHiddenInput(paymentForm, 'bankAccountNumber', bankAccountNumber);
            addHiddenInput(paymentForm, 'bankName', bankName);
            addHiddenInput(paymentForm, 'bankExpiry', bankExpiry);
        } else {
            alert('Vui lòng chọn phương thức thanh toán!');
            return;
        }
    } else {
        alert('Vui lòng chọn phương thức thanh toán!');
        return;
    }

    // Hiển thị modal thanh toán
    $('#paymentSuccessModal').modal('show');

    // Submit form sau khi modal hiển thị
    setTimeout(() => {
        paymentForm.submit();
    }, 1000); // Chờ 1 giây
}

// Hàm thêm input ẩn vào form
function addHiddenInput(form, name, value) {
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = name;
    input.value = value;
    input.classList.add('extra-input'); // Đánh dấu để dễ quản lý
    form.appendChild(input);
}

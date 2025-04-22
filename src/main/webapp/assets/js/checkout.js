function showTab(tabId) {
    // Ẩn tất cả các tab nội dung
    document.getElementById('credit-card').classList.add('d-none');
    document.getElementById('bank-account').classList.add('d-none');
    document.getElementById('paypal').classList.add('d-none');

    // Xóa lớp active khỏi tất cả các tab
    document.getElementById('credit-card-tab').classList.remove('active', 'btn-dark', 'text-white');
    document.getElementById('bank-account-tab').classList.remove('active', 'btn-dark', 'text-white');
    document.getElementById('paypal-tab').classList.remove('active', 'btn-dark', 'text-white');

    // Hiển thị tab được chọn và thêm lớp active
    if (tabId === 'credit-card') {
        document.getElementById('credit-card').classList.remove('d-none');
        document.getElementById('credit-card-tab').classList.add('active', 'btn-dark', 'text-white');
    } else if (tabId === 'bank-account') {
        document.getElementById('bank-account').classList.remove('d-none');
        document.getElementById('bank-account-tab').classList.add('active', 'btn-dark', 'text-white');
    } else if (tabId === 'paypal') {
        document.getElementById('paypal').classList.remove('d-none');
        document.getElementById('paypal-tab').classList.add('active', 'btn-dark', 'text-white');
    }
}

// Set default tab
showTab('credit-card');

function togglePaymentMethod(method) {
    const savedCardsSection = document.getElementById('saved-cards-section');
    const newPaymentSection = document.getElementById('new-payment-section');

    if (method === 'saved-cards') {
        savedCardsSection.classList.remove('d-none');
        newPaymentSection.classList.add('d-none');
        savedCardsSection.checked = true;
        newPaymentSection.checked = false;
    } else if (method === 'new-payment') {
        savedCardsSection.classList.add('d-none');
        newPaymentSection.classList.remove('d-none');
        savedCardsSection.checked = false;
        newPaymentSection.checked = true;
    }
}





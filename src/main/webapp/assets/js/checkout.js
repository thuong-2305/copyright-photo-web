function showTab(tabId) {
    // Ẩn tất cả các tab nội dung
    document.getElementById('credit-card').classList.add('d-none');
    document.getElementById('bank-account').classList.add('d-none');
    document.getElementById('vnpay').classList.add('d-none');

    // Xóa lớp active khỏi tất cả các tab
    document.getElementById('credit-card-tab').classList.remove('active', 'btn-dark', 'text-white');
    document.getElementById('bank-account-tab').classList.remove('active', 'btn-dark', 'text-white');
    document.getElementById('vnpay-tab').classList.remove('active', 'btn-dark', 'text-white');

    // Hiển thị tab được chọn và thêm lớp active
    if (tabId === 'credit-card') {
        document.getElementById('credit-card').classList.remove('d-none');
        document.getElementById('credit-card-tab').classList.add('active', 'btn-dark', 'text-white');
    } else if (tabId === 'bank-account') {
        document.getElementById('bank-account').classList.remove('d-none');
        document.getElementById('bank-account-tab').classList.add('active', 'btn-dark', 'text-white');
    } else if (tabId === 'vnpay') {
        document.getElementById('vnpay').classList.remove('d-none');
        document.getElementById('vnpay-tab').classList.add('active', 'btn-dark', 'text-white');
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

// Định dạng số thẻ (Credit Card)
document.getElementById('card-number').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, ''); // Chỉ giữ lại số
    if (value.length > 16) value = value.substring(0, 16); // Giới hạn 16 số
    e.target.value = value.replace(/(\d{4})/g, '$1 ').trim(); // Thêm khoảng cách sau mỗi 4 số
    document.getElementById('card-number-error').classList.toggle('d-none', value.length === 16);
});

// Định dạng CVC (Credit Card)
document.getElementById('card-cvc').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, ''); // Chỉ giữ lại số
    if (value.length > 4) value = value.substring(0, 4); // Giới hạn 3-4 số
    e.target.value = value;
    document.getElementById('card-cvc-error').classList.toggle('d-none', value.length >= 3);
});

// Định dạng số tài khoản ngân hàng (Bank Account)
document.getElementById('bank-account-number').addEventListener('input', function (e) {
    let value = e.target.value.replace(/\D/g, ''); // Chỉ giữ lại số
    if (value.length > 20) value = value.substring(0, 20); // Giới hạn tối đa 20 số
    e.target.value = value;
    document.getElementById('bank-account-number-error').classList.toggle('d-none', value.length >= 8); // Yêu cầu tối thiểu 8 số
});

// Khởi tạo Flatpickr cho ô Ngày hết hạn (Credit Card và Bank Account)
document.addEventListener('DOMContentLoaded', function () {
    // Flatpickr cho Credit Card
    flatpickr("#card-expiry", {
        dateFormat: "Y-m-d", // Định dạng yyyy-mm-dd
        minDate: "today", // Không cho phép chọn ngày trong quá khứ
        maxDate: new Date().setFullYear(new Date().getFullYear() + 10), // Giới hạn tối đa 10 năm từ hiện tại
        defaultDate: null // Không đặt ngày mặc định
    });

    // Flatpickr cho Bank Account
    flatpickr("#bank-expiry", {
        dateFormat: "Y-m-d", // Định dạng yyyy-mm-dd
        minDate: "today", // Không cho phép chọn ngày trong quá khứ
        maxDate: new Date().setFullYear(new Date().getFullYear() + 10), // Giới hạn tối đa 10 năm từ hiện tại
        defaultDate: null // Không đặt ngày mặc định
    });
});

// Kiểm tra ngày hết hạn (Credit Card)
document.getElementById('new-card-form').addEventListener('submit', function (e) {
    let expiry = document.getElementById('card-expiry').value;
    if (!expiry) {
        document.getElementById('card-expiry-error').classList.remove('d-none');
        e.preventDefault();
    }
});

// Kiểm tra ngày hết hạn (Bank Account)
document.getElementById('bank-account-form').addEventListener('submit', function (e) {
    let expiry = document.getElementById('bank-expiry').value;
    let accountNumber = document.getElementById('bank-account-number').value;
    if (!expiry) {
        document.getElementById('bank-expiry-error').classList.remove('d-none');
        e.preventDefault();
    }
    if (accountNumber.length < 8) {
        document.getElementById('bank-account-number-error').classList.remove('d-none');
        e.preventDefault();
    }
});
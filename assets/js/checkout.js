
function showTab(tabId) {
    document.getElementById('credit-card').classList.add('d-none');
    document.getElementById('paypal').classList.add('d-none');
    document.getElementById('credit-card-tab').classList.remove('active', 'btn-dark', 'text-white');
    document.getElementById('paypal-tab').classList.remove('active', 'btn-dark', 'text-white');

    if (tabId === 'credit-card') {
        document.getElementById('credit-card').classList.remove('d-none');
        document.getElementById('credit-card-tab').classList.add('active', 'btn-dark', 'text-white');
    } else {
        document.getElementById('paypal').classList.remove('d-none');
        document.getElementById('paypal-tab').classList.add('active', 'btn-dark', 'text-white');
    }
}

// Set default tab
showTab('credit-card');

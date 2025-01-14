let myPmid = null;

function confirmDelete(pmid) {
    myPmid = pmid;
    const modal = document.getElementById('confirmDeleteModal');
    modal.style.display = 'flex';
}

function closeModal() {
    myPmid = null;
    const modal = document.getElementById('confirmDeleteModal');
    modal.style.display = 'none';
}

function proceedDelete() {
    if (myPmid) {
        window.location.href = `DeletePaymentMethod?pmid=${myPmid}`;
    }
}

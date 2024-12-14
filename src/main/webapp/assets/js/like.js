const selectAllBtn = document.querySelector('.select');
const clearAllBtn = document.querySelector('.clear');

const checkboxes = document.querySelectorAll('.image-container input[type="checkbox"]');

selectAllBtn.addEventListener('click', () => {
    checkboxes.forEach(checkbox => {
        checkbox.checked = true; 
    });
});

clearAllBtn.addEventListener('click', () => {
    checkboxes.forEach(checkbox => {
        checkbox.checked = false; 
    });
});
const dropdownButton = document.getElementById('sortButton');
const option = document.querySelector('.products .tool .options');
const popular = document.querySelector('.popular');
const newitem = document.querySelector('.new');

dropdownButton.addEventListener('click', function (e) {
    option.style.display = 'block';
});

const optionitems = document.querySelectorAll('.option-item');
optionitems.forEach(item => {
    item.addEventListener('click', function () {
        optionitems.forEach(i => i.classList.remove('active')); 
        this.classList.add('active'); 
        document.getElementById('selectedSort').textContent = this.textContent; 
        option.style.display = 'none'; 
    });
});
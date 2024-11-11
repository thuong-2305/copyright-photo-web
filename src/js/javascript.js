document.addEventListener('DOMContentLoaded', () => {
    const categoryLinks = document.querySelectorAll('.title-categories a');
    const containers = document.querySelectorAll('.container');

    categoryLinks.forEach(link => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
  
        categoryLinks.forEach(item => item.classList.remove('active'));
        link.classList.add('active');
  
        containers.forEach(container => container.classList.remove('active'));
  
        const targetClass = link.getAttribute('data-target');
        const targetContainer = document.querySelector(`.container.${targetClass}`);
  
        if (targetContainer) {
          targetContainer.classList.add('active');
        }
      });
    });

    const typeSearch = document.getElementById('type-search');
    const dropdownContent = document.querySelector('.dropdown-content');
    const options = document.querySelectorAll('.dropdown-content a');

    typeSearch.addEventListener('click', function(event) {
        event.preventDefault();
        dropdownContent.style.display = dropdownContent.style.display === 'none' ? 'block' : 'none';
    });

    options.forEach(option => {
        option.addEventListener('click', function(event) {
            event.preventDefault();

            options.forEach(opt => opt.classList.remove('active'));
            option.classList.add('active');

            const selectedIcon = option.getAttribute('data-icon');
            typeSearch.innerHTML = `<i class="fa-solid ${selectedIcon} px-2"></i> <span>${option.textContent}</span><i class="fa-solid fa-caret-down px-2"></i>`;

            dropdownContent.style.display = 'none';
        });
    });

    document.addEventListener('click', function(event) {
        if (!typeSearch.contains(event.target) && !dropdownContent.contains(event.target)) {
            dropdownContent.style.display = 'none';
        }
    });
    
  });
  
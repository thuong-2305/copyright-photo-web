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
  });
  
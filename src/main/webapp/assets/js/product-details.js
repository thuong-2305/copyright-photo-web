// Thêm vào cuối file product-details.js hiện tại

// Mobile responsiveness
document.addEventListener('DOMContentLoaded', function() {
  // Handle dropdown for mobile
  const typeSearch = document.getElementById('type-search');
  const dropdownContent = document.querySelector('.dropdown-content');
  const options = document.querySelectorAll('.dropdown-content a');

  if (typeSearch && dropdownContent) {
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
        const isMobile = window.innerWidth <= 480;

        if (isMobile) {
          typeSearch.innerHTML = `<i class="fa-solid ${selectedIcon}"></i><i class="fa-solid fa-caret-down px-2"></i>`;
        } else {
          typeSearch.innerHTML = `<i class="fa-solid ${selectedIcon} px-2"></i> <span>${option.textContent}</span><i class="fa-solid fa-caret-down px-2"></i>`;
        }

        dropdownContent.style.display = 'none';
      });
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function(event) {
      if (!typeSearch.contains(event.target) && !dropdownContent.contains(event.target)) {
        dropdownContent.style.display = 'none';
      }
    });
  }

  // Handle search input
  const searchInput = document.getElementById('search-input');
  const clearBtn = document.querySelector('.clear-btn');

  if (searchInput && clearBtn) {
    searchInput.addEventListener('input', function() {
      if (searchInput.value) {
        clearBtn.style.display = 'block';
      } else {
        clearBtn.style.display = 'none';
      }
    });

    clearBtn.addEventListener('click', function() {
      searchInput.value = '';
      clearBtn.style.display = 'none';
      searchInput.focus();
    });
  }

  // Modal image handling
  const productImg = document.querySelector('.product-img');
  const modalImage = document.getElementById('modal-image');
  const closeBtn = document.querySelector('.btn-close');

  if (productImg && modalImage) {
    productImg.addEventListener('click', function() {
      modalImage.style.display = 'flex';
      document.body.style.overflow = 'hidden';
    });

    if (closeBtn) {
      closeBtn.addEventListener('click', function() {
        modalImage.style.display = 'none';
        document.body.style.overflow = '';
      });
    }

    modalImage.addEventListener('click', function(e) {
      if (e.target === modalImage) {
        modalImage.style.display = 'none';
        document.body.style.overflow = '';
      }
    });
  }

  // Handle orientation change
  window.addEventListener('orientationchange', function() {
    setTimeout(() => {
      // Update dropdown text visibility
      const dropdownButton = document.getElementById('type-search');
      if (dropdownButton) {
        const spanText = dropdownButton.querySelector('span');
        if (spanText) {
          spanText.style.display = window.innerWidth <= 480 ? 'none' : '';
        }
      }
    }, 300);
  });
});

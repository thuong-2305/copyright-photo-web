// Type search dropdown
const typeSearch = document.getElementById('type-search');
const dropdownContent = document.querySelector('.dropdown-content');
const options = document.querySelectorAll('.dropdown-content a');

typeSearch.addEventListener('click', function (event) {
  event.preventDefault();
  dropdownContent.style.display = dropdownContent.style.display === 'none' ? 'block' : 'none';
});

options.forEach(option => {
  option.addEventListener('click', function (event) {
    event.preventDefault();

    options.forEach(opt => opt.classList.remove('active'));
    option.classList.add('active');

    const selectedIcon = option.getAttribute('data-icon');
    const isMobile = window.innerWidth <= 768;

    if (isMobile) {
      typeSearch.innerHTML = `<i class="fa-solid ${selectedIcon}"></i><i class="fa-solid fa-caret-down px-2"></i>`;
    } else {
      typeSearch.innerHTML = `<i class="fa-solid ${selectedIcon} px-2"></i> <span>${option.textContent}</span><i class="fa-solid fa-caret-down px-2"></i>`;
    }

    dropdownContent.style.display = 'none';
  });
});

// Close dropdown when clicking outside
document.addEventListener('click', function (event) {
  if (!typeSearch.contains(event.target) && !dropdownContent.contains(event.target)) {
    dropdownContent.style.display = 'none';
  }
});

// Mobile touch handling for dropdown
if ('ontouchstart' in window) {
  document.addEventListener('touchstart', function(event) {
    if (!typeSearch.contains(event.target) && !dropdownContent.contains(event.target)) {
      dropdownContent.style.display = 'none';
    }
  });
}

// Handler swiper
let swiper;
function initializeSwiper() {
  swiper = new Swiper('.swiper-container', {
    slidesPerView: 3,
    spaceBetween: 20,
    loop: true,
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });
}

function destroySwiper() {
  if (swiper) {
    swiper.destroy(true, true);
    swiper = null;
  }
}

function checkScreenSize() {
  if (window.innerWidth < 768) {
    if (!swiper) initializeSwiper();
  } else {
    destroySwiper();
  }
}

window.addEventListener('resize', checkScreenSize);
checkScreenSize();

// Input search
const searchInput = document.getElementById('search-input');
const clearBtn = document.querySelector('.clear-btn');

searchInput.addEventListener('input', function () {
  if (searchInput.value) {
    clearBtn.style.display = 'block';
  } else {
    clearBtn.style.display = 'none';
  }
});

clearBtn.addEventListener('click', function () {
  searchInput.value = '';
  clearBtn.style.display = 'none';
  searchInput.focus();
});

// Submit search function
function submitSearch() {
  const searchInput = document.getElementById('search-input');
  const searchValue = searchInput.value.trim();

  if (searchValue) {
    const activeType = document.querySelector('.dropdown-content a.active');
    const searchType = activeType ? activeType.textContent : 'Tất cả ảnh';

    window.location.href = `search?q=${encodeURIComponent(searchValue)}&type=${encodeURIComponent(searchType)}`;
  }
}

// Add enter key support for search
searchInput.addEventListener('keypress', function(e) {
  if (e.key === 'Enter') {
    submitSearch();
  }
});

// Mobile search handling
document.addEventListener('DOMContentLoaded', function() {
  const isMobile = window.innerWidth <= 768;

  if (isMobile) {
    // Handle trending categories scroll
    const trendingContainer = document.querySelector('.halim-trending-container');
    if (trendingContainer) {
      let isDown = false;
      let startX;
      let scrollLeft;

      trendingContainer.addEventListener('touchstart', (e) => {
        isDown = true;
        startX = e.touches[0].pageX - trendingContainer.offsetLeft;
        scrollLeft = trendingContainer.scrollLeft;
      });

      trendingContainer.addEventListener('touchend', () => {
        isDown = false;
      });

      trendingContainer.addEventListener('touchmove', (e) => {
        if (!isDown) return;
        e.preventDefault();
        const x = e.touches[0].pageX - trendingContainer.offsetLeft;
        const walk = (x - startX) * 2;
        trendingContainer.scrollLeft = scrollLeft - walk;
      });
    }

    // Simplify dropdown for mobile
    const dropdownButton = document.getElementById('type-search');
    if (dropdownButton) {
      const spanText = dropdownButton.querySelector('span');
      if (spanText && window.innerWidth <= 480) {
        spanText.style.display = 'none';
      }
    }
  }

  // Handle orientation change
  window.addEventListener('orientationchange', function() {
    setTimeout(() => {
      checkScreenSize();
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

// Lazy loading for images
if ('IntersectionObserver' in window) {
  const imageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.src = img.dataset.src;
        img.classList.remove('lazy');
        imageObserver.unobserve(img);
      }
    });
  });

  const lazyImages = document.querySelectorAll('img.lazy');
  lazyImages.forEach(img => imageObserver.observe(img));
}

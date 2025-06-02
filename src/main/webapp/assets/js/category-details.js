document.addEventListener('DOMContentLoaded', () => {
    const categoryLinks = document.querySelectorAll('.tab');
    const containers = document.querySelectorAll('.content-text');
  
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

// Initialize AOS
AOS.init({
    duration: 500,
    once: true,
    offset: 100
});

// Tab functionality
const tabBtns = document.querySelectorAll('.tab-btn');
const contentPanels = document.querySelectorAll('.content-panel');

tabBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        const target = btn.getAttribute('data-target');

        // Remove active class from all
        tabBtns.forEach(b => b.classList.remove('active'));
        contentPanels.forEach(p => p.classList.remove('active'));

        // Add active class to clicked
        btn.classList.add('active');
        document.getElementById(target).classList.add('active');
    });
});

// Filter functionality
const filterBtns = document.querySelectorAll('.filter-btn');
filterBtns.forEach(btn => {
    btn.addEventListener('click', () => {
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        // Add filter logic here
    });
});

// Load more functionality
const loadMoreBtn = document.querySelector('.btn-load-more');
loadMoreBtn?.addEventListener('click', () => {
    // Add load more logic here
    loadMoreBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Đang tải...';
});

// Search Banner Functionality
document.addEventListener("DOMContentLoaded", function () {
    const categoryBtn = document.getElementById("categoryBtn");
    const categoryDropdown = document.getElementById("categoryDropdown");
    const dropdownItems = document.querySelectorAll(".dropdown-item");
    const searchInput = document.getElementById("searchInput");
    const clearBtn = document.getElementById("clearBtn");
    const searchBtn = document.getElementById("searchBtn");
    const searchTags = document.querySelectorAll(".search-tag");

    // Toggle dropdown
    categoryBtn.addEventListener("click", function () {
        categoryDropdown.classList.toggle("show");
        categoryBtn.classList.toggle("active");
    });

    // Close dropdown when clicking outside
    document.addEventListener("click", function (e) {
        if (
            !categoryBtn.contains(e.target) &&
            !categoryDropdown.contains(e.target)
        ) {
            categoryDropdown.classList.remove("show");
            categoryBtn.classList.remove("active");
        }
    });

    // Handle category selection
    dropdownItems.forEach((item) => {
        item.addEventListener("click", function () {
            // Update active state
            dropdownItems.forEach((i) => i.classList.remove("active"));
            this.classList.add("active");

            // Update button text and icon
            const icon = this.querySelector("i").className;
            const text = this.querySelector("span").textContent;
            categoryBtn.querySelector("i:first-child").className = icon;
            categoryBtn.querySelector(".category-text").textContent = text;

            // Close dropdown
            categoryDropdown.classList.remove("show");
            categoryBtn.classList.remove("active");
        });
    });

    // Show/hide clear button
    searchInput.addEventListener("input", function () {
        if (this.value.length > 0) {
            clearBtn.classList.add("show");
        } else {
            clearBtn.classList.remove("show");
        }
    });

    // Clear search input
    clearBtn.addEventListener("click", function () {
        searchInput.value = "";
        searchInput.focus();
        this.classList.remove("show");
    });

    // Handle search
    searchBtn.addEventListener("click", function () {
        const searchTerm = searchInput.value.trim();
        if (searchTerm) {
            // Add loading state
            this.classList.add("loading");
            this.innerHTML =
                '<i class="fas fa-spinner"></i> <span>Đang tìm...</span>';

            // Simulate search (replace with actual search logic)
            setTimeout(() => {
                // Perform search
                console.log("Searching for:", searchTerm);

                // Reset button
                this.classList.remove("loading");
                this.innerHTML =
                    '<i class="fas fa-search"></i> <span>Tìm kiếm</span>';
            }, 1000);
        }
    });

    // Handle enter key
    searchInput.addEventListener("keypress", function (e) {
        if (e.key === "Enter") {
            searchBtn.click();
        }
    });

    // Handle popular search tags
    searchTags.forEach((tag) => {
        tag.addEventListener("click", function (e) {
            e.preventDefault();
            searchInput.value = this.textContent;
            searchInput.focus();
            clearBtn.classList.add("show");
        });
    });
});
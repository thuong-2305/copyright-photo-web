// Search Results Page Functionality
document.addEventListener('DOMContentLoaded', function() {
    // Initialize elements
    const searchInput = document.getElementById('searchInput');
    const clearBtn = document.getElementById('clearBtn');
    const categoryToggle = document.getElementById('categoryToggle');
    const categoryDropdown = document.getElementById('categoryDropdown');
    const viewBtns = document.querySelectorAll('.view-btn');
    const productsGrid = document.getElementById('productsGrid');
    const quickViewBtns = document.querySelectorAll('.quick-view-btn');
    const favoriteBtns = document.querySelectorAll('.btn-favorite');
    const addCartBtns = document.querySelectorAll('.btn-add-cart');
    const modal = document.getElementById('quickViewModal');
    const modalClose = document.querySelector('.modal-close');

    // Show/hide clear button
    if (searchInput.value.length > 0) {
        clearBtn.classList.add('show');
    }

    searchInput.addEventListener('input', function() {
        if (this.value.length > 0) {
            clearBtn.classList.add('show');
        } else {
            clearBtn.classList.remove('show');
        }
    });

    // Clear search
    clearBtn.addEventListener('click', function() {
        searchInput.value = '';
        searchInput.focus();
        this.classList.remove('show');
    });

    // Category dropdown
    categoryToggle.addEventListener('click', function(e) {
        e.stopPropagation();
        categoryDropdown.classList.toggle('show');
    });

    // Category selection
    document.querySelectorAll('.dropdown-item').forEach(item => {
        item.addEventListener('click', function() {
            document.querySelector('.dropdown-item.active').classList.remove('active');
            this.classList.add('active');

            const icon = this.querySelector('i').className;
            const text = this.querySelector('span').textContent;
            categoryToggle.querySelector('i:first-child').className = icon;
            categoryToggle.querySelector('span').textContent = text;

            categoryDropdown.classList.remove('show');
        });
    });

    // Close dropdown when clicking outside
    document.addEventListener('click', function() {
        categoryDropdown.classList.remove('show');
    });

    // View toggle (Grid/List)
    viewBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            viewBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');

            if (this.dataset.view === 'list') {
                productsGrid.classList.add('list-view');
            } else {
                productsGrid.classList.remove('list-view');
            }
        });
    });

    // Quick view
    quickViewBtns.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            const productId = this.dataset.id;
            // Load product details via AJAX
            loadQuickView(productId);
            modal.style.display = 'block';
        });
    });

    // Favorite toggle
    favoriteBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            this.classList.toggle('active');
            const icon = this.querySelector('i');
            if (this.classList.contains('active')) {
                icon.classList.remove('far');
                icon.classList.add('fas');
            } else {
                icon.classList.remove('fas');
                icon.classList.add('far');
            }
        });
    });

    // Add to cart
    addCartBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const productId = this.dataset.productId;
            // Add to cart logic
            this.innerHTML = '<i class="fas fa-check"></i> <span>Đã thêm</span>';
            this.style.background = '#10b981';

            setTimeout(() => {
                this.innerHTML = '<i class="fas fa-shopping-cart"></i> <span>Thêm vào giỏ</span>';
                this.style.background = '';
            }, 2000);
        });
    });

    // Modal close
    modalClose.addEventListener('click', function() {
        modal.style.display = 'none';
    });

    window.addEventListener('click', function(e) {
        if (e.target === modal) {
            modal.style.display = 'none';
        }
    });

    // Price range sliders
    const minPrice = document.getElementById('minPrice');
    const maxPrice = document.getElementById('maxPrice');
    const minPriceValue = document.getElementById('minPriceValue');
    const maxPriceValue = document.getElementById('maxPriceValue');

    function updatePriceValues() {
        minPriceValue.textContent = formatPrice(minPrice.value);
        maxPriceValue.textContent = formatPrice(maxPrice.value);
    }

    minPrice?.addEventListener('input', updatePriceValues);
    maxPrice?.addEventListener('input', updatePriceValues);

    // Color filter
    document.querySelectorAll('.color-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            this.classList.toggle('active');
        });
    });

    // Apply filters
    document.querySelector('.apply-filters-btn')?.addEventListener('click', function() {
        const searchInput = document.getElementById('searchInput');
        const content = searchInput.value.trim();

        // Build URL with filters
        let url = '/search?content=' + encodeURIComponent(content);

        // Add price filter
        const minPrice = document.getElementById('minPrice').value;
        const maxPrice = document.getElementById('maxPrice').value;
        if (minPrice) url += '&minPrice=' + minPrice;
        if (maxPrice) url += '&maxPrice=' + maxPrice;

        // Add size filters
        const sizeCheckboxes = document.querySelectorAll('input[type="checkbox"]:checked');
        sizeCheckboxes.forEach(cb => {
            if (cb.value === 'small' || cb.value === 'medium' || cb.value === 'large') {
                url += '&size=' + cb.value;
            }
        });

        // Add quality filter
        const qualityRadio = document.querySelector('input[name="quality"]:checked');
        if (qualityRadio) {
            url += '&quality=' + qualityRadio.value;
        }

        // Redirect with filters
        window.location.href = url;
    });

// Price range display update
    document.getElementById('minPrice')?.addEventListener('input', function() {
        document.getElementById('minPriceValue').textContent =
            new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' })
                .format(this.value);
    });

    document.getElementById('maxPrice')?.addEventListener('input', function() {
        document.getElementById('maxPriceValue').textContent =
            new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' })
                .format(this.value);
    });


    // Sort functionality
    document.getElementById('sortSelect')?.addEventListener('change', function() {
        const sortValue = this.value;
        // Sort logic
        console.log('Sorting by:', sortValue);
    });
});

// Helper functions
function formatPrice(price) {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(price);
}

function loadQuickView(productId) {
    // AJAX call to load product details
    // This is a placeholder
    document.querySelector('.modal-body').innerHTML = `
        <div style="padding: 40px; text-align: center;">
            <i class="fas fa-spinner fa-spin" style="font-size: 2rem; color: #3b82f6;"></i>
            <p style="margin-top: 20px;">Đang tải...</p>
        </div>
    `;
}

// Cập nhật function submitSearch()
function submitSearch() {
    const searchInput = document.getElementById('searchInput');
    const searchTerm = searchInput.value.trim();

    // Chuyển hướng với parameter "content"
    window.location.href = '/search?content=' + encodeURIComponent(searchTerm);
}

// Xử lý Enter key
document.getElementById('searchInput')?.addEventListener('keypress', function(e) {
    if (e.key === 'Enter') {
        submitSearch();
    }
});

// Clear button functionality
document.getElementById('clearBtn')?.addEventListener('click', function() {
    document.getElementById('searchInput').value = '';
    document.getElementById('searchInput').focus();
    this.classList.remove('show');
});

// Show/hide clear button
document.getElementById('searchInput')?.addEventListener('input', function() {
    const clearBtn = document.getElementById('clearBtn');
    if (this.value.length > 0) {
        clearBtn.classList.add('show');
    } else {
        clearBtn.classList.remove('show');
    }
});


function resetSearch() {
    document.getElementById('searchInput').value = '';
    window.location.href = '/search';
}

// Initialize AOS (Animate on Scroll) if available
if (typeof AOS !== 'undefined') {
    AOS.init({
        duration: 600,
        once: true,
        offset: 50
    });
}

// Update search function
function submitSearch() {
    const searchInput = document.getElementById('searchInput');
    const categoryBtn = document.getElementById('categoryToggle');
    const selectedCategory = categoryBtn.querySelector('span').textContent;

    const searchTerm = searchInput.value.trim();

    // Build search URL
    let searchUrl = '/search?';
    if (searchTerm) {
        searchUrl += 'q=' + encodeURIComponent(searchTerm);
    }

    // Add category if not "Tất cả ảnh"
    if (selectedCategory !== 'Tất cả ảnh') {
        searchUrl += '&category=' + encodeURIComponent(mapCategoryName(selectedCategory));
    }

    window.location.href = searchUrl;
}

// Map Vietnamese category names to English
function mapCategoryName(vnName) {
    const categoryMap = {
        'Ảnh chụp': 'photo',
        'Vectors': 'vector',
        'AI': 'ai'
    };
    return categoryMap[vnName] || 'all';
}

// Apply filters
document.querySelector('.apply-filters-btn')?.addEventListener('click', function() {
    const currentUrl = new URL(window.location.href);
    const params = new URLSearchParams(currentUrl.search);

    // Get price range
    const minPrice = document.getElementById('minPrice').value;
    const maxPrice = document.getElementById('maxPrice').value;
    params.set('minPrice', minPrice);
    params.set('maxPrice', maxPrice);

    // Get selected sizes
    params.delete('size'); // Clear existing
    document.querySelectorAll('.checkbox-item input[type="checkbox"]:checked').forEach(checkbox => {
        if (checkbox.value === 'small' || checkbox.value === 'medium' || checkbox.value === 'large') {
            params.append('size', checkbox.value);
        }
    });

    // Get selected qualities
    params.delete('quality'); // Clear existing
    document.querySelectorAll('input[name="quality"]:checked').forEach(radio => {
        params.append('quality', radio.value);
    });

    // Redirect with filters
    window.location.href = currentUrl.pathname + '?' + params.toString();
});

// Update sort functionality
document.getElementById('sortSelect')?.addEventListener('change', function() {
    const currentUrl = new URL(window.location.href);
    const params = new URLSearchParams(currentUrl.search);
    params.set('sort', this.value);
    window.location.href = currentUrl.pathname + '?' + params.toString();
});
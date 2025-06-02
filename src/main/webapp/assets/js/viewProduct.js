$(document).ready(function () {
    console.log('Number of .view-item elements:', $('.view-item').length);
    $(document).on('click', '.view-item', function () {
        console.log('View item clicked, productId:', $(this).data('id'));
        const productId = $(this).data('id');
        fetch(`/seller-products?id=${productId}`)
            .then(response => {
                console.log('Response status:', response.status);
                if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
                return response.json();
            })
            .then(product => {
                console.log('Product data:', product);
                if (product && product.id) {
                    $('#productDetail h5.fs-3').text(product.name);
                    $('#productDetail .id-image').html(`<span class="title-info fw-semibold">Mã hình ảnh:</span> #${product.id}`);
                    $('#productDetail .category-image').html(`<span class="title-info fw-semibold">Danh mục:</span> ${product.category}`);
                    const formatPrice = new Intl.NumberFormat("vi-VN", { style: "currency", currency: "VND" }).format(product.price);
                    $('#productDetail .price-image').html(`<span class="title-info fw-semibold">Giá:</span> ${formatPrice}`);
                    $('#productDetail .size-image').html(`<span class="title-info fw-semibold">Độ phân giải:</span> ${product.size}`);
                    $('#productDetail .dimension-image').html(`<span class="title-info fw-semibold">Kích thước ảnh:</span> ${product.dimension}`);
                    $('#productDetail .date-image').html(`<span class="title-info fw-semibold">Ngày thêm:</span> ${product.formatDateUpload}`);
                    let statusHtml = '';
                    if (product.status === 'accepted') {
                        statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: green; background: #d1e7dd">Accepted</span>`;
                    } else if (product.status === 'waiting') {
                        statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: orange; background: #fdffb6">Waiting</span>`;
                    } else {
                        statusHtml = `<span class="px-2 py-1 fw-semibold rounded" style="font-size: 13px; color: red; background: #fee0e3">Rejected</span>`;
                    }
                    $('#productDetail .status-image').html(`<span class="title-info fw-semibold">Trạng thái:</span> ${statusHtml}`);
                    $('#productDetail .description-image').html(`<span class="title-info fw-semibold me-1">Mô tả:</span> ${product.description || 'Không có mô tả'}`);
                    $('#productDetail .show-image img').attr('src', product.url);

                    toggleProductDetail();
                } else {
                    alert('Sản phẩm không tồn tại!');
                }
            })
            .catch(error => {
                console.error('Fetch error:', error);
                alert(`Lỗi khi tải sản phẩm: ${error.message}`);
            });
    });
});

function toggleProductDetail() {
    const productDetail = document.getElementById('productDetail');
    let overlay = document.getElementById('overlay');

    if (!overlay) {
        console.warn('Overlay not found, creating new one');
        overlay = document.createElement('div');
        overlay.id = 'overlay';
        overlay.className = 'overlay';
        document.body.appendChild(overlay);
    }

    if (productDetail && overlay) {
        console.log('Toggling product detail, current d-none:', productDetail.classList.contains('d-none'));
        productDetail.classList.toggle('d-none');
        overlay.classList.toggle('show');
        document.body.classList.toggle('no-scroll');
    } else {
        console.error('Missing elements:', { productDetail: !!productDetail, overlay: !!overlay });
    }
}
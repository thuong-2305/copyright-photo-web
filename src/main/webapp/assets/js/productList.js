let canDelete = false;

document.addEventListener("DOMContentLoaded", () => {
    let deletePermissionUpload = document.querySelector(".deletePermissionUpload");
    console.log(deletePermissionUpload.textContent);
    canDelete = deletePermissionUpload && deletePermissionUpload.textContent.trim() === "True";
    console.log(canDelete);
    fetchList('accepts');
});

function fetchList(type) {
    const dropdownButton = document.getElementById('timeDropdown');
    if (dropdownButton) {
        if(type === "accepts") dropdownButton.textContent = "Hiện bán";
        else if(type === "waits") dropdownButton.textContent = "Đang xác nhận";
        else if(type === "rejects") dropdownButton.textContent = "Đã bị từ chối";
    }

    fetch("getProducts?type=" + type)
        .then(response => {
            if (!response.ok) {
                throw new Error('Lỗi HTTP: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            if (data.error) {
                alert('Lỗi: ' + data.error);
                return;
            }
            updatePhotoList(data);
        })
        .catch(error => {
            console.error('Lỗi khi tải danh sách:', error);
        });
}

function updatePhotoList(data) {
    const photoList = document.getElementById('photoList');
    if (!photoList) return;

    photoList.innerHTML = '';
    if (!data.products || !data.products.length) {
        photoList.innerHTML = '<p>Không có sản phẩm nào.</p>';
        return;
    }

    data.products.forEach(item => {
        if (!item.url || !item.name) return;

        const deleteButtonHtml = canDelete
            ? `<a class="dropdown-item d-flex align-items-center delete-item" href="#" data-id="${item.id}" data-name="${item.name}">
                   <i class="fas fa-trash-alt mr-2"></i> Xóa
               </a>`
            : `<a class="dropdown-item d-flex align-items-center delete-permission" href="#" data-id="${item.id}" data-name="${item.name}">
                   <i class="fas fa-trash-alt mr-2"></i> Xóa
               </a>`;

        const photoHtml =
            `<div class="photo shadow-effect mr-3 mb-1">
                <div class="photo-image position-relative">
                    <img src="${item.url}" alt="">
                    <div class="dropdown">
                        <button class="btn btn-link" type="button" data-toggle="dropdown">
                            <i class="fas fa-ellipsis-h"></i>
                        </button>
                        <div class="dropdown-menu">
                            ${deleteButtonHtml}
                            <a class="dropdown-item d-flex align-items-center view-item" href="#" data-id="${item.id}" data-name="${item.name}">
                                <i class="fas fa-edit mr-2"></i> Xem chi tiết
                            </a>
                        </div>
                    </div>
                </div>
                <div class="photo-text-content d-flex justify-content-between mt-2">
                    <div class="photo-text-title font-weight-bold pl-2">${item.name}</div>
                    <div class="photo-text-privacy pr-2">Công khai</div>
                </div>
            </div>`;
        photoList.innerHTML += photoHtml;
    });
}

document.addEventListener('DOMContentLoaded', function () {
    const fileUpload = document.getElementById('fileUpload');
    const fileUploadAlt = document.getElementById('file-upload');

    function handleImageSelection(input) {
        const previewContainer = document.getElementById('preview-container');
        const dimensionInput = document.getElementById('dimension');
        const fileSizeInput = document.getElementById('file-size');
        const priceInput = document.getElementById('price');

        if (!previewContainer || !dimensionInput || !fileSizeInput || !priceInput) {
            alert('Error: Required form elements are missing.');
            return;
        }

        const files = Array.from(input.files);
        if (!files.length) {
            alert('Vui lòng chọn ít nhất một tệp ảnh.');
            return;
        }

        previewContainer.innerHTML = '';

        files.forEach((file, index) => {
            if (!file.type.startsWith('image/')) {
                alert(`Tệp ${file.name} không phải là ảnh hợp lệ.`);
                return;
            }

            const reader = new FileReader();
            reader.onload = function (e) {
                const img = new Image();
                img.onload = function () {
                    const width = img.width;
                    const height = img.height;
                    const sizeKB = (file.size / 1024).toFixed(0);

                    if (index === 0) {
                        dimensionInput.value = width + "x" + height;
                        fileSizeInput.value = sizeKB + " KB";

                        let price = 200000;
                        if (sizeKB > 1500) price = 400000;
                        else if (sizeKB > 1000) price = 300000;
                        else if (sizeKB < 500) price = 200000;
                        else price = 250000;

                        priceInput.value = price;
                    }

                    const thumb = document.createElement('img');
                    thumb.src = e.target.result;
                    thumb.alt = file.name;
                    thumb.style.maxHeight = '200px';
                    thumb.style.maxWidth = '200px';
                    thumb.style.marginLeft = '5px';
                    thumb.style.border = '1px solid #ccc';
                    thumb.style.borderRadius = '5px';
                    previewContainer.appendChild(thumb);
                };
                img.onerror = function () {
                    alert(`Lỗi: Không thể tải ảnh ${file.name}.`);
                };
                img.src = e.target.result;
            };
            reader.onerror = function () {
                alert(`Lỗi: Không thể đọc tệp ${file.name}.`);
            };
            reader.readAsDataURL(file);
        });
    }

    if (fileUpload) {
        fileUpload.addEventListener('change', function () {
            handleImageSelection(this);
        });
    }
    if (fileUploadAlt) {
        fileUploadAlt.addEventListener('change', function () {
            handleImageSelection(this);
        });
    }
});

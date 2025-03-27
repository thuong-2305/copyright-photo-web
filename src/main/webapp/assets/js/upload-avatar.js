function previewImage(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById("avatarPreview").src = e.target.result; // Hiển thị ảnh ngay lập tức
        };
        reader.readAsDataURL(file);

        // Gửi ảnh lên server để cập nhật avatar
        uploadAvatar(file);
    }
}

function uploadAvatar(file) {
    let formData = new FormData();
    formData.append("avatar", file);

    fetch("UploadAvatar", {
        method: "POST",
        body: formData
    })
        .then(response => response.text())
        .then(imagePath => {
            console.log("Server response:", imagePath);

            if (imagePath.startsWith("uploads/avatars")) {
                let avatarImg = document.getElementById("avatarPreview");
                avatarImg.src = imagePath + "?t=" + new Date().getTime(); // Thêm timestamp tránh cache

                alert("Ảnh đại diện đã cập nhật thành công! 🎉");
            } else {
                alert("Có lỗi xảy ra khi cập nhật ảnh.");
            }
        })
        .catch(error => {
            console.error("Error uploading file:", error);
            alert("Lỗi kết nối đến server.");
        });
}
const modalImage = document.getElementById("modal-image");
const btnEnlarge = document.querySelector(".btn-enlarge");
const btnClose = document.querySelector("#modal-image .btn-close");
const divImg = document.querySelector(".div-img");

function openModal() {
  modalImage.style.display = "flex";
}

function closeModal() {
  modalImage.style.display = "none";
}

//Ấn vào nút phóng to để mở modal
btnEnlarge.addEventListener("click", openModal);

//Ấn vào nút đóng để đóng modal
btnClose.addEventListener("click", closeModal);

//Ấn vào hình ảnh để phóng to
divImg.addEventListener("click", function () {
  openModal();
});

//Ấn ra ngoài modal để đóng modal
modalImage.addEventListener("click", function (e) {
  if (e.target === modalImage) {
    closeModal();
  }
});

// Lấy tất cả các button trong div grid-btn
const buttons = document.querySelectorAll(".grid-btn .btn--packageimg");

// Thêm sự kiện click cho mỗi button
buttons.forEach((button) => {
  button.addEventListener("click", () => {
    // Loại bỏ class 'active' khỏi tất cả các button
    buttons.forEach((btn) => btn.classList.remove("active"));

    // Thêm class 'active' vào button được nhấn
    button.classList.add("active");
  });
});

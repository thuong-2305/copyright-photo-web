const modalImage = document.getElementById("modal-image");
const btnEnlarge = document.querySelector(".btn-enlarge");
const btnClose = document.querySelector("#modal-image .btn-close");
const divImg = document.querySelector(".div-img");

alert(btnClose);
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

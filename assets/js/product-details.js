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
const productPrice = document.querySelector(".product-price p");

// Giá gốc của sản phẩm
var basePrice = 45000;

//---------------------------------------------- Sự kiện thay đổi giá trị của input radio ----------------------------------------------
// Lấy tất cả các input radio
// const conditionInputs = document.querySelectorAll('input[name="condition"]');
const conditionItems = document.querySelectorAll(".condition");

// Hàm reset trạng thái các nút giảm giá
function resetButtons() {
  buttons.forEach((button, index) => {
    if (index === 0) {
      button.classList.add("active");
      return;
    }
    button.classList.remove("active");
  });
}

// Duyệt qua từng thẻ <li>
conditionItems.forEach((item) => {
  item.addEventListener("click", () => {
    // Lấy input và label bên trong <li>
    const input = item.querySelector('input[type="radio"]');
    const label = item.querySelector("label").textContent.trim();

    // Đặt input là checked
    input.checked = true;

    resetButtons(); // Reset trạng thái các nút giảm giá

    // Cập nhật giá trị basePrice dựa trên giấy phép
    if (label === "Giấy phép nâng cao") {
      basePrice = 45000 * 2; // Gấp đôi giá gốc
    } else {
      basePrice = 45000; // Giá gốc ban đầu
    }

    // Cập nhật giá hiển thị trên giao diện
    productPrice.textContent = `${basePrice.toLocaleString("vi-VN")} VND`;
  });
});

//---------------------------------------------- Sự kiện click vào button ----------------------------------------------
// Thêm sự kiện click cho mỗi button
buttons.forEach((button) => {
  button.addEventListener("click", () => {
    // Loại bỏ class 'active' khỏi tất cả các button
    buttons.forEach((btn) => btn.classList.remove("active"));

    // Thêm class 'active' vào button được nhấn
    button.classList.add("active");

    // Lấy discount và label từ thuộc tính data
    const discount = parseFloat(button.getAttribute("data-discount"));
    const label = button.getAttribute("data-label");

    // Tính giá mới
    const discountedPrice = Math.round(basePrice * discount);
    const discountPercentage = Math.round((1 - discount) * 100); // % giảm giá

    // Tạo hoặc cập nhật span giảm giá
    let discountSpan = document.querySelector(".product-price__old");
    if (!discountSpan) {
      // Nếu span chưa tồn tại, tạo mới
      discountSpan = document.createElement("span");
      discountSpan.className = "product-price__old";
      productPrice.appendChild(discountSpan);
    }

    // Cập nhật nội dung của thẻ span
    if (discount !== 1) {
      discountSpan.textContent = `Giảm giá ${discountPercentage}% (${label})`;
      discountSpan.style.display = "inline-block";
      discountSpan.style.fontSize = "14px";
      discountSpan.style.background = "green";
      discountSpan.style.marginLeft = "16px";
      discountSpan.style.color = "#fff";
      discountSpan.style.padding = "0 8px";
    } else {
      discountSpan.style.display = "none"; // Ẩn span nếu không giảm giá
    }

    // Cập nhật giá trong thẻ p
    productPrice.firstChild.textContent = `${discountedPrice.toLocaleString(
      "vi-VN"
    )} VND`;
  });
});

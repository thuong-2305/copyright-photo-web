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

let productPriceElement = document.getElementById('product-price');
let originalPrice = parseFloat(productPriceElement.innerText.replace(' VND', '').replace(',', ''));

// Lắng nghe sự thay đổi của lựa chọn giấy phép
document.querySelectorAll('input[name="condition"]').forEach(input => {
  input.addEventListener('change', function() {
    updatePrice();
  });
});

// Cập nhật giá khi lựa chọn giấy phép thay đổi
function updatePrice() {
  let selectedLicense = document.querySelector('input[name="condition"]:checked').value;

  let newPrice = originalPrice;

  // Kiểm tra giấy phép và điều chỉnh giá
  if (selectedLicense === 'advance') {
    newPrice *= 2; // Nhân đôi giá nếu chọn giấy phép nâng cao
  }

  // Cập nhật giá hiển thị với định dạng số VND
  productPriceElement.innerText = newPrice.toLocaleString('vi-VN') + ' VND';
}





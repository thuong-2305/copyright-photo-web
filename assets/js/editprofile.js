document.querySelector('.btn-save').addEventListener('click', function (event) {
  event.preventDefault(); // Ngăn chặn gửi form nếu không hợp lệ

  // Lấy các trường nhập liệu
  var firstNameInput = document.getElementById('firstname');
  var lastNameInput = document.getElementById('lastname');
  var usernameInput = document.getElementById('username');

  // Lấy giá trị của các trường
  var firstName = firstNameInput.value;
  var lastName = lastNameInput.value;
  var username = usernameInput.value;

  // Tham chiếu đến các thẻ alert
  var alertError = document.getElementById('alert-error');
  var alertSuccess = document.getElementById('alert-success');

  // Kiểm tra nếu tất cả các trường đều rỗng
  if (!firstName && !lastName && !username) {
    // Hiển thị thông báo cảnh báo
    alertError.classList.remove('d-none');
    alertSuccess.classList.add('d-none'); // Ẩn thông báo thành công nếu trước đó đã hiển thị

    // Thêm lớp `is-invalid` vào các trường rỗng
    firstNameInput.classList.add('is-invalid');
    lastNameInput.classList.add('is-invalid');
    usernameInput.classList.add('is-invalid');
    return;
  }

  // Nếu ít nhất một trường đã được điền, hiển thị alert thành công
  alertError.classList.add('d-none');
  alertSuccess.classList.remove('d-none');

  // Xóa các lớp 'is-invalid' trước khi thêm lại
  firstNameInput.classList.remove('is-invalid');
  lastNameInput.classList.remove('is-invalid');
  usernameInput.classList.remove('is-invalid');

  // Thêm lớp 'is-valid' vào các trường đã điền
  if (firstName) firstNameInput.classList.add('is-valid');
  if (lastName) lastNameInput.classList.add('is-valid');
  if (username) usernameInput.classList.add('is-valid');
});
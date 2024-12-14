document.querySelector('.btn-save').addEventListener('click', function (event) {
  event.preventDefault(); 

  var firstNameInput = document.getElementById('firstname');
  var lastNameInput = document.getElementById('lastname');
  var usernameInput = document.getElementById('username');

  var firstName = firstNameInput.value;
  var lastName = lastNameInput.value;
  var username = usernameInput.value;

  var alertError = document.getElementById('alert-error');
  var alertSuccess = document.getElementById('alert-success');

  if (!firstName && !lastName && !username) {
    alertError.classList.remove('d-none');
    alertSuccess.classList.add('d-none'); 

    firstNameInput.classList.add('is-invalid');
    lastNameInput.classList.add('is-invalid');
    usernameInput.classList.add('is-invalid');
    return;
  }

  alertError.classList.add('d-none');
  alertSuccess.classList.remove('d-none');

  firstNameInput.classList.remove('is-invalid');
  lastNameInput.classList.remove('is-invalid');
  usernameInput.classList.remove('is-invalid');

  if (firstName) firstNameInput.classList.add('is-valid');
  if (lastName) lastNameInput.classList.add('is-valid');
  if (username) usernameInput.classList.add('is-valid');
});
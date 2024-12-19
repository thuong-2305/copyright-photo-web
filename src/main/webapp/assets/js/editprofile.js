document.querySelector('.btn-save').addEventListener('click', function (event) {
  event.preventDefault(); 

  var lastNameInput = document.getElementById('lastname');

  var lastName = lastNameInput.value;

  var alertError = document.getElementById('alert-error');
  var alertSuccess = document.getElementById('alert-success');

  if (!lastName) {
    alertError.classList.remove('d-none');
    alertSuccess.classList.add('d-none'); 

    lastNameInput.classList.add('is-invalid');
    return;
  }

  alertError.classList.add('d-none');
  alertSuccess.classList.remove('d-none');

  lastNameInput.classList.remove('is-invalid');

  if (lastName) lastNameInput.classList.add('is-valid');
});
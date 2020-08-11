document.addEventListener('turbolinks:load', function() {
  var password = document.querySelector('#user_password');
  var confirmationPassword = document.querySelector('#user_password_confirmation');

  if (password && confirmationPassword) {
    password.addEventListener('keyup', compare);
    confirmationPassword.addEventListener('keyup', compare);
  }
})

function compare() {
  var password = document.querySelector('#user_password');
  var confirmationPassword  = document.querySelector('#user_password_confirmation');

  if (password.value === "" || confirmationPassword.value === "") {
    hide_icons();
    return;
  }

  if (password.value === confirmationPassword.value ) {
    document.querySelector('.success-icon').classList.remove('hide');
    document.querySelector('.fail-icon').classList.add('hide');

  } else {
    document.querySelector('.success-icon').classList.add('hide');
    document.querySelector('.fail-icon').classList.remove('hide');
  }
}

  function hide_icons() {
    document.querySelector('.fail-icon').classList.add('hide');
    document.querySelector('.success-icon').classList.add('hide');
  }

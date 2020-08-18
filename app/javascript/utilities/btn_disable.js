document.addEventListener('turbolinks:load', function() {
  var checkboxes = document.querySelectorAll('input[type="checkbox"]');

  var button = document.querySelector('input[type="submit"]');

  if (checkboxes && button) {
    checkboxes.forEach((element) => {
      element.addEventListener('click', () => {
        var count = document.querySelectorAll('input:checked').length;
        if (count >= 1) {
          button.classList.remove('disabled');
        }
        else {
          button.classList.add('disabled');
        }
      })
    });
  }
})

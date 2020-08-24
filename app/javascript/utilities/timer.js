document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer')
  if (timer) {
    var timeStop = timer.dataset.timeStop
    var testPassageId = timer.dataset.testPassageId

    var time = setInterval(function() {
      var seconds = Math.trunc(timeStop % 60)
      var minutes = Math.trunc(timeStop / 60 % 60)
      var hours = Math.trunc(timeStop / 60 / 60 % 60)

      if (timeStop <= 0) {
        window.location = '/test_passages/' + testPassageId + '/result'
        alert('Time is over!')
      } else {
        if (seconds >= 10) {
          timer.textContent = `${hours}:${minutes}:${seconds}`
        } else {
          timer.textContent = `${hours}:${minutes}:0${seconds}`
        }
      }
      --timeStop
    }, 1000)
  }
})

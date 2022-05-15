// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "popper"
import "bootstrap"

let popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl)
})

// var toastElList = [].slice.call(document.querySelectorAll('.toast'))
// var toastList = toastElList.map(function (toastEl) {
//   return new bootstrap.Toast(toastEl)
// })

// const toastTrigger = document.getElementById('liveToastBtn')
// if (toastTrigger) {
//   toastTrigger.addEventListener('click', function () {
//     const toast = new bootstrap.Toast(document.getElementById('liveToast'))
//     toast.show()
//   });
// }
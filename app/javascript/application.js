// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@popperjs/core'
import * as bootstrap from 'bootstrap'
import '@hotwired/turbo-rails'
import 'controllers'

document.addEventListener('turbo:load', function () {
  // This code is copied from Bootstrap's docs. See link below.
  const tooltipTriggerList = [].slice.call(
    document.querySelectorAll('[data-bs-toggle="tooltip"]'),
  )
  tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
})

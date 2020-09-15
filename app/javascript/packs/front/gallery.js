import GLightbox from 'glightbox'

document.addEventListener("turbolinks:load", function () {
  GLightbox({
    selector: 'glightbox',
    touchNavigation: true,
    loop: true
  })

  // lightbox.open()
})

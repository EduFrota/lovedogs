document.addEventListener("turbolinks:load", function () {
  let retract = document.querySelector("#retract_button")
  let aside = document.querySelector("#aside")

  let show = true

  if (retract != undefined) {
    retract.onclick = function () {
      if (show) {
        aside.classList.toggle("show_aside", show)
      } else {
        aside.classList.toggle("show_aside", show)
      }

      show = !show
    }
  }
})

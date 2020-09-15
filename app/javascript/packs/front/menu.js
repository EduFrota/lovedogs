document.addEventListener("turbolinks:load", function () {
  let submenuList = document.querySelectorAll(".has_submenu")

  let showSubmenu = false

  if (submenuList != undefined) {
    for (let i = 0; i < submenuList.length; i++) {
      let submenu = submenuList[i]

      submenu.onclick = function () {
        let ul = this.parentElement.children[1]
        let span = this.children[1]
        if (!showSubmenu) {
          span.firstElementChild.setAttribute('data-icon', 'arrow-down')
          ul.style.display = "block"
        } else {
          span.firstElementChild.setAttribute('data-icon', 'arrow-right')
          ul.style.display = "none"
        }

        showSubmenu = !showSubmenu

        return false
      }
    }
  }
})

document.addEventListener("turbolinks:load", function () {
  var telephone = document.querySelector("#user_telephone")

  if (telephone != undefined) {
    // 99 9 9999-9999
    // 999 9 9999-9999
    VMasker(telephone).maskPattern("(99) 99999-9999")
  }
})

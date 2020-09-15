document.addEventListener("turbolinks:load", function () {
  var birth = document.querySelector("#dog_birth")
  var dlength = document.querySelector("#dog_length")

  if (birth != undefined) {
    VMasker(birth).maskPattern("9999");
  }
  if (dlength != undefined) {
    VMasker(dlength).maskNumber();
  }
})

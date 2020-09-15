import axios from 'axios'

document.addEventListener("turbolinks:load", function () {
  let hearts = document.querySelectorAll(".heart_favorite")

  if (hearts.length > 0) {
    for (let i = 0; i < hearts.length; i++) {
      let heart = hearts[i]

      heart.onclick = async function () {
        let dogId = this.getAttribute('id')
            dogId = dogId.replace(/\D/g, '')

        const resp = await axios.get(`/set_favorite?dog_id=${dogId}`)
        const listHeart = document.querySelector(`#heart_${dogId}`)
        const modalHeart = document.querySelector(`#heart_modal_${dogId}`)

        if (resp.status == 201) {
          if (listHeart != undefined) {
            listHeart.firstElementChild.setAttribute('data-prefix', 'fas')
          }

          if (modalHeart != undefined) {
            modalHeart.firstElementChild.setAttribute('data-prefix', 'fas')
          }
        }
        if (resp.status == 204) {
          if (listHeart != undefined) {
            listHeart.firstElementChild.setAttribute('data-prefix', 'far')
          }

          if (modalHeart != undefined) {
            modalHeart.firstElementChild.setAttribute('data-prefix', 'far')
          }
        }
      }
    }
  }
})

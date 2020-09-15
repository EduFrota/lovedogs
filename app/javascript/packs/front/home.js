import axios from 'axios'

document.addEventListener("turbolinks:load", function () {
  const isLoading = document.querySelector("#is_loading")
  const dogContent = document.querySelector("#dog_content")
  const modal = document.querySelector("#dog_modal")
  const heart = document.querySelector("#heart_modal")
  let images = document.querySelectorAll(".list_image")

  if (dogContent) {
    dogContent.style.display = 'none'
  }

  if (images.length > 0) {
    for (let i = 0; i < images.length; i++) {
      let image = images[i]

      image.onclick = function () {
        let dogId = this.getAttribute('id')
        getInfo(dogId)
        heart.setAttribute('id', `heart_modal_${dogId}`)
        modal.classList.add("is-active")
      }
    }
  }

  // close image modal
  let dogModalClose = document.querySelector("#dog_modal_close")

  if (dogModalClose != undefined) {
    dogModalClose.onclick = function () {
      isLoading.style.display = 'block'
      dogContent.style.display = 'none'
      modal.classList.remove("is-active")
    }
  }

  // get dog and user info
  const getInfo = async function (dogId) {
    const resp = await axios.get(`/get_info?dog_id=${dogId}`)
    const dog = resp.data.dog
    const owner = resp.data.owner
    const favorite = resp.data.favorite

    document.querySelector("#dog_name").textContent = dog.name
    document.querySelector("#dog_image").setAttribute('src', dog.image.url)
    document.querySelector("#dog_age").textContent = `${new Date().getFullYear() - dog.birth} anos`
    document.querySelector("#dog_breed").textContent = dog.breed
    document.querySelector("#dog_sex").textContent = dog.sex == 1 ? 'Macho' : 'Fêmea'
    document.querySelector("#dog_temperament").textContent = dog.temperament
    document.querySelector("#dog_vaccine").textContent = dog.vaccine == true ? 'Vacinado' : 'Não vacinado'
    document.querySelector("#dog_height").textContent = `Tamanho ${dog.size}`
    document.querySelector("#dog_pelage").textContent = dog.pelage
    document.querySelector("#dog_pelage_color").textContent = dog.pelage_color
    document.querySelector("#dog_pedigree").textContent = dog.pedigree == true ? 'Com pedigree' : 'Sem pedigree'
    document.querySelector("#dog_register").textContent = `Registro ${dog.register || 'não informado'}`
    document.querySelector("#dog_mother_name").textContent = `Mãe ${dog.mother_name || 'não informado'}`
    document.querySelector("#dog_father_name").textContent = `Pai ${dog.father_name || 'não informado'}`

    document.querySelector("#more_photos").setAttribute("href", `/gallery/${dog.slug}`)

    document.querySelector("#owner_name").textContent = owner.name
    document.querySelector("#owner_email").textContent = owner.email
    document.querySelector("#owner_telephone").textContent = owner.telephone == true ? owner.telephone : 'Telefone não informado'
    document.querySelector("#owner_city_state").textContent = owner.city && owner.state ? `${owner.city}/${owner.state}` : ''

    if (favorite == true) {
      document.querySelector(`#heart_modal_${dogId}`).firstElementChild.setAttribute('data-prefix', 'fas')
    } else {
      document.querySelector(`#heart_modal_${dogId}`).firstElementChild.setAttribute('data-prefix', 'far')
    }

    isLoading.style.display = 'none'
    dogContent.style.display = 'block'
  }
})

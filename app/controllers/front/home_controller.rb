class Front::HomeController < Front::BaseController
  def index
    @dogs = Dog.where.not(user: current_user).order(id: :desc).includes(:user)

    @favorites = get_favorites
  end

  def get_info
    id = params[:dog_id]
    dog = Dog.find(id)
    owner = dog.user
    favorite = Favorite.where(dog: dog, user: current_user)

    if favorite == []
      favorite = false
    else
      favorite = true
    end

    render json: { dog: dog, owner: owner, favorite: favorite }
  end
end

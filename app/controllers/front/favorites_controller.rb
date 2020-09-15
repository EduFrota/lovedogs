class Front::FavoritesController < Front::BaseController
  def index
    favorites = Favorite.where(user: current_user)
    @dogs = Dog.where(id: favorites.map(&:dog_id))
  end

  def set_favorite
    dog = Dog.find(params[:dog_id])
    favorite = Favorite.where(dog: dog, user: current_user)

    if favorite == []
      Favorite.create(dog: dog, user: current_user)
      head 201
    else
      favorite.destroy_all
      head 204
    end
  end
end

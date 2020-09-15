class Front::NotificationsController < Front::BaseController
  def index
    dog_ids = current_user.dogs.map(&:id)
    @favorites = Favorite.where(dog_id: dog_ids).includes(:user).includes(:dog)
  end

  def show
    @favorite = Favorite.find(params[:id])
    if @favorite.viewed == false
      @favorite.viewed = true
      @favorite.save
    end
  end
end

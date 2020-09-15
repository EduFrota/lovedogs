class Front::GalleryController < Front::BaseController
  def index
    @dog = Dog.friendly.find(params[:dog_id])
    @images = @dog.images
    @favorites = get_favorites
  end
end

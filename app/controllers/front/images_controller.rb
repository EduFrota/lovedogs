class Front::ImagesController < Front::BaseController
  before_action :set_dog
  before_action :set_image, only: %i[edit update destroy]

  def index
    @images = @dog.images.order(id: :desc)
  end

  def new
    @image = @dog.images.build
  end

  def create
    @image = @dog.images.build(image_params)

    if @image.save
      flash[:success] = 'Imagem cadastrada com sucesso.'
      redirect_to dog_images_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @image.update(image_params)
      flash[:success] = 'Imagem atualizada com sucesso.'
      redirect_to dog_images_path
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = 'Imagem excluída com sucesso.' if @image.destroy
    redirect_to dog_images_path
  end

  private

  def image_params
    params.require(:image).permit(:image, :image_cache)
  end

  def set_image
    @image = @dog.images.find(params[:id])
  end

  def set_dog
    @dog = current_user.dogs.friendly.find(params[:dog_id])
  end
end

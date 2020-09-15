class Front::DogsController < Front::BaseController
  before_action :set_dog, only: %i[compare show edit update destroy]

  def index
    @dogs = current_user.dogs.order(id: :desc)
  end

  def compare
    @dogs = Dog.where(breed: @dog.breed).where.not(sex: @dog.sex).where.not(user: current_user).order(id: :desc)
    @favorites = get_favorites
  end

  def new
    @dog = current_user.dogs.build
  end

  def create
    @dog = current_user.dogs.build(dog_params)

    if @dog.save
      flash[:success] = 'Cão cadastrado com sucesso.'
      redirect_to dogs_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @dog.update(dog_params)
      flash[:success] = 'Cão atualizado com sucesso.'
      redirect_to dogs_path
    else
      render :edit
    end
  end

  def destroy
    flash[:success] = 'Cão excluído com sucesso.' if @dog.destroy
    redirect_to dogs_path
  end

  private

  def dog_params
    params.require(:dog).permit(
      :name,
      :birth,
      :breed,
      :sex,
      :temperament,
      :vaccine,
      :image,
      :image_cache,
      :size,
      :weight,
      :length,
      :pelage,
      :pelage_color,
      :pedigree,
      :mother_name,
      :father_name,
      :register
    )
  end

  def set_dog
    @dog = current_user.dogs.friendly.find(params[:id])
  end
end

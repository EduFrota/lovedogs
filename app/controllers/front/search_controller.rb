class Front::SearchController < Front::BaseController
  def dog
    if params[:search].present?
      @dogs = Dog.filter(params.slice(
        :by_name,
        :temperament,
        :breed,
        :sex,
        :vaccine,
        :height,
        :pelage,
        :pedigree
      )).where.not(user: current_user).order(id: :desc).includes(:user)

      @favorites = get_favorites
    end
  end

  def owner
    if params[:search].present?
      @owners = User.filter(params.slice(
        :by_name,
        :state,
        :city
      )).where.not(id: current_user).order(id: :desc).includes(:dogs)

      @favorites = get_favorites
    end
  end
end

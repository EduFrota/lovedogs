class Front::ProfilesController < Front::BaseController
  def show
    @profile = current_user
  end

  def update
    @profile = current_user

    if params[:user][:password].blank?
      params[:user].delete :password
      params[:user].delete :password_confirmation
    end

    if @profile.update_with_password(profile_params)
      bypass_sign_in(@profile, scope: :user)
      flash[:success] = 'Perfil atualizado com sucesso.'
      redirect_to profile_path
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:user).permit(
      :name,
      :image,
      :image_cache,
      :telephone,
      :state,
      :city,
      :email,
      :password,
      :password_confirmation,
      :current_password
    )
  end
end

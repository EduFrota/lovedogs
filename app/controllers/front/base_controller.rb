class Front::BaseController < ApplicationController
  layout 'front'

  protected

  def get_favorites
    favorites = Favorite.where(user: current_user)
    hash = {}

    favorites.each do |favorite|
      hash[favorite.dog_id] = favorite.user_id unless favorite.nil?
    end

    hash
  end
end

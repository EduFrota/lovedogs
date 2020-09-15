Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'callbacks',
    registrations: 'registrations'
  }

  scope module: :front do
    resources :dogs do
      member do
        get :compare
      end
      resources :images, except: :show
    end
    get '/get_info', to: 'home#get_info', as: 'get_info'
    get '/set_favorite', to: 'favorites#set_favorite', as: 'set_favorite'
    get '/favorites', to: 'favorites#index', as: 'favorites'
    get '/with_dog_data', to: 'search#dog', as: 'with_dog_data'
    get '/with_owner_data', to: 'search#owner', as: 'with_owner_data'
    resource :profile, only: [:show, :update]
    get '/gallery/:dog_id', to: 'gallery#index'
    resources :notifications, only: [:index, :show]
    root 'home#index'
  end
end

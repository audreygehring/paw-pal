Rails.application.routes.draw do
  root "homes#index"

  devise_for :users

  resources :users
  resources :shelters

  namespace :api do
    namespace :v1 do
      resources :shelters, only: [:index, :show]
    end
  end
end

Rails.application.routes.draw do
  root "shelters#index"

  devise_for :users

  resources :users
  resources :shelters

  namespace :api do
    namespace :v1 do
      resources :shelters
    end
  end
end

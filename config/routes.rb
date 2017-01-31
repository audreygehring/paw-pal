Rails.application.routes.draw do
  root "shelters#index"

  devise_for :users

  resources :users
  resources :shelters

end

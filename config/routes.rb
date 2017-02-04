Rails.application.routes.draw do
  root "shelters#index"

  devise_for :users

  resources :users do
    resources :volunteer_sessions
  end

  resources :shelters

  namespace :api do
    namespace :v1 do
      resources :shelters
    end
  end
end

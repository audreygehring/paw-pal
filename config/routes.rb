Rails.application.routes.draw do
  root "shelters#index"

  devise_for :users

  resources :users do
    resources :volunteer_sessions, except: [:index]
  end

  resources :shelters, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :shelters
    end
  end
end

Rails.application.routes.draw do
  root "shelters#index"

  devise_for :users, except: [:index]

  resources :users do
    resources :volunteer_sessions, except: [:index]
  end

  resources :shelters, only: [:index, :show]

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :shelters
    end
  end
end

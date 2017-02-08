Rails.application.routes.draw do
  root "shelters#index"

  devise_for :users, except: [:index]

  resources :shelters, except: [:index] do
    resources :volunteer_sessions, except: [:index]
    resources :users, only: [:edit, :update]
  end

  resources :shelters, only: [:index, :show]

  resources :users

  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :volunteer_sessions, only: [:index, :destroy]
  end

  namespace :api do
    namespace :v1 do
      resources :shelters, only: [:show]
    end
  end
end

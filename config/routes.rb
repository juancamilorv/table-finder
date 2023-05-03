Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :restaurants, except: :show do
    resources :reservations, only: %i[new create]
  end

  resources :reservations, only: %i[index edit update destroy]
end

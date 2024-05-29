Rails.application.routes.draw do
  devise_for :users

 # root to: "dashboards#dashboard"

  root to: "products#index"

  get "dashboard", to: "dashboards#dashboard"

  get "profile/:id", to: "profiles#profile"
  resources :products, only: [:index, :show, :new, :edit, :update]
  resources :offer_products, only: [:index]
  resources :messages, only: [:index, :show, :new, :create, :destroy]
  resources :offers, only: [:index]


  resources :products, only: [:index, :show, :edit, :update]


end

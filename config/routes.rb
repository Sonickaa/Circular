Rails.application.routes.draw do
  devise_for :users

 # root to: "dashboards#dashboard"

  root to: "products#index"

  get "dashboard", to: "dashboards#dashboard"

  get "profiles/:id", to: "profiles#profile"

  resources :products, only: [:index, :show, :new, :edit, :update, :destroy]
  resources :offer_products, only: [:index]
  resources :messages, only: [:index, :show, :new, :create, :destroy]
  resources :offers, only: [:index, :show]
  resources :profiles, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :categories, only: [:index]

end

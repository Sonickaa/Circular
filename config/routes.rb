Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root "products#index"

  get "dashboard", to: "dashboards#dashboard"

  get "/profile", to: "profiles#profile", as: :my_profile
  patch "/profile", to: "profiles#update", as: :profile

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :product_wishlists, only: [:create]
  end
  resources :offer_products, only: [:index]
  resources :messages, only: [:index, :show, :new, :create, :destroy]
  resources :offers, only: [:index, :show]
  resources :profiles, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :categories, only: [:index]
  resources :product_wishlists, only: [:destroy]
  resources :wishlists, only: [:show]
  # resources :products, only: [:destroy]
end

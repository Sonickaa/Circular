Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }

  root "products#index"

  get "dashboard", to: "dashboards#dashboard"
  get "dashboard/sent", to: "dashboards#sent"
  patch "dashboard/:id/accepted_offer", to: "dashboards#accepted_offer", as: "accepted"
  patch "dashboard/:id/declined_offer", to: "dashboards#declined_offer", as: "declined"
  get "dashboard/received", to: "dashboards#received"
  get "dashboard/finished", to: "dashboards#finished"
  post "dashboard/offer/createCounterOffer", to: "offers#create_counter_offer", as: "counter_offer"

  get "/profile", to: "profiles#profile", as: :my_profile
  patch "/profile", to: "profiles#update", as: :profile

  delete "/product_wishlists/:id", to: "product_wishlists#unheart_wishlist_product", as: :unheart_wishlist_product

  resources :products, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :product_wishlists, only: [:create]
    resources :offers, only: [:create]
  end

  resources :offer_products, only: [:index]
  resources :messages, only: [:index, :show, :new, :create, :destroy]
  resources :offers, only: [:index, :show, :destroy]
  resources :profiles, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :categories, only: [:index]
  resources :product_wishlists, only: [:destroy]
  resources :wishlists, only: [:show]

  resources :products do
    post 'toggle_favorite', on: :member
  end
end

Rails.application.routes.draw do
  devise_for :users
  # Homepage where you can see all clothes
  root "items#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"\

  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    resources :rentals, only: [:new, :create]
  end

  resources :users, only: [:show]

  resources :rentals, only: [:index, :destroy]

  get "rentals/:id/approve", to: "rentals#approve", as: :approve_rental

  # New / Items
  # get "items/new", to: "items#new", as: :new_item
  # post "items", to: "items#create"

  # Show / Items
  # get "items/:id", to: "items#show", as: :item

  # Edit / Items
  # get "items/:id/edit", to: "items#edit", as: :edit_item
  # patch "items/:id", to: "items#update"

  # Destroy / Items
  # delete "items/:id", to: "items#destroy"

  # Profile
  # get "/profile", to: "profile#show"

  # New / Rental (Request)
  # get "rentals/new", to: "rentals#new"
  # post "rentals/new", to: "rentals#create"

end

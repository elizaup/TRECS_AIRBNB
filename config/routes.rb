Rails.application.routes.draw do
  get 'items/new'
  devise_for :users
  # Homepage where you can see all clothes
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Show / Items
  get "items/:id", to: "items#show", as: :item

  # New / Items
  get "items/new", to: "items#new", as: :new_item
  post "items", to: "items#create"

  # Edit / Items
  get "items/:id/edit", to: "items#show", as: :edit_item
  patch "items/:id", to: "items#update"

  # Destroy / Items
  delete "items/:id", to: "items#destroy"

  # Profile
  # get "/profile", to: "profile#show"

  # Rental "checkout"
  # get "/items/rental/new", to: "rental#new"
  # post "items/rental", to: "rental#create"
end

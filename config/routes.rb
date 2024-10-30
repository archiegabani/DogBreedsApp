Rails.application.routes.draw do
  get "pages/about"
  get "breeds/index"
  get "home/index"
  root "home#index"  # Ensure this points to the home controller

  resources :breeds, only: [ :index, :show ] do
    get "subcategories", on: :member
  end

  get "about", to: "pages#about", as: :about
end

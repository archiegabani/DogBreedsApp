Rails.application.routes.draw do
  get "pages/about", as: :about  # Define the route for the about page with a named route

  # Reveal health status on /up
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"  # Keep this if you want home#index as the root

  resources :breeds, only: [ :index, :show ] do
    get "subcategories", on: :member  # Nesting the subcategories route here
  end
end

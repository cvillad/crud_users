Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#index"
  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations" }
  get "/:username", to: "users#show", as: "user"
  resources :users, only: [:index] do
    resources :social_networks
    delete "image", to: "users#destroy_image"
  end
  
end

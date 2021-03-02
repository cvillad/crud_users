Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: 'users/sessions', 
    registrations: "users/registrations" }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "users#index"

  resources :users, except: [:new, :create, :edit, :update, :destroy] do
    resources :social_networks
    delete "image", to: "users#destroy_image"
  end
  
end

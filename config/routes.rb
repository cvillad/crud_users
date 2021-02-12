Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "user#index"
  
  get "create", to: "user#new"
  post "create", to: "user#create"

  get "edit", to: "user#edit"
  patch "edit", to: "user#update"

  delete "delete", to: "user#destroy"
end

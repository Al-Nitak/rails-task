Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :weather do
    resources :clouds, only: [:create]
    resources :wind, only: [:create]
    resources :temperature, only: [:create]
  end
end

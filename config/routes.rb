Rails.application.routes.draw do
  resources :menus
  resources :foods
  resources :kategoris
  resources :restorans
  root "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

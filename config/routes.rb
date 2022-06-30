Rails.application.routes.draw do
  get 'person/index'
  devise_for :users
  resources :menus
  resources :foods
  resources :kategoris
  resources :restorans
  root "pages#dashboard"
  get 'pagesdashboard' => 'pages#dashboard'
  
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get '/persons' => 'person#index'
  get '/persons/:id/edit' => 'person#edit', as: "edit_member"
  patch '/persons/:id' => 'person#update', as: "update_member"

  

end

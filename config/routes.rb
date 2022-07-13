Rails.application.routes.draw do
  get 'person/index'
  devise_for :users, :path_prefix =>'auth'
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

  get '/persons/create' => 'person#create', as: "create_member"
  post '/persons/register' => 'person#register', as: "register_member"
  get '/persons/:id/destroy' => 'person#destroy', as: "destroy_member"

  post '/search/food' => 'search3#food', as: "search_food"
  post '/search/kategori' => 'search3#kategori', as: "search_kategori"

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#login'
      get '/profile', to: 'clients#profile', as: "profile_member"
      get '/clients/:id/detail', to: 'clients#detail', as: "detail_member"
      post '/search', to: 'search#cari'
      post '/search2', to: 'search2#cari'
    end
  end
  

end

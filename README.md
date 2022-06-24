# make the project
rails new foodhunter -d=mysql

source : https://www.nopio.com/blog/authentication-authorization-rails/
github : https://github.com/nopio/authentication-and-authorization-tutorial

# initialize git
git init

# set password mysql

# create database 
rake db:create

# application.html.erb

# install bootstrap
open application.html.erb

add this to head
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

add this to body
<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
-->

and finally


<!DOCTYPE html>
<html>
  <head>
    <title>Foodhunter</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
    integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


    <%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
    <%= javascript_importmap_tags %>
  </head>

  <body>
    <%= render 'pages/header' %>
    <div class="container">
      <br/>
      <% if notice %>
        <%= render 'layouts/alert' %>
      <% end %>
      <br/>
      <%= yield %>
    </div>

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>
    -->
  </body>
</html>


# add pages welcome
rails g controller pages welcome

# routes.rb
root "pages#welcome"

# make alert function
app -> view -> layouts -> _alert.html.erb

and write this
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <%# <strong>Holy guacamole!</strong> You should check in on some of those fields below. %>
  <%= notice %>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>


# add header
make file : _header.html.erb under app -> view -> pages

and write this in body of application.html.erb
<%= render 'home/header' %>

and write this in page of _header.html.erb

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="pages/welcome">Food Hunter</a>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Restaurant <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                    <li><%= link_to "List", restautrants_path %></li>
                    <li><%= link_to "New", new_restautrant_path %></li>
                </ul>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>


# make restaurant

rails generate scaffold Restoran name:string alamat:string city:string phone:string image:string

rails generate scaffold Kategori name:string jenis:string origin:string

rails generate scaffold Food name:string jenis:string origin:string Kategori:references

rails generate scaffold Menu name:string harga:flot image:string restoran:references food:references

# relation

# food.rb
class Food < ApplicationRecord
  belongs_to :kategori
  has_many :menus, dependent: :destroy
end

# restoran
class Restoran < ApplicationRecord
    has_many :menus, dependent: :destroy
end

# menu
class Menu < ApplicationRecord
  belongs_to :restoran
  belongs_to :food
end

# kategori
class Kategori < ApplicationRecord
    has_many :foods, dependent: :destroy
end


# Now, let’s modify files in app/views/restaurants/index.html.erb folder and etc

<p style="color: green"><%= notice %></p>

<h2>Restautrants</h2>
<div class="product-block">
  <table class="table table-striped table-bordered table-hover">
    <thead>
      <tr>
      <th class="col-md-2">Name</th>
    	<th class="col-md-2">Alamat</th>
    	<th class="col-md-4">City</th>
      </tr>
    </thead>
    <tbody>
      <% @restautrants.each do |restautrant| %>
        <tr>
      	  <td class="col-md-2"><%= restautrant.name %></td>
      	  <td class="col-md-2"><%= restautrant.alamat %></td>
          <td class="col-md-2"><%= restautrant.city %></td>
      	  <td class="col-md-4">
            <%= link_to 'Show', restautrant_path(restautrant), class: "btn btn-info" %>
            <%= link_to 'Edit', edit_restautrant_path(restautrant), class: "btn  btn-warning" %>
            <%= link_to 'Destroy', restautrant_path(restautrant), method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-danger" %>
      	  </td>
    	</tr>
      <% end %>
    </tbody>
  </table>
</div>
<br>
<%= link_to 'New Restautrant', new_restautrant_path, class: "btn btn-primary" %>



# add this gem
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'rolify', '~> 6.0'
gem 'cancan', '~> 1.6', '>= 1.6.10'

# bundle

# rails generate devise:install

# Go to config/environments/development.rb file and add this line:
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

# rails g devise:views

# rails generate devise User

# rake db:migrate

restart app

# model User
devise :database_authenticatable, :registerable,
     	:recoverable, :rememberable, :validatable

# routes.rb
devise_for :users

bug sewaktu logoout
devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

# trackable pada user.rb dihilangkan
devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# devise.rb

# Add a new field to the user
rails g migration add_username_to_users username:string
rake db:migrate

class Restautrant < ActiveRecord::Base
  belongs_to :user
end

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
     	:recoverable, :rememberable, :trackable, :validatable
  has_many :products, dependent: :destroy
end

# products_controller.rb
def create
  @product = Product.new(product_params)
  @product.user = current_user
  if @product.save
    redirect_to @product, notice: 'Product was successfully created.'
  else
    render :new
  end
end

# Restautrant/index.html.erb
<td class="col-md-2"><%= product.user.try(:email) %></td>

# gem 'carrierwave'

# bundle

# rails g uploader photo

# app -> uploader
un comment this
def extension_white_list
    %w(jpg jpeg gif png)
  end

# menu.rb
mount_uploader :image, PhotoUploader

# app -> view -> menu -> _form,html.erb
<%= form.file_field :image %>

# rubah type data varchar to text
rails g migration change_image_to_text_from_menus

class ClassName < ActiveRecord::Migration
  def change
    change_table :menus do |table|
    table.change :image, :text
    end
  end
end

rails db:migrate

# app -> view -> menu -> _form
add this to show name of foreign key

<td><%= image_tag(menu.image.url, alt: 'Image') if menu.image? %></td>

# serve root in header
<%= link_to 'Friend App', root_path, class:"navbar-brand" %>

# make users page 
rails generate controller person index

# app/controllers/person_controller.rb
@users = User.all

# app/views/person/index.html.erb
<% @users.each do |user| %>
  <%= user.username %><br/>
  <%= user.email %><br/>
<% end %>

# routes.rb
get '/persons' => 'person#index'

# add this person_controller.rb
def show
  @user = User.find_by_id(params[:id])
end

#  create app/views/person/show.html.erb
<h1><%= @user.username %></h1>
<h5><%= @user.email%></h5>

# routes.rb
get '/persons/:id' => 'person#show'

# gem "cancancan"
bundle install

# make a role in user
rails g migration add_columns_to_users

add_column :users, :user, :boolean, default:true
add_column :users, :premium, :boolean, default:false
add_column :users, :admin, :boolean, default:false

# in application_controller.rb
before_action :authenticate_user!
load_and_authorize_resource
    rescue_from CanCan::AccessDenied do |exception|
        redirect_to '/', :alert => exception.message
    end

# rails g cancan:ability

# app -> model -> ability.rb
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    if user.premium?
      can :manage, all
    else
      can [:read], Car
      can :manage, User
    end
  end
end


class Food < ApplicationRecord
  belongs_to :kategori
  has_many :menus, dependent: :destroy

  
end

class Restoran < ApplicationRecord
    has_many :menus, dependent: :destroy
end

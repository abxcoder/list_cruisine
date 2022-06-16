class Kategori < ApplicationRecord
    has_many :foods, dependent: :destroy
end

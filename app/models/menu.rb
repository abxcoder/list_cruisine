class Menu < ApplicationRecord
  belongs_to :restoran
  belongs_to :food

  mount_uploader :image, PhotoUploader
end

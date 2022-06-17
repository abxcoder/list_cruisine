class Restoran < ApplicationRecord
    has_many :menus, dependent: :destroy

    mount_uploader :image, PhotoUploader
end

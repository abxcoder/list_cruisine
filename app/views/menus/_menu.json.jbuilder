json.extract! menu, :id, :name, :harga, :image, :restoran_id, :food_id, :created_at, :updated_at
json.url menu_url(menu, format: :json)

json.extract! food, :id, :name, :jenis, :origin, :kategori_id, :created_at, :updated_at
json.url food_url(food, format: :json)

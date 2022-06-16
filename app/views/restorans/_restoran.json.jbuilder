json.extract! restoran, :id, :name, :alamat, :city, :phone, :image, :created_at, :updated_at
json.url restoran_url(restoran, format: :json)

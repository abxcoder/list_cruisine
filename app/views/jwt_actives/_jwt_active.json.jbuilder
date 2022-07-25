json.extract! jwt_active, :id, :jwt, :user_id, :created_at, :updated_at
json.url jwt_active_url(jwt_active, format: :json)

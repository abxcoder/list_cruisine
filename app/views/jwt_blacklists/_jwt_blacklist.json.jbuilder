json.extract! jwt_blacklist, :id, :jwt, :user_id, :created_at, :updated_at
json.url jwt_blacklist_url(jwt_blacklist, format: :json)

json.extract! profile, :id, :user_id, :role_id, :route_id, :title, :created_at, :updated_at
json.url profile_url(profile, format: :json)

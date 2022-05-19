json.extract! route, :id, :route_name, :r_description, :created_at, :updated_at
json.url route_url(route, format: :json)

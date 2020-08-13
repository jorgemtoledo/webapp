json.extract! user, :id, :admin, :name, :position, :department, :workload, :created_at, :updated_at
json.url user_url(user, format: :json)

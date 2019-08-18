json.extract! user, :id, :organisation_id, :name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)

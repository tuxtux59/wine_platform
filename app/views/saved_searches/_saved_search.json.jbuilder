json.extract! saved_search, :id, :user_id, :search_params, :created_at, :updated_at
json.url saved_search_url(saved_search, format: :json)

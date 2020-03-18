json.extract! warehouse, :id, :wh_code, :name, :pincoode, :max_capacity, :created_at, :updated_at
json.url warehouse_url(warehouse, format: :json)

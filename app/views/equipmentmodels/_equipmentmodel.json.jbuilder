json.extract! equipmentmodel , :id, :name, :brand_id, :created_at, :updated_at
json.url equipment_url(equipmentmodel, format: :json)

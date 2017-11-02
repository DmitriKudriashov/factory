json.extract! inventory, :id, :quantity, :budgetitem_id, :description_id, :brand_id, :serial_number, :supplier_id, :price_curry, :sum_curry, :price_usd, :sum_usd, :ratecurry_id, :currency_id, :unit_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)

json.extract! inventory, :id, :Quantity, :budgetsitems_id, :descriptions_id, :brands_id, :SerialNumber, :suppliers_id, :PriceCurry, :SumCurry, :PriceUsd, :SumUsd, :ratecurries_id, :currency_id, :units_id, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)

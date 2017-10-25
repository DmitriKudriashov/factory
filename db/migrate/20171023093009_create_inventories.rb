class CreateInventories < ActiveRecord::Migration[5.0]
  def change
    create_table :inventories do |t|
      t.decimal   :quantity, default: 0
      t.integer   :budgetsitem_id
      t.integer   :description_id
      t.integer   :brand_id
      t.string    :serial_number, null: false 
      t.integer   :supplier_id
      t.decimal   :price_curry, precision: 15, scale: 2
      t.decimal   :sum_curry,   precision: 15, scale: 2
      t.decimal   :price_usd,   precision: 15, scale: 2
      t.decimal   :sum_usd,     precision: 15, scale: 2
      t.integer   :ratecurry_id
      t.integer   :currency_id
      t.integer   :unit_id
      t.timestamps
    end
     add_index :inventories, :budgetsitem_id
    add_index :inventories, :description_id
     add_index :inventories, :brand_id
     add_index :inventories, :supplier_id
     add_index :inventories, :ratecurry_id
     add_index :inventories, :currency_id
     add_index :inventories, :unit_id
       
    
  end
end

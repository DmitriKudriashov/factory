class CreateModelprices < ActiveRecord::Migration[5.0]
  def change
    create_table :modelprices do |t|
      t.integer :modelset_id
      t.integer :category_id
      t.integer :description_id
      t.decimal :quantty, precision: 15, scale: 4
      t.integer :unit_id
      t.decimal :unit_price, precision: 15, scale: 2
      t.integer :currency_id
      t.integer :ratecurry_id
      t.decimal :sum_curry, precision: 15, scale: 2
      t.decimal :sum_usd, precision: 15, scale: 2
      t.timestamps
    end
     add_index :modelprices, :modelset_id 
     add_index :modelprices, :category_id 
     add_index :modelprices, :description_id 
     add_index :modelprices, :unit_id 
     add_index :modelprices, :currency_id 
     add_index :modelprices, :ratecurry_id 
    
  end
end

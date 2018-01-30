class CreateCashes < ActiveRecord::Migration[5.0]
  def change
    create_table :cashes do |t|
      t.date    :cash_date
      t.integer :currency_id
      t.integer :ratecurry_id
      t.decimal :sum_curry, precision: 15, scale: 2
      t.decimal :sum_usd, precision: 15, scale: 2
      t.integer :budgetsitem_id
      t.timestamps
 end
     add_index :cashes, :cash_date 
     add_index :cashes, :currency_id 
     add_index :cashes, :ratecurry_id 
	   add_index :cashes, :budgetsitem_id 
  end


end

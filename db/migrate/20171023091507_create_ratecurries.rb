class CreateRatecurries < ActiveRecord::Migration[5.0]
  def change
    create_table :ratecurries do |t|
      t.integer :currency_id, null: false 
      t.decimal :rate, precision: 15, scale: 4
      t.date    :date_rate, default: Date.today	
      t.timestamps
    end
      add_index :ratecurries, :currency_id 
      add_index :ratecurries, :currency_id, :date_rate
      
  end
end

class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.string   :name #, null: false 
      t.string   :curry_code, limit: 3, null: false 
      t.timestamps
    end
      add_index :currencies, :name, unique: true 
      add_index :currencies, :curry_code, unique: true 
    
  end
end

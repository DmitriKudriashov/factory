class CreateModelsets < ActiveRecord::Migration[5.0]
  def change
    create_table :modelsets do |t|
      t.string  :number_model #, null: false 
      t.date    :date_model, null: false , default: Date.today
      t.integer  :product_id
      t.timestamps
    end
      add_index :modelsets, :number_model, unique: true 
      add_index :modelsets, :product_id
 end
end

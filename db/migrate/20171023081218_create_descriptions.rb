class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.string :name, null: false 
      t.integer :category_id, null: false , default: 0
      t.timestamps
    end
      add_index :descriptions, :name, unique: true 
      add_index :descriptions, :category_id
       
  end
end

class CreateBrands < ActiveRecord::Migration[5.0]
  def change
    create_table :brands do |t|
      t.string :name, null: false
      t.timestamps
    end
       add_index :brands, :name, unique: true 
  end
end

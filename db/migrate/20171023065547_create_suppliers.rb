class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name, null: false
      t.timestamps
    end
    add_index :suppliers, :name, unique: true 
  end
end

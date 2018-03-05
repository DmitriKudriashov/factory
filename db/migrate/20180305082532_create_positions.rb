class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.string :name

      t.timestamps
    end
    add_index :positions, :name, unique: true
  end
end

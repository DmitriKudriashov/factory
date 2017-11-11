class CreateUsingtypes < ActiveRecord::Migration[5.0]
  def change
    create_table :usingtypes do |t|
    	t.string   :name
      t.timestamps
    end
  end
end

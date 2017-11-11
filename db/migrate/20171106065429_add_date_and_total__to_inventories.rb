class AddDateAndTotalToInventories < ActiveRecord::Migration[5.0]
  def change
  	add_column :inventories, :date_investment, :integer
  	add_column :inventories, :usingtype_id, :integer
  end
end

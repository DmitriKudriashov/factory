class InventoryChangeNameBudgetsitem < ActiveRecord::Migration[5.0]
  def change
  		rename_column :inventories, :budgetsitem_id, :budgetitem_id
  
  end
end

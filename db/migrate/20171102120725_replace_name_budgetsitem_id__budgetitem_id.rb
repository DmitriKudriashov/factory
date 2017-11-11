class ReplaceNameBudgetsitemIdBudgetitemId < ActiveRecord::Migration[5.0]
  def change
  		rename_column :inventories, :budgetitem_id, :budgetitem_id
  
  end
end

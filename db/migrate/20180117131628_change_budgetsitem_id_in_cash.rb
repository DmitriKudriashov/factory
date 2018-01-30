class ChangeBudgetsitemIdInCash < ActiveRecord::Migration[5.0]
  def change
  	rename_column :cashes, :budgetsitem_id, :budgetitem_id
  end
end

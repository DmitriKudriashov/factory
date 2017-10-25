json.extract! budgetitem, :id, :BudgetItemName, :CodeItem, :created_at, :updated_at
json.url budgetitem_url(budgetitem, format: :json)

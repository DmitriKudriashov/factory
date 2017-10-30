class CreateBudgetitems < ActiveRecord::Migration[5.0]
  def change
    create_table :budgetitems do |t|
      t.string  :name #,     null: false
      t.string  :codeitem, limit: 10 #, null: false 
      t.string  :shortname, limit: 20
      t.timestamps
    end
     add_index :budgetitems, :name, unique: true 
     add_index :budgetitems, :codeitem, unique: true 
     add_index :budgetitems, :shortname 
  end
end

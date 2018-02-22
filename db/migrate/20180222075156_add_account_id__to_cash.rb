class AddAccountIdToCash < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :cashes, :account_id, :integer

  end
    add_index :cashes, :account_id
  
end

class AddAccountIdToCash < ActiveRecord::Migration[5.0]
  def change
  	  	add_column :cashes, :account_id, :integer

  end
<<<<<<< HEAD
  # No execute on Heroku ! # add_index :cashes, :account_id
=======
    # No  execute on Heroku add_index :cashes, :account_id
>>>>>>> a1d816dc3aa0f904cdafff6b24ecdb8d4b166bdc
  
end

class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :account

      t.timestamps
    end
    add_index :accounts, :account, unique: true
  end
end

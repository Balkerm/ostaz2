class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :description
      t.float :balance
      t.integer :AccountType_id

      t.timestamps
    end
  end
end

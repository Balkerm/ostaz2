class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.float :amount
      t.references :from
      t.references :to

      t.timestamps
    end
    add_index :transactions, :from_id
    add_index :transactions, :to_id
  end
end

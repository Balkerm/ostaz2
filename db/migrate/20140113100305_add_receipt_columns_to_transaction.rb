class AddReceiptColumnsToTransaction < ActiveRecord::Migration
  def self.up
    add_attachment :transactions, :receipt
  end

  def self.down
    remove_attachment :transactions, :receipt
  end
end

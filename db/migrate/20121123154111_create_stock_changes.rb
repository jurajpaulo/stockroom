class CreateStockChanges < ActiveRecord::Migration
  def self.up
    create_table :stock_changes do |t|
      t.integer :stock_id, :null => false
      t.string :employee_name, :null => false
      t.integer :count_change, :null => false
      t.integer :user_id, :null => false
      t.timestamps
    end
    add_index :stock_changes, :stock_id
  end

  def self.down
    drop_table :stock_changes
  end
end

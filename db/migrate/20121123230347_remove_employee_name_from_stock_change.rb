class RemoveEmployeeNameFromStockChange < ActiveRecord::Migration
  def self.up
    remove_column :stock_changes, :employee_name
  end

  def self.down
    add_column :stock_changes, :employee_name, :string, :after => :stock_id
  end
end

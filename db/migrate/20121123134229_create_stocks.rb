class CreateStocks < ActiveRecord::Migration
  def self.up
    create_table :stocks do |t|
      t.string :name, :null => false
      t.string :description
      t.integer :kind, :null => false
      t.integer :count, :null => false, :default => 0
      t.integer :critical_level, :null => false, :default => 0
      t.timestamps
    end
    add_index :stocks, :name
  end

  def self.down
    drop_table :stocks
  end
end

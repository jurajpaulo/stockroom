class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, :null => false, :unique => true
      t.string :password_hash
      t.string :password_salt
      t.boolean :deleted, :default => false
    end
  end

  def self.down
    drop_table :users
  end
end

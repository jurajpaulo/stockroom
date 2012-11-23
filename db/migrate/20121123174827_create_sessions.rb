class CreateSessions < ActiveRecord::Migration
  def self.up
    create_table :sessions, :id => false do |t|
      t.string :id, :null => false
      t.integer :user_id
      t.datetime :expires_at
    end
    add_index :sessions, :id, :unique => true
  end

  def self.down
    drop_table :sessions
  end
end

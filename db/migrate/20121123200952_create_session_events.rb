class CreateSessionEvents < ActiveRecord::Migration
  def self.up
    create_table :session_events do |t|
      t.integer :user_id, :null => false
      t.integer :event
      t.datetime :created_at
    end
  end

  def self.down
    drop_table :session_events
  end
end

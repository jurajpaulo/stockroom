class AddFirstUser < ActiveRecord::Migration
  def self.up
      User.create :email => 'ivan@elita.sk', :password => 'ciernamacka', :deleted => false
  end

  def self.down
      User.find_by_email('ivan@elita.sk').delete
  end
end

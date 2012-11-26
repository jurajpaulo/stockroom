class SessionEvent < ActiveRecord::Base
  belongs_to :user
  
  attr_accessible :user_id, :event, :created_at
  
  EVENT = {'Started' => 1, 'Ended' => 2}
  
  scope :created, where(:event => EVENT['Started'])
  
  def self.log_start_event user_id
      self.create :user_id => user_id, :event => EVENT['Started']
  end

  def self.log_end_event user_id
      self.create :user_id => user_id, :event => EVENT['Ended']
  end
  
  def readable_event
      EVENT.invert[event]
  end
end

class Session < ActiveRecord::Base
  belongs_to :user

  attr_accessible :id, :user_id, :expires_at
  
  before_create :destroy_users_other_sessions
  after_create :log_session_started
  after_destroy :log_session_ended
  
  #find a session by id, destroy it if it's expired
  def self.find_active_session session_id
      active_session = find_by_id session_id
      if active_session && active_session.expired
          active_session.destroy
          active_session = nil
      end
      return active_session
  end
  
  def expired
      expires_at < Time.now
  end
  
  #when a user logs in from a different browser/pc, destroy possible other session (there can only be 1)
  def destroy_users_other_sessions
      other_session = Session.find_by_user_id(user_id)
      other_session.destroy if other_session
  end
  
  def log_session_started
      SessionEvent.log_start_event user_id
  end

  def log_session_ended
      SessionEvent.log_end_event user_id
  end
  
  
end

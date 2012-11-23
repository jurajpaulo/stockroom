class User < ActiveRecord::Base
  has_one :session
  has_many :stock_changes
  has_many :session_events

  attr_accessible :email, :password, :password_confirmation, :deleted
  attr_accessor :password
  
  validates_confirmation_of :password
  validates :password, :presence => true, 
                    :length => {:minimum => 6, :maximum => 255},
                    :on => :create
  validates :email, :presence => true, 
                    :length => {:minimum => 6, :maximum => 255},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}

  before_save :encrypt_password
  
  scope :valid, where(:deleted => false)
  
  #returns user if email & password are OK, otherwise nil
  def self.authenticate(email, password)
    user = valid.find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def destroy
    update_attributes(:deleted => true)
    session.destroy if session
  end
end

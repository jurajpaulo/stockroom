class Stock < ActiveRecord::Base
  has_many :stock_changes
  
  attr_accessible :name, :description, :kind, :count, :critical_level
  
  KIND = {'Monitor' => 1, 'Desktop' => 2, 'Peripheral' => 3, 'Printer' => 4, 'Cable' => 5}
  
  validates_length_of :name, :minimum => 3, :allow_nil => false, :allow_blank => false
  validates_uniqueness_of :name
  validates_presence_of :kind
  validates_numericality_of :count, :greater_than_or_equal_to => 0, :less_than => 2147483647
  validates_numericality_of :critical_level, :greater_than_or_equal_to => 0, :less_than => 2147483647

  after_save :check_critical_level
  
  def check_critical_level
      # email sent when count is less than critical level, but only when it was above critical level before, avoiding over-emailing
      StockMailer.critical_stock_level_reached(self).deliver if count < critical_level && count_was >= critical_level
  end
  
  def readable_kind
      KIND.invert[kind]
  end
end

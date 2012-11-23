class StockChange < ActiveRecord::Base
  belongs_to :stock
  belongs_to :user
  
  attr_accessible :stock_id, :count_change
  accepts_nested_attributes_for :stock
  
  validates_exclusion_of :count_change, :in => [0]
end

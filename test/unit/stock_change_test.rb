require 'test_helper'

class StockChangeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert StockChange.new.valid?
  end
end

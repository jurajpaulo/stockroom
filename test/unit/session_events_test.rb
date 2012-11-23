require 'test_helper'

class SessionEventsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SessionEvent.new.valid?
  end
end

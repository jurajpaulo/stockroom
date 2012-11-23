require 'test_helper'

class SessionEventTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert SessionEvent.new.valid?
  end
end

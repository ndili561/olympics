require('minitest/autorun')
require('minitest/rg')
require_relative('../models/event')


class TestEvent < Minitest::Test

  def setup
    @event1=Event.new({'event'=>'football','day'=>30,'month'=>"March",'type'=>"single"})
  end

  def test_event
    assert_equal('football', @event1.event)
  end

  def test_day
    assert_equal(30, @event1.day)
  end

  def test_month
    assert_equal("March", @event1.month)
  end

  def test_type
    assert_equal('single', @event1.type)
  end
end
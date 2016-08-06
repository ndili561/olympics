require('minitest/autorun')
require('minitest/rg')
require_relative('../models/athlete')
require_relative('../models/nation')
require_relative('../models/event')


class AthleteTest < MiniTest::Test

  def setup
    @nation2=Nation.new({'name'=>'France'})
    @event1=Event.new({'event'=>'football'})
    @athlete=Athlete.new({'name'=>'Rossi','event_id'=>1,'nation_id'=>1}) 
  end


  def test_name
    assert_equal("Rossi", @athlete.name)
  end

  def test_event
    assert_equal('football', @event1.event)
  end

  def test_save
    @nation2.save()
    @event1.save()
    @athlete.save()
   assert_equal(1, @athlete.id)
  end

 
end
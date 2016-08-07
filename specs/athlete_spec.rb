require('minitest/autorun')
require('minitest/rg')
require_relative('../models/athlete')
require_relative('../models/nation')
require_relative('../models/event')


class AthleteTest < MiniTest::Test

  def setup
    options={'nation'=>"Italy",'point' => '10'}
    @nation=Nation.new(options)
    @event1=Event.new({'event'=>'football','day'=>30,'month'=>"March",'type'=>"single"})
    @athlete=Athlete.new({'name'=>'Rossi','event_id'=>1,'nation_id'=>1}) 
  end


  def test_name
    assert_equal("Rossi", @athlete.name)
  end

  def test_event
    assert_equal('football', @event1.event)
  end

  def test_day_event
   assert_equal(30, @event1.day)
  end

  def test_month_event
    assert_equal('March', @event1.month)
  end

  def test_event_type
   assert_equal('single', @event1.type)
  end

  def test_save
    @nation.save()
    @event1.save()
    @athlete.save()
   assert_equal(1, @athlete.id)
  end

 
end
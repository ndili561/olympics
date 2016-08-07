require('minitest/autorun')
require('minitest/rg')
require_relative('../models/athlete')
require_relative('../models/nation')
require_relative('../models/event')
require_relative('../models/medals')
require('pry-byebug')

class TestMedals_collection < Minitest::Test


  def setup
    options={'nation'=>"Italy",'point' => 0}
    @nation=Nation.new(options)
    options2={'nation'=>"France",'point' => 0}
    @nation2=Nation.new(options2)
    option3={'nation'=>'germany', 'point'=>0}
    @nation3=Nation.new(option3)
    @event1=Event.new({'event'=>'bike','day'=>30,'month'=>"March",'type'=>"single"})
    @athlete=Athlete.new({'name'=>'Rossi','event_id'=>1,'nation_id'=>1})  
    @athlete2=Athlete.new({'name'=>"Dupont",'event_id'=>1,'nation_id'=>2})
    @athlete3=Athlete.new({'name'=>"Scwarz",'event_id'=>1,'nation_id'=>3})
    @medal=Medal.new({'gold_medal_athlete'=>1,'silver_medal_athlete'=>2,'bronze_medal_athlete'=>3})
  
  end

  def test_point
    assert_equal(0,@nation.point)
  end

  def test_event
    assert_equal('bike',@event1.event)
  end

  def test_athlete_event
   assert_equal(1,@athlete.event_id)
  end

 def test_athlete_nation
   assert_equal(1,@athlete.nation_id)
 end

 def test_medal_gold
   assert_equal(1, @medal.gold_medal_athlete_id)
 end

 def test_medal_silver
   assert_equal(2, @medal.silver_medal_athlete_id)
 end

 def test_medal_bronze
   assert_equal(3, @medal.bronze_medal_athlete_id)
 end

 def test_add_5_point
   @nation.save()
   @nation2.save()
   @nation3.save()
   @event1.save()
   @athlete.save()
   @athlete2.save()
   @athlete3.save()
   Medal.update_medal(@medal)
   result = Medal.nations()
   assert_equal('5', result[0]['points'])
 end

 # # def test_add_3_point
 # #  @nation.save()
 # #  @nation2.save()
 # #  @nation3.save()
 # #  @event1.save()
 # #  @athlete.save()
 # #  @athlete2.save()
 # #  @athlete3.save()
 # #  Medal.update_medal(@medal)
 # #  result = Medal.nations()
 # #  assert_equal('3', result[1]['points'])
 # # end


 # # def test_add_1_point
 # #  @nation.save()
 # #  @nation2.save()
 # #  @nation3.save()
 # #  @event1.save()
 # #  @athlete.save()
 # #  @athlete2.save()
 # #  @athlete3.save()
 # #  Medal.update_medal(@medal)
 # #  result = Medal.nations()
 # #  assert_equal('1', result[2]['points'])
 # end


end



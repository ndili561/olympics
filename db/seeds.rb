require('pry-byebug')
require_relative('../models/nation')
require_relative('../models/athlete')
require_relative('../models/event')
require_relative('../models/medals')

Athlete.delete_all()
Event.delete_all()
Nation.delete_all()

options={'nation'=>"Italy",'point' => 0}
@nation=Nation.new(options)
options2={'nation'=>"France",'point' => 0}
@nation2=Nation.new(options2)
option3={'nation'=>'germany', 'point'=>0}
@nation3=Nation.new(option3)



@event1=Event.new({'event'=>'bike','day'=>30,'month'=>"March",'type'=>"single"})


@athlete=Athlete.new({'name'=>'Rossi','event_id'=>@event1.id,'nation_id'=>@nation.id})  
@athlete2=Athlete.new({'name'=>"Gigi",'event_id'=>@event1.id,'nation_id'=>@nation2.id})
@athlete3=Athlete.new({'name'=>"fufu",'event_id'=>@event1.id,'nation_id'=>@nation3.id})


@medal=Medal.new({'gold_medal_athlete'=>@athlete2.id,'silver_medal_athlete'=>@athlete.id,'bronze_medal_athlete'=>@athlete3.id})






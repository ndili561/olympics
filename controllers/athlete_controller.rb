require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require_relative('../models/nation.rb')



get '/athletes' do
  @athlete=Athlete.all
  erb :'athletes/index'
end


get '/athletes/new' do
  @event= Event.all()
  @nation = Nation.all()
  erb :'athletes/new'
end

post '/athletes' do
  @athlete=Athlete.new(params)
  @athlete.save()
  erb :'athletes/confirm'
end




require_relative('../models/athlete.rb')
require_relative('../models/event.rb')
require_relative('../models/nation.rb')
require_relative('../models/medals.rb')



get '/medals' do
  @event=Event.all
  @athlete=Athlete.all
  erb :'medals/medals'
end



post '/medals' do
  @medal=Medal.new(params)
  @medal.save()
  @medal2=Medal.update_medal(@medal)
  erb :'medals/ranking'
end


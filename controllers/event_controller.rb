require_relative('../models/event.rb')



get "/events/search" do
  query = params[:search]
  @events = Event.all(query)
  erb :'events/index'
end

get '/events' do
 query = params[:search]
 @events = Event.all(query)
 erb :'events/index'
end



get '/events/new' do
  erb :'events/new'
end



post '/event' do
  @event=Event.new(params)
  @event.save()
  erb :'events/create'
end



get '/events/:id' do
 @event=Event.find(params[:id])
 erb :'events/show'
end


get '/events/:id/edit' do
 @event=Event.find(params[:id])
 erb :'events/edit'
end

put '/events/:id' do
  @event=Event.update(params)
  redirect to ("/events/#{params[:id]}")
end


get '/events/:id/delete' do
  @event=Event.delete(params[:id])
  erb :'events/confirmation'

end


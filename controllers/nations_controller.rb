require_relative('../models/nation.rb')


get "/nations/search" do
  query = params[:search]
  @nations = Nation.all(query)
  erb :'nations/index'
end


get '/nations' do
 query = params[:search]
 @nations = Nation.all(query)
 erb :'nations/index'
end


get '/nations/new' do
  erb :'nations/new'
end

#interaction with data persistence
post '/nation' do
  @nation=Nation.new(params)
  @nation.save()
  query = params[:search]
  @nations = Nation.all(query)
  erb :'nations/create'
end


get '/nations/:id' do
 @nation=Nation.find(params[:id])
 erb :'nations/show'
end


get '/nations/:id/edit' do
 @nation=Nation.find(params[:id])
 erb :'nations/edit'
end

put '/nations/:id' do
@nation=Nation.update(params)
redirect to ("/nations/#{params[:id]}")
end

get'/nations/:id/delete' do
  @nation=Nation.delete(params[:id])
erb :'nations/confirmation'
end












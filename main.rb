require( 'sinatra' )
require('pry-byebug')
require_relative('controllers/athlete_controller')
require_relative('controllers/event_controller')
require_relative('controllers/medals_controller')
require_relative('controllers/nations_controller')
require 'json'

get '/' do
  erb :home
end

get '/toJSON' do
 @nation = Nation.json();
 @nation.to_a
 content_type :json
 @nation.to_a.to_json
end
require( 'sinatra' )
require_relative('controllers/athlete_controller')
require_relative('controllers/event_controller')
require_relative('controllers/medals_controller')
require_relative('controllers/nations_controller')

get '/' do
  erb :home
end
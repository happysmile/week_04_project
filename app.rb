require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( './models/continent.rb' )
require_relative( './models/country.rb' )
require_relative( './models/location.rb' )
require_relative( './models/sight_type.rb' )
require_relative( './models/sight.rb' )
require_relative('./controllers/continents_controller.rb')
require_relative('./controllers/countries_controller.rb')
require_relative('./controllers/locations_controller.rb')
require_relative('./controllers/sights_controller.rb')
also_reload('./models/*')

get '/' do
  erb( :index )
end

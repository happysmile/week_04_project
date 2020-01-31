require_relative( "../models/city.rb" )
require_relative( "../models/continent.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/sight_type.rb" )
require_relative( "../models/sight.rb" )
require("pry")

# create continents
europe = Continent.new({
  'name' => 'Europe'
})
europe.save()

asia = Continent.new({
  'name' => 'Asia'
})
asia.save()

oceania = Continent.new({
  'name' => 'Oceania'
})
oceania.save()

africa = Continent.new({
  'name' => 'Africa'
})
africa.save()

americas = Continent.new({
  'name' => 'Americas'
})
americas.save()

antarctica = Continent.new({
  'name' => 'Antarctica'
})
antarctica.save()






binding.pry
nil

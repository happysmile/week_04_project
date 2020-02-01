require_relative( "../models/location.rb" )
require_relative( "../models/continent.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/sight_type.rb" )
require_relative( "../models/sight.rb" )
require("pry")

# # create continents
# europe = Continent.new({
#   'name' => 'Europe'
# })
# europe.save()
#
# asia = Continent.new({
#   'name' => 'Asia'
# })
# asia.save()
#
# oceania = Continent.new({
#   'name' => 'Oceania'
# })
# oceania.save()
#
# africa = Continent.new({
#   'name' => 'Africa'
# })
# africa.save()
#
# americas = Continent.new({
#   'name' => 'Americas'
# })
# americas.save()
#
# antarctica = Continent.new({
#   'name' => 'Antarctica'
# })
# antarctica.save()
#

# Locations

rome = Location.new({
  'name' => 'Rome',
  'location_type' => 'city',
  'country_id' => '110',
  'visited' => false
})
rome.save()
florence = Location.new({
  'name' => 'Florence',
  'location_type' => 'city',
  'country_id' => '110',
  'visited' => true
})
trentino = Location.new({
  'name' => 'Trentino',
  'location_type' => 'region',
  'country_id' => '110',
  'visited' => false
})
trentino.save()
seoul = Location.new({
  'name' => 'Seoul',
  'location_type' => 'city',
  'country_id' => '119',
  'visited' => false
})
seoul.save()
tokyo = Location.new({
  'name' => 'Tokyo',
  'location_type' => 'city',
  'country_id' => '112',
  'visited' => false
})
tokyo.save()
paris = Location.new({
  'name' => 'Paris',
  'location_type' => 'city',
  'country_id' => '77',
  'visited' => false
})
paris.save()

# sight type
monument = SightType.new({
  'name' => 'monument'
})
monument.save()
museum = SightType.new({
  'name' => 'museum'
})
museum.save()
national_park = SightType.new({
  'name' => 'national park'
})
national_park.save()
nature = SightType.new({
  'name' => 'nature'
})
nature.save()
shopping = SightType.new({
  'name' => 'shopping'
})
shopping.save()
culture = SightType.new({
  'name' => 'culture'
})
culture.save()
food = SightType.new({
  'name' => 'food'
})
food.save()

# sights

tour_eiffel = Sight.new({
  'name' => 'Tour Eiffel',
  'location_id' => '5',
  'type_id' => '1'
})
tour_eiffel.save()





binding.pry
nil

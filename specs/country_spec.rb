require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../models/continent.rb' )
require_relative( '../models/country.rb' )
require_relative( '../models/location.rb' )
require_relative( '../models/sight.rb' )

class TestCountry < MiniTest::Test

  def setup()
    @europe = Continent.find_by_id(1)
    @antarctica = Continent.find_by_id(6)
  end

  def test_country_all
    assert_equal(247, Country.list_all().count())
  end

  def test_country_find_by
    assert_equal("Italy", Country.find_by("name", "Italy").name)
  end



end

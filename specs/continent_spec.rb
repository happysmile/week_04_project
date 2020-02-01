require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../models/continent.rb' )
require_relative( '../models/country.rb' )

class TestContinent < MiniTest::Test

  def setup()
    @europe = Continent.find_by_id(1)
    @antarctica = Continent.find_by_id(6)
  end

  def test_continent_name
    assert_equal(@europe.name, "Europe")
  end

  def test_continent_list_all
    assert_equal(6, Continent.list_all().count())
  end

  def test_countries()
    assert_equal(5, @antarctica.countries().count())
  end

end

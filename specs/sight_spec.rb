require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../models/continent.rb' )
require_relative( '../models/country.rb' )
require_relative( '../models/location.rb' )
require_relative( '../models/sight.rb' )
require_relative( '../models/sight_type.rb' )

class TestSight < MiniTest::Test

  def setup()
    @sight1 = Sight.new({
      'name' => 'Test Sight 1',
      'location_id' => '1',
      'type_id' => '1',
      'priority' => '2',
      'visited' => false
    })
    @sight2 = Sight.new({
      'name' => 'Test Sight 2',
      'location_id' => '1',
      'type_id' => '1',
      'priority' => '2',
      'visited' => true
    })
    @monument = SightType.new('name' => 'monument')
  end

  def test_sight_name()
    assert_equal("Test Sight 1", @sight1.name)
  end

  def test_sight_location_id()
    assert_equal("1", @sight1.location_id)
  end

  def test_sight_type_id()
    assert_equal("1", @sight1.type_id)
  end

  def test_sight_priority()
    assert_equal("2", @sight1.priority)
  end

  # TO DO! FIND OUT WHY NIL AND NOT FALSE
  def test_sight_visited_false()
    assert_equal(false, @sight1.visited)
  end

  def test_sight_visited_true()
    assert_equal(true, @sight2.visited)
  end

  def test_sight_continent()
    assert_equal("Europe", @sight1.continent().name)
    assert_equal("Europe", @sight2.continent().name)
  end

  def test_sight_country()
    assert_equal("Italy", @sight1.country().name)
    assert_equal("Italy", @sight2.country().name)
  end

  def test_sight_location()
    assert_equal("Rome", @sight1.location().name)
    assert_equal("Rome", @sight2.location().name)
  end

  def test_type()
    assert_equal("monument", @sight1.type().name)
  end


end

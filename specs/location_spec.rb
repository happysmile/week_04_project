require( 'minitest/autorun' )
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative( '../models/continent.rb' )
require_relative( '../models/country.rb' )
require_relative( '../models/location.rb' )
require_relative( '../models/sight.rb' )

class TestLocation < MiniTest::Test

  def setup()

  end

end

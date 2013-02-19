require 'test_helper'

class HeliosTest < Test::Unit::TestCase
  def test_initiates_listener
    Helios::Listener.expects(:listen!)    
    require 'helios/listen'
  end
end

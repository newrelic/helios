require 'test_helper'
require 'helios/dispatcher'

class Helios::DispatcherTest < Test::Unit::TestCase
  def setup
    message = <<-MESSAGE
    {
      "action": "foobar",
      "parameters": {
        "var1": true,
        "var2": "two",
        "var3": 3
      }
    }
    MESSAGE
    @dispatcher = Helios::Dispatcher.new(message)
  end

  def test_it_should_find_the_action
    assert_equal 'foobar', @dispatcher.action
  end

  def test_it_should_parse_parameters
    assert_equal({'var1' => true, 'var2' => 'two', 'var3' => 3},
                 @dispatcher.parameters)
  end

  def test_it_should_dispatch_to_dummy_class
    
  end
end

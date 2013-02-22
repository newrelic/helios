require 'test_helper'
require 'helios/dispatcher'

class Helios::DispatcherTest < Test::Unit::TestCase
  def setup
    message = <<-MESSAGE
    {
      "action": "dummy",
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
    assert_equal 'dummy', @dispatcher.action
  end

  def test_it_should_parse_parameters
    assert_equal({'var1' => true, 'var2' => 'two', 'var3' => 3},
                 @dispatcher.parameters)
  end

  def test_it_does_not_try_to_load_a_class_that_doesnt_exit
    message = <<-MESSAGE
    {
      "action": "foobar",
      "parameters": { }
    }
    MESSAGE
    dispatcher = Helios::Dispatcher.new(message)
    Helios.expects(:get_const).never
    assert_equal(nil, dispatcher.dispatch!)
  end

  def test_it_should_dispatch_to_dummy_class
    dummy_instance = @dispatcher.dispatch!

    assert dummy_instance.is_a?(Helios::DummyAction) 
  end

  def test_it_executes_the_action
    dummy = ::Helios::DummyAction.new({})
    dummy.expects(:execute)
    ::Helios::DummyAction.stubs(:new).returns(dummy)

    @dispatcher.dispatch!
  end
end

class Helios::DummyAction
  def initialize(params); end

  def execute; end
end

require 'spec_helper'

class Helios::TestEffect < Helios::Effect
  def change!
    set_light(0, [255, 255, 255])
    set_light(1, [255, 255, 255])
  end
end

describe Helios::TestEffect do
  WHITE = [255, 255, 255]
  BLACK = [0, 0, 0]

  it "sets the lights to all white" do
    fx = Helios::TestEffect.new
    lights = [BLACK, BLACK]
    fx.stub(:lights_class, lights) do
      fx.change!
    end
    assert_equal [WHITE, WHITE], lights
  end
end

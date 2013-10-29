module Helios
  class PulsingEffect < Effect
    class <<self
      attr_accessor :running_effect
    end

    def initialize(args)
      @lights = get_lights(args['lights'])
      @r = args['r']
      @g = args['g']
      @b = args['b']
      @multiplier = 0
      @enable = args['enable'] == 'true'
    end

    def change!
      if @enable && thread.nil?
        PulsingEffect.running_effect = Thread.new do
          loop do
            if @multiplier >= 1
              @multiplier -= 0.1
            else
              @multiplier += 0.1
            end

            Lights[@lights] = [@r * @multiplier, @g * @multiplier, @b * @multiplier]
            sleep 0.1
          end
        end
      else
        PulsingEffect.running_effect.kill
        PulsingEffect.running_effect = nil
      end
    end
  end
end

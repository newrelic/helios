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
      @enable = args['enable']
      PulsingEffect.running_effect ||= {}
    end

    def change!
      if @enable && PulsingEffect.running_effect[@lights].nil?
        PulsingEffect.running_effect[@lights] = Thread.new do
          loop do
            if Thread.current['darken']
              @multiplier -= 0.1
              if @multiplier <= 0
                Thread.current['darken'] = false
              end
            else
              @multiplier += 0.1
              if @multiplier >= 1
                Thread.current['darken'] = true
              end
            end
            r = (@r * @multiplier).to_i <= 255 ? (@r * @multiplier).to_i : 255
            r = (@g * @multiplier).to_i <= 255 ? (@r * @multiplier).to_i : 255
            r = (@b * @multiplier).to_i <= 255 ? (@r * @multiplier).to_i : 255

            Lights[@lights] = [r, g, b]
            sleep 0.1
          end
        end
      else
        PulsingEffect.running_effect[@lights].kill
        PulsingEffect.running_effect[@lights] = nil
      end
    end
  end
end

module Helios
  class RainbowEffect
    RED = [255,0,0]
    ORANGE = [255,127,0]
    YELLOW = [255,255,0]
    GREEN = [0,255,0]
    BLUE = [0,0,255]
    INDIGO = [75,0,130]
    VIOLET = [198,0,235]

    def initialize(args)
      @lights = get_lights(args['lights'])
    end

    def change!
      starting = [RED, ORANGE, YELLOW, GREEN, BLUE, INDIGO, VIOLET]
      @lights.last.times do
        colors = starting.dup

        @lights.each do |light|
          Lights[light] = colors.first
          colors.rotate!
        end

        starting.rotate!
        sleep 1
      end
    end

    private
    def get_lights(value)
      if value.is_a?(Array)
        # [0, '..', 512]
        if value[1] == '..'
          return (value[0].to_i..value[2].to_i)
        end
        return value.map(&:to_i)
      end
      return value
    end
  end
end

require 'rdmx'

module Helios
  class Lights
    TOTAL_LIGHTS = 70
    SOUTH_SIDE_MAX = 25

    class <<self
      def [](idx)
        if (0..30).include?(idx)
          south_dmx
        else
          north_dmx
        end
      end

      # Lights[3] = [255, 0, 0] =>
      #      south_dmx[6, 7, 8] = [255, 0, 0]
      def []=(idx, color_array)
        idx = ((idx - 1) * 3)
        if (1..SOUTH_SIDE_MAX).include?(idx)
          values = idx..(idx+2)
          south_dmx[values] = color_array 
        else
          idx = idx - SOUTH_SIDE_MAX
          values = idx..(idx+2)
          north_dmx[values] = color_array 
        end
      end

      def south_dmx
        # Reference to south DMX
        @south_dmx ||= Rdmx::Universe.new('/dev/ttyUSB0')
      end

      def north_dmx
        # Reference to north DMX
      end
    end
  end
end

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
        if idx.is_a? Range
          idx.to_a.each do |i|
            self[i] = color_array
          end
          return
        end
        if 1..SOUTH_SIDE_MAX.include?(idx)
          idx -= 1
          dmx = north_dmx
        else
          idx -= (SOUTH_SIDE_MAX + 1)
          dmx = south_dmx
        end

        range = idx..idx+2
        dmx[range] = color_array
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

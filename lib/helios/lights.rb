require 'rdmx'

module Helios
  class Lights
    TOTAL_LIGHTS = 50
    SOUTH_SIDE_MAX = 25

    class <<self
      def [](idx)
        if (0..SOUTH_SIDE_MAX).include?(idx)
          south_dmx[idx..idx+2]
        else
          idx -= SOUTH_SIDE_MAX
          north_dmx[idx..idx+2]
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
        if (1..SOUTH_SIDE_MAX).include?(idx)
          dmx = north_dmx
        else
          idx = idx - SOUTH_SIDE_MAX
          dmx = north_dmx
        end
        min_range = ((idx-1) * 3)
        range = min_range..(min_range+2)

        dmx[range] = color_array
      end

      def south_dmx
        # Reference to south DMX
      end

      def north_dmx
        # Reference to north DMX
        @north_dmx ||= Rdmx::Universe.new('/dev/ttyUSB0')
      end
    end
  end
end

module Helios
  class Lights
    TOTAL_LIGHTS = 70
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
        values = idx..(idx+2)
        if (1..30).include?(idx)
          south_dmx[values] = color_array 
        else
          north_dmx[values] = color_array 
        end
      end

      def south_dmx
        # Reference to south DMX
      end

      def north_dmx
        @north_dmx ||= Rdmx::Universe.new('/dev/ttyUSB0')
        # Reference to north DMX
      end
    end
  end
end

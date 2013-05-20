module Helios
  class Lights
    class <<self
      def [](idx)
        if (0..30).include?(idx)
          south_dmx
        else
          north_dmx
        end
      end

      def []=(idx, color_array)
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
        # Reference to north DMX
      end
    end
  end
end

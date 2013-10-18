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
      # @intermediary_count = 2
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

    # def build_rainbow
    #   basic = [RED, ORANGE, YELLOW, GREEN, BLUE, INDIGO, VIOLET]
    #   expanded = []

    #   basic.each_with_index do |color, index|
    #     expanded.push color
    #     next_color = basic[(index + 1) % basic.length]
    #     intermediary_colors = generate_intermediary_colors(color, next_color)

    #     expanded.push(intermediary_colors).flatten!
    #   end
    # end

    # def generate_intermediary_colors(color, next_color)
    #   r1, g1, b1 = color
    #   r2, g2, b2 = color

    #   colors = []

    #   @intermediary_count.times
    #     step = ((r1 - r2).abs / @intermediary_count)
    #     # r3 = 
    #   end
    # end

    # def change!
    #   @lights.each do |light|
    #     Lights[light] = [@red, @green, @blue]
    #   end
    # end

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

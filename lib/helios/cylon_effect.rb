module Helios
  class CylonEffect < Effect
    RED = [255,0,0]
    BLACK = [0,0,0]

    def initialize(args)
      lights = args.fetch('lights', [1, '..', 25])
      @lights = get_lights(lights)
    end

    def change!
      starting = [RED, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK, BLACK]
      @lights.last.times do
        colors = starting

        @lights.to_a.reverse.each do |light|
          Lights[light] = colors.last
          colors.rotate!
        end
        @lights.to_a.reverse.each do |light|
          Lights[light] = colors.last
          colors.rotate!(-1)
        end

        starting.rotate!
        sleep 1
      end
    end
  end
end


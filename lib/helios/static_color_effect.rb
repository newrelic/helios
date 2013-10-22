module Helios
  class StaticColorEffect < Effect
    def initialize(args)
      @red = args['r'].to_i
      @green = args['g'].to_i
      @blue = args['b'].to_i
      lights = args.fetch('lights', [1, '..', 25])
      @lights = get_lights(lights)
    end

    def change!
      @lights = Array(@lights)
      t = []
      @lights.each do |light|
        t << Thread.new do
          set_light(light, [@red, @green, @blue])
        end
      end
      t.map(&:join)
    end
  end
end

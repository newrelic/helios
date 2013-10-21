module Helios
  class FlickerEffect < Effect
    def initialize(args)
      @red = args['r'].to_i
      @green = args['g'].to_i
      @blue = args['b'].to_i
      @iterations = args['iterations']
      @interval = args.fetch('interval', 0.05)
      lights = args.fetch('lights', [1, '..', 25])
      @lights = get_lights(lights)
    end

    def change!
      old_color = Lights[50]

      @iterations.times do
        set_lights([@red, @green, @blue])
        set_lights(old_color)
      end
    end

    def set_lights(color)
      @lights.each do |light|
        Lights[light] = color
        sleep @interval
      end
    end
  end
end

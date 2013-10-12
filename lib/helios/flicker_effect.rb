module Helios
  class FlickerEffect
    def initialize(args)
      @red = args['r'].to_i
      @green = args['g'].to_i
      @blue = args['b'].to_i
      @iterations = args['iterations']
      @interval = args.fetch('interval', 0.05)
      @lights = get_lights(args['lights'])
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

module Helios
  class TimedStaticColorEffect
    def initialize(args)
      @red = args['r'].to_i
      @green = args['g'].to_i
      @blue = args['b'].to_i
      @interval = args['interval']
      @lights = get_lights(args['lights'])
    end

    def change!
      @lights.each do |light|
        Lights[light] = [@red, @green, @blue]
        wait @interval
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

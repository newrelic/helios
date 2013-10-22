module Helios
  class Effect
    def change!
      raise NotImplementedError("Effects must implement #change! method")
    end

    def set_light(index, value)
      lights_class[index] = value
    end

    def set_lights(values)
      threads = []
      values.each_with_index do |value, index|
        threads << Thread.new do
          lights_class[index] = value
        end
        threads.map(&:join)
      end
    end

    protected
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

    def lights_class
      Lights
    end
  end
end

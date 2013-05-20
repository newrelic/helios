module Helios
  class Dispatcher
    attr_reader :effect_class, :arguments

    def initialize(message)
      @message = message
      @effect_class = @message['effect'] + 'Effect'
      @effect_class = @effect_class[0].upcase + @effect_class[1..-1]
      @effect_class = Object.const_get(@effect_class)
      @arguments = message['args']
    end

    def dispatch!
      self.effect_class.new(self.arguments).change!
    end
  end
end

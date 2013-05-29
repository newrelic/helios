module Helios
	class MassPanicEffect
	  def initialize(args)
	      @red = args['r'].to_i
	      @green = args['g'].to_i
	      @blue = args['b'].to_i
	      @freq = args['freq'].to_i
	      # @lights = get_lights(args['lights'])
      end

      def change!
      	@lights.each do |light|
        Lights[light] = [@red, @green, @blue]
        Lights::TOTAL_LIGHTS # => 70
      end

      private
      def create_comet()
      	

  	  end
    
	end	
end
require 'json'

module Helios
  class Dispatcher
    attr_reader :action, :parameters

    def initialize(json_message)
      Logger.instance.debug("Parsing JSON")
      @message = JSON.parse(json_message)      
      Logger.instance.debug("JSON parsed")
      @action = @message["action"]
      @parameters = @message["parameters"]
    end

    def dispatch!
    end
  end
end

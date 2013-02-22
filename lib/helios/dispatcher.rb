require 'json'

module Helios
  class Dispatcher
    attr_reader :action, :parameters

    def initialize(json_message)
      Logger.instance.debug("Parsing JSON")
      @message = JSON.parse(json_message)      
      Logger.instance.debug("JSON parsed")
      @action = @message["action"]
      @action_classname = @action[0].upcase + @action[1..-1] + "Action"
      @parameters = @message["parameters"]
    end

    def dispatch!
      if Helios.const_defined?(@action_classname)
        action_class = Helios.const_get(@action_classname)
      else
        Logger.instance.warn("Action class #{@action_classname} not found. Ignoring action: #{@action}")
        return nil
      end

      action_instance = action_class.new(@parameters)

      if @parameters
      else
        Logger.instance.warnd("Parameters could not be loaded. Ignoring action: #{@action}")
        return nil
      end

      action_instance.execute

      action_instance
    end
  end
end

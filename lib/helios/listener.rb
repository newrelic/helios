module Helios
  class Listener
    def initialize(aws = nil)
      @aws ||= (aws || AWS::SQS.new)
    end

    def listen!
      @aws.queues.named('helios').poll do |message|
        message = JSON.parse(message)
        Dispatcher.new(message).dispatch!
      end
    end
  end
end

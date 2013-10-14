module Helios
  class Listener
    def initialize(aws = nil)
      @aws ||= (aws || AWS::SQS.new)
    end

    def listen!
      @aws.queues.named('helios').poll do |message|
        begin
          puts "Received message:"
          puts "\t#{message.body}"
          message = JSON.parse(message.body)
          Dispatcher.new(message).dispatch!
        rescue Exception => ex
          puts "ERROR: #{ex.message}"
          puts ex.backtrace.join("\n")
        end
      end
    end
  end
end

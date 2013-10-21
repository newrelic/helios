module Helios
  class Listener
    def initialize(aws = nil)
      @aws ||= (aws || AWS::SQS.new)
    end

    def listen!
      puts "Beginning polling..."
      @aws.queues.named('helios').poll do |message|
        effect_start = Time.now
        effect_thread = Thread.new do
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

        loop do
          break unless effect_thread.alive?
          sleep 0.001
          if Time.now > (effect_start + 10)
            effect_thread.kill
          end
        end
      end
    end
  end
end

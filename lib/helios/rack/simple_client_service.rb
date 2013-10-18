require 'aws-sdk'

module Helios::Rack
  class SimpleClientService
    def self.call(env)
      begin
        json = env['rack.input'].read
        sqs = AWS::SQS.new(access_key_id: ENV['AWS_ACCESS_KEY'], secret_access_key: ENV['AWS_SECRET_KEY'])
        sqs.queues.create('helios').send_message(json)
        [200, {'Content-Type' => 'text/plain'}, ["Sent to SQS\n"]]
      rescue Exception => ex
        [500, {'Content-Type' => 'text/plain'}, ["There was an error\n", ex.message, "\n"]]
      end
    end
  end
end

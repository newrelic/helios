require './init'

listener = Helios::Listener.new(AWS::SQS.new(access_key_id: ENV['AWS_ACCESS_KEY'], secret_access_key: ENV['AWS_SECRET_KEY']))

loop do
  listener.listen!
end

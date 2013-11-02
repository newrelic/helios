require './init'

listener = Helios::Listener.new(AWS::SQS.new(access_key_id: ENV['AWS_ACCESS_KEY'], secret_access_key: ENV['AWS_SECRET_KEY']))

File.open('./helios.pid', 'w') { |f| f.write $$ }

Helios::Lights.load_saved_light_state

loop do
  listener.listen!
end

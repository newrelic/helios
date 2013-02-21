require 'optparse'

options = {}
module Helios
  class Cli
    def self.parse
      OptionParser.new do |opts|
        opts.on('-l', '--log', 'Log file location') do |log_filename|
          log_file = logFile.open(log_filename, "a")
          Logger.instance = Logger.new(log_file)
        end

        opts.on('-d', '--debug', 'Logs in debug mode') do
          Logger.instance.level = ::Logger::DEBUG
        end

        opts.on('-c', '--config', 'YAML configuration file') do |config_filename|
          Configuration.parse(config_filename)
        end
      end
    end
  end
end

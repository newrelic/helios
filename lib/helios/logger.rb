module Helios
  class Logger
    def self.instance
      @logger ||= if ENV['HELIOS_PRODUCTION']
                    Logger.new(STDOUT)
                  else
                    Logger::Syslog.new('helios', Syslog::LOG_LOCAL7)
                  end
    end
  end
end

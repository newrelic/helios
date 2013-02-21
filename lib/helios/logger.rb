module Helios
  class Logger
    def self.instance
      @instance ||= ::Logger.new(STDOUT).tap {|l| l.level = ::Logger::INFO}
    end

    def self.instance=(val)
      @instance = val
    end
  end
end

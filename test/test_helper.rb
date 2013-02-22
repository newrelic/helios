require 'test/unit'
require 'mocha/setup'
require 'helios'

Helios::Logger.instance = Logger.new('/dev/null')

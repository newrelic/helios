require 'simplecov'
require 'minitest/spec'
require 'minitest/autorun'
require 'mocha'
unless ENV['DISABLE_COVERAGE']
  SimpleCov.start do
    add_filter '/spec/'
  end
end

require 'helios'

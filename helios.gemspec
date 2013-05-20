# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'helios/version'

Gem::Specification.new do |spec|
  spec.name          = "helios"
  spec.version       = Helios::VERSION
  spec.authors       = ["Jesse Dearing"]
  spec.email         = ["jdearing@newrelic.com"]
  spec.description   = %q{Helios controls the lights in the New Relic office}
  spec.summary       = %q{Helios controls the lights in the New Relic office}
  spec.homepage      = ""
  spec.license       = "Proprietary"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'mocha' 
end

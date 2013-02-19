require "bundler/gem_tasks"

task :default => :test

task :test do
  $LOAD_PATH.unshift('test')
  $LOAD_PATH.unshift('lib')
  Dir.glob('./test/**/*_test.rb').each do |test|
    require test[0..-4]
  end
end

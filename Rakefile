require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  ENV["RUBYOPT"] = "-w"
  t.pattern      = "test/**/*_test.rb"
  t.libs         << "test"
end
task :default => :test

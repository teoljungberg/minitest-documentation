require 'minitest/documentation'

module Minitest
  def self.plugin_documentation_init options
    io = options.delete(:io) || $stdout
    self.reporter.reporters.reject! {|o| o.is_a? ProgressReporter }
    self.reporter.reporters << DocumentationReporter.new(io, options)
  end
end

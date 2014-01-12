require 'minitest/documentation'

module Minitest
  def self.plugin_documentation_options opts, options
    opts.on "--documentation", "Documentation formatter" do
      DocumentationReporter.documentation!
    end
  end

  def self.plugin_documentation_init options
    return unless DocumentationReporter.documentation?

    io = options.delete(:io) || $stdout
    self.reporter.reporters.reject! {|o| o.is_a? ProgressReporter }
    self.reporter.reporters << DocumentationReporter.new(io, options)
  end
end

require 'minitest'

module Minitest
  def self.plugin_documentation_options opts, options
    opts.on "--documentation", "Documentation formatter" do
      Documentation.documentation!
    end
  end

  def self.plugin_documentation_init options
    if Documentation.documentation?
      io = options.fetch(:io, $stdout)
      self.reporter.reporters.reject! {|o| o.is_a? ProgressReporter }
      self.reporter.reporters << Documentation.new(io, options)
    end
  end

  class Documentation < Reporter
    INDENT = "  "

    def self.documentation!
      @documentation = true
    end

    def self.documentation?
      @documentation ||= false
    end

    def record result
      format_test_klass result

      io.print INDENT
      io.puts format_test_name(result)
    end

    private

    def format_test_klass klass
      @klass ||= ""
      if klass.class != @klass
        @klass = klass.class
        io.puts @klass
      end
    end

    def test_name o
      o.instance_variable_get "@NAME"
    end

    def format_test_name test
      test_name(test).
        sub("test_", "").
        gsub("_", " ")
    end
  end
end

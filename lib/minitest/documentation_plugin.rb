require 'minitest'

module Minitest
  def self.plugin_documentation_options opts, options
    opts.on "--documentation", "Documentation formatter" do
      Documentation.documentation!
    end

    opts.on "--color", "Colorize the output" do
      Documentation.color!
    end
  end

  def self.plugin_documentation_init options
    if Documentation.documentation? || Documentation.color?
      io = options.delete(:io) || $stdout
      self.reporter.reporters.reject! {|o| o.is_a? ProgressReporter }
      self.reporter.reporters << Documentation.new(io, options)
    end
  end

  class Documentation < Reporter
    ESC    = "\e["
    NND    = "#{ESC}0m"
    GREEN  = "#{ESC}32m"
    RED    = "#{ESC}31m"
    YELLOW = "#{ESC}33m"

    def self.documentation!
      @documentation = true
    end

    def self.documentation?
      @documentation ||= false
    end

    def self.color!
      @color = true
    end

    def self.color?
      @color ||= false
    end

    def record result
      output_klass_name result.class if self.class.documentation?
      print_colorized_progress result if self.class.color?

      if self.class.documentation?
        test = test_name result
        io.print "  "
        io.puts stringify_test_name(test)
      end
      io.print NND if self.class.color?
    end

    private

    def color_code result
      color_code = case result.result_code
                   when "."
                     GREEN
                   when "E", "F"
                     RED
                   when "S"
                     YELLOW
                   end
      color_code
    end

    def print_colorized_progress result
      io.print color_code(result)
      io.print result.result_code unless self.class.documentation?
    end

    def output_klass_name k
      @klass ||= ""
      if k != @klass
        @klass = k
        io.puts @klass
      end
    end

    def test_name o
      o.instance_variable_get "@NAME"
    end

    def stringify_test_name test
      test.
        sub("test_", "").
        gsub("_", " ")
    end
  end
end

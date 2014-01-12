module Minitest
  class DocumentationReporter < Reporter
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

    def record result
      color_code = case result.result_code
                   when "."
                     GREEN
                   when "E", "F"
                     RED
                   when "S"
                     YELLOW
                   end

      output_klass_name result.class
      test = test_name result

      io.print color_code
      io.print "  "
      io.puts test.
        sub("test_", "").
        gsub("_", " ")
      io.print NND
    end

    private
    attr_accessor :klass

    def output_klass_name k
      if k != klass
        self.klass = k
        io.puts klass
      end
    end

    def test_name o
      o.instance_variable_get "@NAME"
    end
  end
end

require_relative 'test_case'
require 'minitest/documentation'

module Minitest
  class DocumentationFormatTest < TestCase
    def setup
      Documentation.documentation!
      ExampleTest.generate_tests!
      self.reporter = Documentation.new StringIO.new("")
    end
    attr_accessor :reporter

    def test_documentation_format
      ExampleTest.run reporter

      exp_format = <<-EOS
Minitest::TestCase::ExampleTest
  fail
  pass
  skip
      EOS

      assert_equal exp_format, reporter.io.string
    end
  end
end

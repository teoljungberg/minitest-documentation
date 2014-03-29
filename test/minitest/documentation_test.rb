require 'minitest/autorun'
require 'stringio'
require 'minitest/documentation'

module Minitest
  ExampleTest = Class.new(Test) {
    i_suck_and_my_tests_are_order_dependent!
    def self.generate_tests!
      define_method(:test_pass) { assert 'truthy' }
      define_method(:test_fail) { refute 'truthy' }
      define_method(:test_skip) { skip   'le skip' }
    end
  }

  class DocumentationFormatTest < Minitest::Test
    def setup
      DocumentationReporter.documentation!
      ExampleTest.generate_tests!
      self.reporter = DocumentationReporter.new StringIO.new("")
    end
    attr_accessor :reporter

    def test_documentation_format
      ExampleTest.run reporter

      exp_format = <<-EOS
Minitest::ExampleTest
  fail
  pass
  skip
      EOS

      assert_equal exp_format, reporter.io.string
    end
  end
end

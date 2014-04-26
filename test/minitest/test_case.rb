require 'minitest/autorun'
require 'stringio'

module Minitest
  class TestCase < Test
    ExampleTest = Class.new(Test) {
      i_suck_and_my_tests_are_order_dependent!

      def self.generate_tests!
        define_method(:test_pass)                 { assert 'truthy' }
        define_method(:test_verbosity)            { assert 'truthy' }
        define_method(:test_a_very_long_sentence) { assert 'truthy' }
      end
    }
  end
end

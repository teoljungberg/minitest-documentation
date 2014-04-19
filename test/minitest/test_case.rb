require 'minitest/autorun'
require 'stringio'

module Minitest
  class TestCase < Minitest::Test
    ExampleTest = Class.new(Test) {
      i_suck_and_my_tests_are_order_dependent!
      def self.generate_tests!
        define_method(:test_pass) { assert 'truthy' }
        define_method(:test_fail) { refute 'truthy' }
        define_method(:test_skip) { skip   'le skip' }
      end
    }
  end
end

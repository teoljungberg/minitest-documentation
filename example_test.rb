require 'minitest/autorun'

class ExampleTest < Minitest::Test
  def test_pass
    pass
  end

  def test_flunk
    flunk
  end

  def test_skip
    skip
  end
end

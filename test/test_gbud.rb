require 'minitest/autorun'
require 'gbud'

class GbudTest < Minitest::Test
  def test_gbud
    assert_equal "hello world",
      Hola.hi("english")
  end
end
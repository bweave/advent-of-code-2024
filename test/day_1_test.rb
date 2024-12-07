require_relative "test_helper"
require_relative "../day_1"

class Day1Test < Minitest::Test
  def setup
    @input = <<~INPUT
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
    INPUT
  end

  test "total_diff" do
    expected = 11
    actual = Day1.new(@input).total_diff

    assert_equal expected, actual
  end

  test "similarity_score" do
    expected = 31
    actual = Day1.new(@input).similarity_score

    assert_equal expected, actual
  end
end

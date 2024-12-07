require_relative "test_helper"
require_relative "../day_2"

class Day2Test < Minitest::Test
  def setup
    @input = <<~INPUT
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
    INPUT
  end

  test "safe reports" do
    expected = 2
    actual = Day2.new(@input).safe_reports_count

    assert_equal expected, actual
  end

  test "dampened safe reports" do
    expected = 4
    actual = Day2.new(@input).dampened_safe_reports_count

    assert_equal expected, actual
  end
end

require_relative "test_helper"
require_relative "../day_3"

class Day3Test < Minitest::Test
  test "calculate_all_operations" do
    input =
      "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    expected = 161
    actual = Day3.new(input).calculate_all_operations

    assert_equal expected, actual
  end

  test "calculate_enabled_operations" do
    input =
      "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    expected = 48
    actual = Day3.new(input).calculate_enabled_operations

    assert_equal expected, actual
  end
end

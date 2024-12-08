class Day3
  def initialize(input)
    @input = input
  end

  def calculate_all_operations
    input.scan(all_operations_regex).map { |a, b| a.to_i * b.to_i }.sum
  end

  def calculate_enabled_operations
    enabled = true
    input
      .scan(enabled_operations_regex)
      .reduce(0) do |sum, (x, y, do_op, dont_op)|
        enabled = true if do_op
        enabled = false if dont_op
        sum + (enabled && x && y ? x.to_i * y.to_i : 0)
      end
  end

  private

  attr_reader :input

  def all_operations_regex
    # capture mul(a,b) where a and b are 1-3 digits
    /mul\((\d{1,3}),(\d{1,3})\)/
  end

  def enabled_operations_regex
    # capture mul(a,b) where a and b are 1-3 digits or do() or don't()
    /mul\((\d{1,3}),(\d{1,3})\)|(do\(\))|(don't\(\))/
  end
end

unless ENV["ENV"] == "test"
  input = File.read("day_3_input.txt")
  day3 = Day3.new(input)
  pp "D3P1: #{day3.calculate_all_operations}"
  pp "D3P2: #{day3.calculate_enabled_operations}"
end

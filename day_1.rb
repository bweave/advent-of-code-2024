class Day1
  def initialize(input)
    @col1 = []
    @col2 = []
    input.each_line do |line|
      first, second = line.split
      col1 << first.to_i
      col2 << second.to_i
    end

    col1.sort!
    col2.sort!
  end

  def total_diff
    col1.each_with_index.map { |num, i| (num - col2[i]).abs }.sum
  end

  def similarity_score
    col1
      .map do |num|
        occurrences = col2.count { |num2| num2 == num }
        num * occurrences
      end
      .sum
  end

  private

  attr_reader :col1, :col2
end

unless ENV["ENV"] == "test"
  input = File.read("day_1_input.txt")
  day1 = Day1.new(input)
  pp "D1P1: #{day1.total_diff}"
  pp "D1P2: #{day1.similarity_score}"
end

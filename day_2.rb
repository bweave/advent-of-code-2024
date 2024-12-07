class Day2
  def initialize(input)
    @reports = input.split("\n")
  end

  def safe_reports_count
    reports.count do |line|
      levels = line.split.map(&:to_i)
      safe_report?(levels)
    end
  end

  def dampened_safe_reports_count
    reports.count do |line|
      levels = line.split.map(&:to_i)
      dampened_safe_report?(levels)
    end
  end

  private

  attr_reader :reports

  def safe_report?(levels)
    direction = levels[0] > levels[1] ? :> : :<
    levels
      .each_cons(2)
      .all? { |a, b| a.public_send(direction, b) && (a - b).abs.between?(1, 3) }
  end

  def dampened_safe_report?(levels)
    return true if safe_report?(levels)

    levels.each_with_index.any? do |_num, i|
      new_levels = levels.dup
      new_levels.delete_at(i)
      safe_report?(new_levels)
    end
  end
end

unless ENV["ENV"] == "test"
  input = File.read("day_2_input.txt")
  day2 = Day2.new(input)
  pp "D2P1: #{day2.safe_reports_count}"
  pp "D2P2: #{day2.dampened_safe_reports_count}"
end

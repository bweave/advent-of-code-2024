require "thor"

class AocTasks < Thor
  desc "setup", "sets up a new day's puzzle"
  option :day, required: true, type: :numeric
  def setup
    options => { day: }
    download_puzzle_input(day)
    create_solution_file(day)
    create_test_file(day)
  end

  private

  def download_puzzle_input(day)
    say "Gonna set up day #{day}!"
    puzzle_input = AocApi.new.download_puzzle_input(day)
    File.write("day_#{day}_input.txt", puzzle_input)
  end

  def create_solution_file(day)
    File.write("day_#{day}.rb", <<~RUBY)
      class Day#{day}
        def initialize(input)
          @input = input
        end

        private

        attr_reader :input
      end

      unless ENV["ENV"] == "test"
        input = File.read("day_#{day}_input.txt")
        day#{day} = Day#{day}.new(input)
        pp "D#{day}P1: TDOO"
        pp "D#{day}P2: TODO"
      end
    RUBY
  end

  def create_test_file(day)
    File.write("test/day_#{day}_test.rb", <<~RUBY)
      require_relative "test_helper"
      require_relative "../day_#{day}"

      class Day#{day}Test < Minitest::Test
        def setup
          @input = <<~INPUT
            TODO
          INPUT
        end

        test "wat it do" do
          assert true
        end
      end
    RUBY
  end
end

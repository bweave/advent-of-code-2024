require "httparty"

class AocApi
  include HTTParty
  base_uri "https://adventofcode.com"
  # TODO: Put this in a config file
  headers "Cookie" => "session=#{ENV["AOC_SESSION_COOKIE"]}"

  def download_puzzle_input(day)
    self.class.get("/2024/day/#{day}/input")
  end
end

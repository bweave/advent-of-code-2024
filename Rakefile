require "date"
require "dotenv/load"
require_relative "./lib/aoc_api"
require_relative "./lib/aoc_tasks"

desc "Run tests, optionally specifying a day"
task :test, %i[day] do |_, args|
  args.with_defaults(day: :all) => { day: }

  if day == :all
    FileList["test/*_test.rb"].each { |test| require_relative test }
  else
    require_relative "test/day_#{day}_test.rb"
  end
end

desc "Watch for changes and run tests, optionally specifying a day"
task :watch, %i[day] do |_t, args|
  args.with_defaults(day: :all) => { day: }

  if day == :all
    sh "bundle exec rerun -bcx --no-notify -- rake"
  else
    sh "bundle exec rerun -bcx --no-notify -- rake test[#{day}]"
  end
end

desc "Output answers, optionally specifying a day"
task :answers, %i[day] do |_t, args|
  args.with_defaults(day: :all) => { day: }

  if day == :all
    FileList["day_*.rb"].each { |solution| require_relative solution }
  else
    require_relative "day_#{day}.rb"
  end
end

desc "Set up the day's puzzle"
task :setup, %i[day] do |_t, args|
  args.with_defaults(day: Date.today.day) => { day: }
  AocTasks.new.invoke(:setup, [], day: day)
end

desc "Default: Run tests"
task default: %i[test]

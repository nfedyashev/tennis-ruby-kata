$LOAD_PATH.unshift File.expand_path(".", "lib")

require 'pry' if defined?(Pry)
require 'highline'

require 'tennis_scoring_system'

system = TennisScoringSystem.new
cli = HighLine.new

loop do
  player_number = cli.ask("Who won the point? Player # ?", Integer) { |q| q.in = 1..2 }

  system.point_won_by player_number

  puts system.score
  if system.game_is_over?
    puts "Game is over"
    break
  end
end

# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('.', 'lib')

require 'pry' if defined?(Pry)
require 'highline'

require 'tennis_scoring_system'

system = TennisScoringSystem.new
cli = HighLine.new

player1 = Player.new(name: cli.ask("What's the name of Player #1?") { |q| q.default = 'Player #1' })
system.add_player(player1)

player2 = Player.new(name: cli.ask("What's the name of Player #2?") { |q| q.default = 'Player #2' })
system.add_player(player2)

loop do
  puts
  cli.choose do |menu|
    menu.prompt = 'Who won the point?  '

    menu.choice(player1.name) { system.point_won_by player1 }
    menu.choice(player2.name) { system.point_won_by player2 }
  end

  puts system.score
  if system.game_is_over?
    puts 'Game is over'
    break
  end
end

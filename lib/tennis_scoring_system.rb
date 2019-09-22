# frozen_string_literal: true

require 'terminal-table'
require 'player'

class TennisScoringSystem
  def initialize
    @players = []

    @deuce_mode = false
  end

  def add_player(player)
    raise("Can't add more than 2 players") if @players.size == 2
    raise(ArgumentError, 'Expected player instance') unless player.is_a?(Player)

    @players << player
  end

  def game_is_over?
    raise("Game hasn't started") unless game_started?

    @players.any? { |player| player.won_by_normal_points? || player.won_after_deuce? }
  end

  def game_started?
    @players.size == 2
  end

  def point_won_by(player)
    raise("Game hasn't started") unless game_started?
    raise(ArgumentError, 'Expected player instance') unless player.is_a?(Player)

    # if activesupport dependency is available I would have used @players.without(player) instead
    another_player = (@players.dup - [player]).first

    if @deuce_mode
      player.score_in_deuce_mode(another_player)
    else
      player.increase_normal_points_score

      if player.normal_points_score == 40 && another_player.normal_points_score == 40
        @deuce_mode = true
      end
    end
  end

  def score
    winner_player = @players.detect(&:won?)

    title = if winner_player
              "#{winner_player.name} Won"
            elsif @deuce_mode
              if @players.collect(&:deuce_score).uniq.count == 1
                'Deuce'
              else
                advantage_in_player = @players.detect { |player| player.deuce_score.positive? }
                "#{advantage_in_player.name} In Advantage"
              end
            end

    # terminal-table might be slightly an overkill here but for real tennis scoring system
    # it would be much easier with more than one game set.
    # TODO: ask a domain expert how to display results in Deuce mode properly or find real tennis live show on Youtube and see yourself
    table = Terminal::Table.new title: title do |t|
      t.add_row [@players[0].name, @players[0].normal_points_score]
      t << :separator
      t.add_row [@players[1].name, @players[1].normal_points_score]
    end
    table
  end
end

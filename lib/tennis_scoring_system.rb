# frozen_string_literal: true

require 'terminal-table'
require 'deuce_mode_fsm'

class TennisScoringSystem
  def initialize
    @player1_score = 0
    @player2_score = 0

    @deuce_mode = false

    @player1_won_by_normal_points = false
    @player2_won_by_normal_points = false
  end

  def game_is_over?
    return true if @player1_won_by_normal_points || @player2_won_by_normal_points
    return false unless @deuce_mode

    @deuce_mode.player1_won? || @deuce_mode.player2_won?
  end

  def point_won_by(player_number)
    if @deuce_mode
      if player_number == 1
        @deuce_mode.player1_scored
      else
        @deuce_mode.player2_scored
      end
    else
      score_point_normal_mode(player_number)
    end
  end

  def score
    title = if @player1_won_by_normal_points
              'Player 1 Won'
            elsif @player2_won_by_normal_points
              'Player 2 Won'
            elsif @deuce_mode
              if @deuce_mode.deuce?
                'Deuce'
              elsif @deuce_mode.player1_in_advantage?
                'Player 1 In Advantage'
              elsif @deuce_mode.player2_in_advantage?
                'Player 2 In Advantage'
              elsif @deuce_mode.player1_won?
                'Player 1 Won'
              elsif @deuce_mode.player2_won?
                'Player 2 Won'
              else
                raise "can not interpret state of #{@deuce_mode.inspect}"
              end
            end

    # terminal-table might be slightly an overkill here but for real tennis scoring system
    # it would be much easier with more than one game set.
    table = Terminal::Table.new title: title do |t|
      t.add_row ['Player 1', @player1_score]
      t << :separator
      t.add_row ['Player 2', @player2_score]
    end
    table
  end

  def score_point_normal_mode(player_number)
    if player_number == 1
      if @player1_score == 40
        @player1_won_by_normal_points = true
        return
      else
        @player1_score = increase_score(@player1_score)
      end
    elsif player_number == 2
      if @player2_score == 40
        @player2_won_by_normal_points = true
        return
      else
        @player2_score = increase_score(@player2_score)
      end
    end

    if @player1_score == 40 && @player2_score == 40
      @deuce_mode = DeuceModeFSM.new
    end
  end

  def increase_score(current_score)
    case current_score
    when 0
      15
    when 15
      30
    when 30
      40
    when 40
      raise 'score as win instead. Max number of points is reached'
    end
  end
end

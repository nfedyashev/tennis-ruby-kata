# frozen_string_literal: true

class Player
  def initialize(name:)
    @name = name
    @normal_points_score = 0

    @deuce_score = 0
  end

  attr_reader :name

  attr_reader :normal_points_score

  attr_reader :deuce_score

  def won_by_normal_points?
    !!@won_by_normal_points
  end

  def won_after_deuce?
    !!@won_after_deuce
  end

  def score_in_deuce_mode(another_player)
    raise(ArgumentError, 'Expected player instance') unless another_player.is_a?(Player)
    raise('Already won') if won?

    if another_player.deuce_score.positive?
      reset_deuce_score
      another_player.reset_deuce_score
    else
      @deuce_score = case @deuce_score
                     when 0
                       1
                     when 1
                       @won_after_deuce = true
                     end

    end
  end

  def increase_normal_points_score
    raise('Already won') if won?

    if @normal_points_score == TennisScoringSystem::NORMAL_POINTS_SCORE.size - 1
      @won_by_normal_points = true
      # intentionally returning original score to be displayed in final table results
      @normal_points_score
    else
      @normal_points_score += 1
    end
  end

  def reset_deuce_score
    @deuce_score = 0
  end

  def won?
    won_by_normal_points? || won_after_deuce?
  end
end

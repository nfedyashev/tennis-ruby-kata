# frozen_string_literal: true

require 'spec_helper'

RSpec.describe TennisScoringSystem do
  example 'win by normal points(without deuce)' do
    system = described_class.new

    system.point_won_by 1
    expect(system).not_to be_game_is_over
    system.point_won_by 1
    expect(system).not_to be_game_is_over

    system.point_won_by 2
    expect(system).not_to be_game_is_over

    expect(system.score.to_s).to include('Player 1 | 30')
    expect(system.score.to_s).to include('Player 2 | 15')

    system.point_won_by 1
    expect(system.score.to_s).to include('Player 1 | 40')
    expect(system.score.to_s).to include('Player 2 | 15')
    expect(system).not_to be_game_is_over

    system.point_won_by 1
    expect(system).to be_game_is_over
    expect(system.score.to_s).to include('Player 1 Won')
    expect(system.score.to_s).to include('Player 1 | 40')
    expect(system.score.to_s).to include('Player 2 | 15')
  end

  example 'win after deuce' do
    system = described_class.new
    3.times do
      system.point_won_by 1
      system.point_won_by 2
    end

    expect(system).not_to be_game_is_over
    expect(system.score.to_s).to include('|     Deuce     |')
    expect(system.score.to_s).to include('Player 1 | 40')
    expect(system.score.to_s).to include('Player 2 | 40')

    system.point_won_by 1
    expect(system).not_to be_game_is_over
    expect(system.score.to_s).to include('Player 1 In Advantage')
    expect(system.score.to_s).to include('Player 1  | 40')
    expect(system.score.to_s).to include('Player 2  | 40')

    # back in "equal" Deuce
    system.point_won_by 2
    expect(system).not_to be_game_is_over
    expect(system.score.to_s).to include('|     Deuce     |')
    expect(system.score.to_s).to include('Player 1 | 40')
    expect(system.score.to_s).to include('Player 2 | 40')

    system.point_won_by 2
    expect(system).not_to be_game_is_over
    expect(system.score.to_s).to include('Player 2 In Advantage')
    expect(system.score.to_s).to include('Player 1  | 40')
    expect(system.score.to_s).to include('Player 2  | 40')

    system.point_won_by 2
    expect(system).to be_game_is_over
    expect(system.score.to_s).to include('Player 2 Won')
    expect(system.score.to_s).to include('Player 1 | 40')
    expect(system.score.to_s).to include('Player 2 | 40')
  end
end

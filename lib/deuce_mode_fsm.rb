# frozen_string_literal: true

require 'aasm'

class DeuceModeFSM
  include AASM

  aasm do
    state :deuce, initial: true
    state :player1_in_advantage, :player2_in_advantage
    state :player1_won, :player2_won

    event :player1_scored do
      transitions from: :deuce, to: :player1_in_advantage
      transitions from: :player2_in_advantage, to: :deuce
      transitions from: :player1_in_advantage, to: :player1_won
    end

    event :player2_scored do
      transitions from: :deuce, to: :player2_in_advantage
      transitions from: :player1_in_advantage, to: :deuce
      transitions from: :player2_in_advantage, to: :player2_won
    end
  end
end

class Move < ActiveRecord::Base
  belongs_to :game

  validates :game, presence: true
  validates :player, inclusion: { in: TicTacToe::Game::PLAYERS }, presence: true
  validates :location, presence: true,
                       inclusion: { in: TicTacToe::Board::LOCATIONS },
                       uniqueness: { scope: [:player, :game_id] }
end

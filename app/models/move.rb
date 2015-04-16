class Move < ActiveRecord::Base
  belongs_to :game

  validates :player, inclusion: { in: TicTacToe::Game::PLAYERS }
  validates :location, inclusion: { in: TicTacToe::Board::LOCATIONS }
end

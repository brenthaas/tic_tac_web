class Game < ActiveRecord::Base
  has_many :moves, -> { order('created_at ASC') }

  def make_move(player:nil, location:)
    player ||= next_player
    game.make_move(player: player, location: location)
    moves.create(player: player, location: location)
  end

  def next_player
    game.next_player
  end

  def board
    game.board
  end

  def won?
    game.won?
  end

  def paths_won
    game.paths_won
  end

  private

  def game
    @game ||= TicTacToe::Game.new(moves)
  end
end

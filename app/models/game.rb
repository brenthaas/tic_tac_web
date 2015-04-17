class Game < ActiveRecord::Base
  has_many :moves, -> { order('created_at ASC') }

  def make_move(player:, location:)
    game.make_move(player: player, location: location)
    moves.create(player: player, location: location)
  end

  def next_player
    game.next_player
  end

  private

  def game
    @game ||= TicTacToe::Game.new(moves)
  end
end

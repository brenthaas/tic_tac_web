class GamesController < ApplicationController

  def index
    @games = Game.last(5)
  end

  def create
    game = Game.create
    redirect_to game
  end

  def show
    @board = Game.find(params[:id]).board
  end

  def make_move
    game = Game.find(params[:id])
    location = params.require(:location)
    player = game.next_player
    begin
      game.make_move(player: player, location: location)
    rescue => e
      flash[:error] = "Invalid Move! (#{player} - #{location})"
    end
    redirect_to game
  end
end

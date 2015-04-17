class GamesController < ApplicationController

  def create
    game = Game.create
    redirect_to game
  end

  def show
    @board = Game.find(params[:id]).board
  end
end

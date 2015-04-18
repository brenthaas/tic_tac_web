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
end

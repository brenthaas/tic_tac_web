class GamesController < ApplicationController

  def create
    game = Game.create
    binding.pry
    redirect_to game
  end

  def show
    @game = Game.find(params[:id])
  end
end

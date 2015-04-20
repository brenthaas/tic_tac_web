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

  def winning_squares
    game = Game.find(params[:id])
    squares = game.paths_won.flatten.uniq
    respond_to do |format|
      format.json do
        render json: { winning_squares: squares }
      end
    end
  end

  def make_move
    game = Game.find(params[:id])
    location = params.require(:location)
    player = game.next_player
    begin
      game.make_move(player: player, location: location)
      respond_to do |format|
        format.html do
          redirect_to game
        end
        format.json do
          render json: { player: player, location: location, won: game.won? }
        end
      end

    rescue => e
      error_string =  "Invalid Move! (#{player} @ #{location}) - #{e.message}"
      respond_to do |format|
        format.html do
          flash[:error] = error_string
          redirect_to game
        end
        format.json do
          render json: { errors: error_string }, status: 422
        end
      end
    end
  end
end

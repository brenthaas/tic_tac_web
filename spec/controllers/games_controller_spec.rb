require 'rails_helper'

describe GamesController do
  let(:game) { Game.create }

  describe '#create' do
    it "creates a new Game" do
      expect { post :create }.to change { Game.count }.by(1)
    end

    it "redirects to show a new game" do
      post :create
      expect(response).to redirect_to(game_url(Game.last))
    end
  end

  describe "#show" do
    it "assigns the requested game" do
      get :show, id: game.id
      expect(assigns(:board)).to eq(game.board)
    end
  end

  describe "#make_move" do
    def do_put
      put :make_move, id: game.id, player: player, location: location
    end

    let(:player) { 'X' }
    let(:location) { 'B2' }

    it "makes a move" do
      expect{ do_put }.to change(game.moves, :count).by(1)
    end

    it "sets a flash error message" do
      2.times { do_put }
      expect(flash[:error]).to be_present
    end
  end
end

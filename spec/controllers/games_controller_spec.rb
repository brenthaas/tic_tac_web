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
end

require 'rails_helper'

describe Move do
  context "validations" do
    let(:game) { Game.create }
    let(:valid_player) { TicTacToe::Game::PLAYERS.first }
    let(:valid_location) { TicTacToe::Board::LOCATIONS.first }

    specify "using valid parameters" do
      expect(
        described_class.new(
          player: valid_player, location: valid_location, game: game
        )
      ).to be_valid
    end

    it "validates players" do
      expect(
        described_class.new(player: "FOO", location: valid_location, game: game)
      ).not_to be_valid
    end

    it "validates location" do
      expect(
        described_class.new(player: valid_player, location: "FOO", game: game)
      ).not_to be_valid
    end

    it "validates player move is unique per game" do
      expect(subject).to validate_uniqueness_of(:location).
                         scoped_to([:player, :game_id])
    end

    it { is_expected.to validate_presence_of :game }
    it { is_expected.to validate_presence_of :player }
    it { is_expected.to validate_presence_of :location }
  end
end

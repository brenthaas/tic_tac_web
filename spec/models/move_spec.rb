require 'rails_helper'

describe Move do
  context "validations" do
    let(:valid_player) { TicTacToe::Game::PLAYERS.first }
    let(:valid_location) { TicTacToe::Board::LOCATIONS.first }

    specify "using valid parameters" do
      expect(
        described_class.new(player: valid_player, location: valid_location)
      ).to be_valid
    end

    it "validates players" do
      expect(
        described_class.new(player: "FOO", location: valid_location)
      ).not_to be_valid
    end

    it "validates location" do
      expect(
        described_class.new(player: valid_player, location: "FOO")
      ).not_to be_valid
    end
  end
end

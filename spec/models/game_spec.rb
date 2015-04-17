require 'rails_helper'

describe Game do

  context "when moves have been made" do
    let(:game) { described_class.create }
    let(:moves) do
      [
        {player: 'X', location: 'B2'},
        {player: 'O', location: 'B1'}
      ]
    end

    before do
      moves.each do |move|
        game.make_move(move)
      end
    end

    it "loads the moves made" do
      loaded_game = described_class.find(game.id)
      expect{
        loaded_game.make_move(player: loaded_game.next_player,
                              location: moves.last[:location])
      }.to raise_error(
        TicTacToe::Square::AlreadyOccupiedError
      )
    end
  end
end

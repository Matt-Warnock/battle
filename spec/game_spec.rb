require 'game'

RSpec.describe Game do
  let(:player_one) { double :player_one }
  let(:player_two) { double :player_two }
  let(:game) { described_class.new(player_one, player_two) }

  describe '#player_one' do
    it 'retrives player one' do
      expect(game.player_one).to eq player_one
    end
  end

  describe '#player_two' do
    it 'retrives player two' do
      expect(game.player_two).to eq player_two
    end
  end

  describe '#attack' do
    it { expect(game).to respond_to(:attack).with(1).argument }

    it 'reduces 10 HP points from player passed in' do
      expect(player_one).to receive(:receive_damage)
      game.attack(player_one)
    end
  end
end
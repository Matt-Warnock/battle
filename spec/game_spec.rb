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

  describe '#current turn' do
    it "starts off as player 1" do
      expect(game.current_turn).to eq player_one
    end
  end 

  describe '#switch_turns' do 
    it 'switches from player 1 to player 2' do
      game.switch_turns 
      expect(game.current_turn).to eq player_two
    end

    it 'switches from player 2 to player 1' do
      game.switch_turns 
      game.switch_turns 
      expect(game.current_turn).to eq player_one
    end
  end 
end
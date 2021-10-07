require 'player'

RSpec.describe Player do
  let(:player) { described_class.new('name') }

  describe '#name' do
    it { expect(player).to respond_to(:name) }

    it 'returns the player name' do
      player_name = player.name

      expect(player_name).to eq 'name'
    end
  end

  describe '#hit_points' do
    it 'returns players hit points' do
      default_points = described_class::DEFAULT_HIT_POINTS

      hit_points = player.hit_points

      expect(hit_points).to eq default_points
    end
  end

  describe '#receive_damage' do
    it "reduces the player's hit points" do
      expect { player.receive_damage }.to change { player.hit_points }.by(-10)
    end
  end

  describe '#attack' do
    it 'damages the second player passed into it' do
      second_player = Player.new('player_two')

      expect(second_player).to receive(:receive_damage)
      player.attack(second_player)
    end
  end
end

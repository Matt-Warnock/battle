class Game
  attr_reader :current_turn
  def initialize(player_one, player_two)
    @players = [player_one, player_two]
    @current_turn = player_one
  end

  def player_one
    @players.first
  end

  def player_two
    @players.last
  end

  def attack(player)
    player.receive_damage
  end

  def switch_turns
    @current_turn = @players.select {|player| player != @current_turn }.first
  end 
end

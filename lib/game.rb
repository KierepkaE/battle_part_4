require_relative './player'
class Game

  attr_reader :player1, :player2, :name

  def initialize(player1, player2)
    @player1 = Player.new(player1)
    @player2 = Player.new(player2)
  end

  def attack(player)
    player.get_hit
  end
end

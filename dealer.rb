require_relative 'deck'
require_relative 'basic_player'

class Dealer < BasicPlayer
  attr_accessor :move_number

  def initialize
    @bank = 100
  end

  def introduce_player(player)
    @player = player
  end

  def call_bet
    @bank -= 10
  end

  def needs_card
    false
    true if self.hand_value < 17
  end
end

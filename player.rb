require_relative 'player_methods'

class Player
  include PlayerMethods
  attr_reader :name, :bank

  def initialize(name)
    @name = name
    @bank = 100
  end

  def call_bet
    @bank -= 10
  end
end

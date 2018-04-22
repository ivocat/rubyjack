require_relative 'player_methods'

class Player
  include PlayerMethods
  attr_reader :name, :balance

  def initialize(name)
    @name = name
    @balance = 100
  end

  def call_bet
    @balance -= 10
  end
end

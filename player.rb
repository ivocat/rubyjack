class Player
  attr_reader :name, :balance

  def initialize(name)
    @name = name
    @balance = 100
  end

  def call_bet
    @balance -= 10
  end
end

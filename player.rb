class Player
  attr_reader :name, :balance

  def initialize(name)
    @name = name
    @balance = 100
  end
end

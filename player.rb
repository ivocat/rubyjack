require_relative 'basic_player'

class Player < BasicPlayer
  attr_reader :name

  def initialize(name)
    @name = name
    @bank = 100
  end
end

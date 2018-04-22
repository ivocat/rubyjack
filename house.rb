require_relative 'dealer'
require_relative 'player'

class House
  attr_reader :interface

  def initialize
    @dealer = Dealer.new
  end

  def create_player(name)
    @player = Player.new(name)
  end

  def play_game
    loop do
      game
    end
  end

  def add_inteface(interface)
    @interface = interface
  end

  protected

  def game
    #call bets
    #deal
    #move
    #evaluate
    #award
    #repeat
  end

  def call_bets
    @dealer.call_bet
    @player.call_bet
  end
end

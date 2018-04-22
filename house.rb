class House
  def initialize
    @dealer = Dealer.new
  end

  def create_player(name)
    @player = Player.new(name)
  end

  def call_bets
    @dealer.call_bet
    @player.call_bet
  end
end

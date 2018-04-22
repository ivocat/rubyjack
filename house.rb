class House
  def open
    @deck = Deck.new
    @dealer = Dealer.new(@deck)
    @player = Player.new
  end

  def create_player(name)
    @player = Player.new(name)
  end
end

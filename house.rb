class House
  def open
    @dealer = Dealer.new
    @player = Player.new
  end

  def create_player(name)
    @player = Player.new(name)
  end
end

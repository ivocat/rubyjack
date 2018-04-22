class House
  def initialize
    @dealer = Dealer.new
  end

  def create_player(name)
    @player = Player.new(name)
  end
end

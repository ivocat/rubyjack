class Interface
  attr_reader :house

  def execute(house)
    @house = house
    get_player_name
    play_game
  end

  def get_player_name
    puts "Enter player's name:"
    name = gets.chomp
    house.create_player(name)
  end

  def play_game
    loop do
      game
    end
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
end

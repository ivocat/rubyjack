class Interface
  attr_reader :house

  def initialize(house)
    @house = house
  end

  def execute
    get_player_name
    play_game
  end

  def get_player_name
    puts "Enter player's name:"
    name = gets.chomp
    house.create_player(name)
  end

  def play_game
    house.add_inteface(self)
    house.play_game
  end
end

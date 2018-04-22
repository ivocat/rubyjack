class Interface
  attr_reader :house

  def execute(house)
    @house = house
    get_player_name
  end

  def get_player_name
    puts "Enter player's name:"
    name = gets.chomp
    house.create_player(name)
  end
end

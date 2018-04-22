class Interface
  attr_reader :house

  def execute(house)
    @house = house
    #house.open
    #get_player_name
  end

  def get_player_name
    puts "Enter player's name:"
    name = gets.chomp

  end
end

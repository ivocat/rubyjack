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
    name = gets.chomp.capitalize
    house.create_player(name)
  end

  def play_game
    house.add_inteface(self)
    house.play_game
    #repeat_prompt
  end

  def show_desk(dealers_bank, dealers_no_of_cards, players_bank, players_cards)
    print "\n Dealer's bank: #{dealers_bank}"
    print "\n Dealer's hand: " + "XX " * dealers_no_of_cards
    print "\n #{@house.player.name}'s hand: "
    house.player.hand.each do |card|
      print card.short_name + " "
    end
    print "\n #{@house.player.name}'s points: #{@house.player.hand_value}"
  end

  def endgame_prompt
    if house.player.bank == 0
      puts "\nYou have won!"
    else
      puts "\nDealer has won."
    end
  end
end

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
    print "\n\n #{@house.player.name}'s bank: #{players_bank}"
    print "\n #{@house.player.name}'s hand: "
    house.player.hand.each do |card|
      print card.short_name + " "
    end
    print "\n #{@house.player.name}'s points: #{@house.player.hand_value}\n"
  end

  def request_action(hand_size)
    no_of_options = 2
    no_of_options += 1 if hand_size == 2
    puts "Choose what to do:"
    puts "1. Skip turn"
    puts "2. Reveal cards"
    puts "3. Draw a card" if hand_size == 2
    print "> "
    action = 0
    loop do
      action = gets.to_i
      break if action.between?(1, no_of_options)
      puts "Wrong input. Try again:"
      print "> "
    end
    action
  end

  def endgame_prompt
    if house.player.bank == 0
      puts "\nYou have won!"
    else
      puts "\nDealer has won."
    end
  end
end

class Interface
  attr_reader :house

  @@player_actions = {
    reveal: 'Reveal cards',
    skip: 'Skip turn',
    draw: 'Draw a card',
  }

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

  def show_desk(dealers_bank, dealers_no_of_cards, players_bank, players_cards, reveal = false)
    print "\n Dealer: $#{dealers_bank} | "
    if reveal
      show_actors_cards(@house.dealer)
    else
      print "XX " * dealers_no_of_cards
    end
    print "\n\n #{@house.player.name}: $#{players_bank} | "
    show_actors_cards(@house.player)
    print " (#{@house.player.hand_value} pts.)\n"
  end

  def show_actors_cards(actor)
    actor.hand.each do |card|
      print card.short_name + " "
    end
  end

  def request_action(hand_size, second_move)
    options = [:draw, :reveal, :skip]
    options.pop if second_move
    options.delete(:draw) if hand_size == 3
    options_index = {}

    puts "\nChoose what to do:"
    options.each.with_index(1) do |option, index|
      puts "#{index}. #{@@player_actions[option]}."
      options_index[index] = option
    end

    action = 0

    loop do
      action = gets.to_i
      break if action.between?(1, options.length)
      puts "Wrong input. Try again:"
      print "> "
    end
    options_index[action]
  end

  def announce_round_winner(winner)
    if winner == :noone
      puts "\nDraw!"
    else
      puts "\n#{winner.capitalize} has won!"
    end
  end

  def endgame_prompt
    if house.player.bank == 0
      puts "\nYou have won!"
    else
      puts "\nDealer has won."
    end
  end
end

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

  def show_desk(dealers_bank, dealers_no_of_cards, players_bank, players_cards, reveal = false)
    puts "\n   SHOWDOWN   \n" if reveal
    print "\n Dealer: $#{dealers_bank} | "
    if reveal
      show_actors_cards(@house.dealer)
    else
      print "XX " * dealers_no_of_cards
    end
    print " (#{@house.dealer.hand_value} pts.)" if reveal
    print "\n #{@house.player.name}: $#{players_bank} | "
    show_actors_cards(@house.player)
    print " (#{@house.player.hand_value} pts.)\n"
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
    print "> "

    action = option_chooser(options.length)
    options_index[action]
  end

  def announce_round_winner(winner)
    if winner == :noone
      puts "\nDraw!"
    else
      puts "\n#{winner.capitalize} has won the round!"
    end
    puts "\n\n   NEW ROUND   \n" if @house.game_is_on?
  end

  def endgame_prompt
    if house.player.bank == 0
      puts "\nDealer has won the game."
    else
      puts "\nYou have won the game!"
    end
    puts "\n Would you like to start over?\n1.Yes\n2.No"
    print "> "
    input = option_chooser(2)
    if input == 1
      house.start_over
    else
      exit
    end
  end

  protected

  def play_game
    house.add_inteface(self)
    house.play_game
  end

  def show_actors_cards(actor)
    actor.hand.each do |card|
      print card.short_name + " "
    end
  end

  def get_player_name
    puts "Enter player's name:"
    name = gets.chomp.capitalize
    house.create_player(name)
  end

  def option_chooser(no_of_options)
    input = 0
    loop do
      input = gets.to_i
      break if input.between?(1, no_of_options)
      puts "Wrong input. Try again:"
      print "> "
    end
    input
  end
end

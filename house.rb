require_relative 'dealer'
require_relative 'player'

class House
  attr_reader :interface, :player, :dealer, :round_end

  def initialize
    @dealer = Dealer.new
  end

  def create_player(name)
    @player = Player.new(name)
    @dealer.introduce_player(@player)
  end

  def play_game
    @round_end = false
    while @dealer.bank > 0 && @player.bank > 0
      game
    end
  interface.endgame_prompt
  end

  def add_inteface(interface)
    @interface = interface
  end

  protected

  def game
    call_bets
    deal_cards
    while !round_end
      players_move
      evaluate
    end
    #deal
    #move
    #evaluate
    #award
    #repeat
  end

  def call_bets
    @dealer.call_bet
    @player.call_bet
  end

  def deal_cards
    @dealer.first_deal
  end

  def players_move
    interface.show_desk(@dealer.bank, @dealer.hand_size, @player.bank, @player.hand)
    case action = interface.request_action(@player.hand.size)
    when 1
      #skip turn
    when 2
      @round_end = true #reveal cards
    else
      #draw a card
    end
  end
end

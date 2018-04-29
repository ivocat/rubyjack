require_relative 'dealer'
require_relative 'player'

class House
  attr_reader :interface, :player, :dealer, :in_round

  def initialize
    @dealer = Dealer.new
  end

  def create_player(name)
    @player = Player.new(name)
    @dealer.introduce_player(@player)
  end

  def play_game
    while [@dealer.bank, @player.bank].min > 0
      round
    end
  interface.endgame_prompt
  end

  def add_inteface(interface)
    @interface = interface
  end

  protected

  def round
    call_bets
    deal_cards
    @in_round = true
    while in_round
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
      return #skip turn
    when 2
      @in_round = false #reveal cards
    else
      @dealer.deal_to_player #draw a card
    end
  end

  def evaluate
    if in_round
      #repeat_round
    else
      #calculate points and award the winner
    end
  end
end

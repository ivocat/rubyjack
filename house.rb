require_relative 'dealer'
require_relative 'player'

class House
  attr_reader :interface, :player, :dealer

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
    players_move
    if @second_move
      dealers_move
      players_move
    end
    evaluate
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
    case action = interface.request_action(@player.hand.size, @second_move ||= false)
    when :skip
      @second_move = true #skip turn
    when :reveal
      @second_move = false #reveal cards
    else #when :draw
      @dealer.deal_to_player #draw a card
      @second_move = true
    end
  end

  def dealers_move
    # move
  end

  def evaluate
    #calculate points and award the winner
  end
end
